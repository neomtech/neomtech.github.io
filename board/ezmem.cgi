#!/usr/bin/perl
#--------------------------------------------------------------------#
# EzBoard 2000, Member Tool CGI.                                     #
#--------------------------------------------------------------------#
# File Name   : ezmem.cgi                                            #
# Version     : 1.0.0.1                                              #
# Programmer  : Cacolith(cacolith@i.am)   Yun-Cheol, Chae            #
# UpDate      : 2001.04.15.                                          #
#--------------------------------------------------------------------#
#  This program is formed for UNIX and Linux                         #
#  So, if you want to edit, use CAN EDIT UNIX MODE.                  #
#  like as Edit Plus, Ultra Editor, EasyPad and etc.                 #
#--------------------------------------------------------------------#

umask(000);

require  cwlib::cwfunc;
require  cwlib::cwhtml;
require  cwlib::cwconv;

&main();

#---------------------------------------------------------------------
sub SetSystem
{
  my( $str );

  $CLOCK{'Start'} = (times)[0];

  $INFO{'CGI_NAME'} = 'EzBoard 2000, Member Tool';
  $INFO{'CGI_VER'}  = '1.0.0.1';
  $INFO{'CGI_FILE'} = 'ezmem.cgi';
  $INFO{'CGI_DATE'} = '2001.04.15';
  $INFO{'PROG_NAME'} = 'Chae Yun-Cheol';
  $INFO{'PROG_ID'}   = 'cacolith';
  $INFO{'PROG_MAIL'} = 'cacolith@hitel.net';
  $INFO{'PROG_HOME'} = 'http://cacolith.i.am';
  $INFO{'PROG_INFO'} = 'Cacolith, EzNe.Net';
  if( -s "./cwsys.cgi" )
  {
    %ERRMSG = &cwFunc::ReadExtFile("./cwsys.cgi");
    $PATH{'skin'} ||= "cwlib";
    $URL{'skin'}  ||= "cwlib";
  }
  if( !$PATH{'ezMem'} && open( HANDLE, "./system.cgi" ) )
  {
    while( $str = <HANDLE> )
    {
      if( $str =~ /^SystemPath=(.*)/ )
      {
        $PATH{'ezSys'} ||= "$1";
        $PATH{'ezMem'} ||= "$1/users";
      }
      if( $str =~ /^CGIWRAPSystemPath=(.*)/ )
      {
        $URL{'ezSys'}  ||= "$1";
      }
    }
    close(HANDLE);
  }
  %CMD    = &cwFunc::GetParams();
  %COOKIE = &cwFunc::GetCookie();
  %CMD    = &cwFunc::GetARGs(@ARGV)  if(!$ENV{'REMOTE_ADDR'});
  $CMD{'name'} ||= $COOKIE{'name'};
  $CMD{'mail'} ||= $COOKIE{'mail'};
  $CMD{'pass'} ||= $COOKIE{'pass'};
  &cwFunc::SetCookie('pass',$CMD{'pass'});
  $cwFunc::LOCK{'FILE'} = "$PATH{'ezMem'}/lock.cgi";
  &cwFunc::Lock();
  $CFG{'CfgScriptFile'} = "$PATH{'ezSys'}/script/ezmem.js";

  $CONV{'INFO'}   = \%INFO;
  $CONV{'ENV'}    = \%ENV;
  $CONV{'CMD'}    = \%CMD;
  $CONV{'CFG'}    = \%CFG;
  $CONV{'PATH'}   = \%PATH;
  $CONV{'URL'}    = \%URL;
}
#---------------------------------------------------------------------
sub main
{
  &SetSystem();
  $CMD{'act'} ||= 'list';
  &cwHTML::PutHTMLHead();
#  &HashList(%CMD);
  if( $CMD{'act'} eq "reg" )
  {
    &Regist();
  }
  else
  {
    &CheckPassWord();
    if( !$CMD{'db'} || $CMD{'db'} eq "member" )
    {
      if( $CMD{'act'} eq 'list' )
      {
        &MemList();
      }
      elsif( $CMD{'act'} =~ /^(add|del|save)$/ )
      {
        &SaveMemFile();
        &MemList();
      }
      elsif( $CMD{'act'} eq 'info' )
      {
        &MemInfo();
      }
      else
      {
        &PutSkinBin();
      }
    }
    else
    {
      if( $CMD{'act'} eq 'save' )
      {
        &SaveUserList();
        &EditUserList();
      }
      else
      {
        &EditUserList();
      }
    }
  }
  &cwHTML::PutHTMLTail();
  &cwFunc::UnLock();
  exit();
}
#---------------------------------------------------------------------
sub ReadMemFile
{
  my( $str, %hash );
  $CMD{'db'} =~ s/\/(\w+?)$/$1/;
# id=pass,group,name,mail,home,etc
  $str = $CMD{'db'} eq "member" ? "member" : "newlist";
  $CMD{'dbfile'} = "$PATH{'ezMem'}/$str.cgi";
  %hash = &cwFunc::ReadCfgFile("$PATH{'ezMem'}/$str.cgi");
  return  %hash;
}
#---------------------------------------------------------------------
sub SaveMemFile
{
  my( $str, @array, %hash, $id );
  %MEMLIST = &ReadMemFile();
  if( $CMD{'db'} eq "member" 
      && open( MEMHANDLE, "> $PATH{'ezMem'}/member.cgi" ) )
  {
    binmode(MEMHANDLE);
    foreach $id ( sort(keys(%MEMLIST)) )
    {
      $id =~ s/ +$//g;
      next  if( !$id );
      if( $id eq $CMD{'uid'} )
      {
        next  if( $CMD{'act'} eq 'del' );
        $hash{'uid'} = $CMD{'uid'};
        $MEMLIST{$id} = "$CMD{'upass'},$CMD{'uperm'},$CMD{'uname'},$CMD{'umail'},$CMD{'uhome'},$CMD{'urest'}";
        &SendMail(%hash);
      }
      print MEMHANDLE "$id=$MEMLIST{$id}\n";
    }
    close(MEMHANDLE);
  }
  else
  {
    if( open( NEWHANDLE, "> $PATH{'ezMem'}/newlist.cgi" ) )
    {
      binmode(NEWHANDLE);
      foreach $id ( sort(keys(%MEMLIST)) )
      {
        $id =~ s/ +$//g;
        next  if( !$id );
        if( $id eq $CMD{'uid'} && $CMD{'act'} eq 'add' )
        {
          if( open( MEMHANDLE, ">> $PATH{'ezMem'}/member.cgi" ) )
          {
            $hash{'uid'} = $CMD{'uid'};
            ( $hash{'upass'}, $hash{'uperm'}, $hash{'uname'}, $hash{'umail'}, $hash{'uhome'}, $hash{'urest'} ) = split(/\,/,$MEMLIST{$CMD{'uid'}},6);
            $hash{'upass'} = &GetPass($hash{'uid'});
            $MEMLIST{$id} = "$hash{'upass'},$hash{'uperm'},$hash{'uname'},$hash{'umail'},$hash{'uhome'},$hash{'urest'}";
            binmode(MEMHANDLE);
            print MEMHANDLE "$id=$MEMLIST{$id}\n";
            close(MEMHANDLE);
            &SendMail(%hash);
            if( open( MAILHANDLE, ">> $PATH{'ezMem'}/allow.cgi" ) )
            {
              binmode(MAILHANDLE);
              print MAILHANDLE "$id=$MEMLIST{$id}\n";
              close(MAILHANDLE);
            }
            @array = &cwFunc::ReadTxtFile("$PATH{'ezMem'}/member.cgi");
            if( open( COUNTHANDLE, "> $PATH{'ezMem'}/usercount.cgi" ) )
            {
              binmode(COUNTHANDLE);
              print COUNTHANDLE ( $#array + 1 );
              close(COUNTHANDLE);
            }
          }
          if( !(-d "$PATH{'ezMem'}/group" ) )
          {
            mkdir( "$PATH{'ezMem'}/group", 0777 );
          }
          if( open( MEMHANDLE, ">> $PATH{'ezMem'}/group/user1.cgi" ) )
          {
            binmode(MEMHANDLE);
            print MEMHANDLE "$id\n";
            close(MEMHANDLE);
          }
        }
        elsif( $CMD{'act'} eq 'del' && $id eq $CMD{'uid'} )
        {
          $hash{'uid'} = $CMD{'uid'};
          ( $hash{'upass'}, $hash{'uperm'}, $hash{'uname'}, $hash{'umail'}, $hash{'uhome'}, $hash{'urest'} ) = split(/\,/,$MEMLIST{$CMD{'uid'}},6);
          &SendMail(%hash);
          if( open( MAILHANDLE, ">> $PATH{'ezMem'}/deny.cgi" ) )
          {
            binmode(MAILHANDLE);
            print MAILHANDLE "$id=$MEMLIST{$id}\n";
            close(MAILHANDLE);
          }
          next;
        }
        elsif( $CMD{'act'} eq 'save' && $id eq $CMD{'uid'} )
        {
# id=pass,group,name,mail,home,etc
          print NEWHANDLE "$id=$CMD{'upass'},$CMD{'uperm'},$CMD{'uname'},$CMD{'umail'},$CMD{'uhome'},$CMD{'uetc'}\n";
        }
        else
        {
          print NEWHANDLE "$id=$MEMLIST{$id}\n";
        }
      }
      close(NEWHANDLE);
    }
  }
}
#---------------------------------------------------------------------
sub MemInfo
{
  my( $key, @array, %hash, $HTML, $Start, $End );
  %MEMLIST = &ReadMemFile();
  if( grep(/^(FILE NOT FOUND|CAN NOT READ FILE)/,keys(%MEMLIST)) )
  {
    undef(%MEMLIST);
  }
  $CONV{'MEMBER'} = \%MEMLIST;
  $CONV{'USER'} = \%hash;
  $CONV{'DBList'} = \$DBList;
  $HTML = &cwFunc::ReadBinFile("$PATH{'skin'}/ezminfo$CFG{'CfgSkinExt'}");
  @array = sort(keys(%MEMLIST));
  $hash{'uid'} = $CMD{'uid'};
  ( $hash{'upass'}, $hash{'uperm'}, $hash{'uname'}, $hash{'umail'}, $hash{'uhome'}, $hash{'urest'} ) = split(/\,/,$MEMLIST{$CMD{'uid'}},6);
  print &cwConv::ConvValue($HTML);
}
#---------------------------------------------------------------------
sub MemList
{
  my( $key, @array, %hash, $HTML, $Start, $End, $i );
  %MEMLIST = &ReadMemFile();
  if( grep(/^(FILE NOT FOUND|CAN NOT READ FILE)/,keys(%MEMLIST)) )
  {
    undef(%MEMLIST);
  }
#  &HashList(%MEMLIST);
  $CONV{'MEMBER'} = \%MEMLIST;
  $CONV{'USER'} = \%hash;
  $CONV{'DBList'} = \$DBList;
  $hash{'allow'} = &cwFunc::ReadBinFile("$PATH{'ezMem'}/usercount.cgi");
  $hash{'allow'} = 0  if( $hash{'allow'} =~ /^(FILE NOT FOUND|CAN NOT READ FILE)/ );
  &PutSkinBin('ezmhead');
  $HTML = &cwFunc::ReadBinFile("$PATH{'skin'}/ezmlist$CFG{'CfgSkinExt'}");
  @array = sort(keys(%MEMLIST));
  $CMD{'page'} ||= 1;
  $CFG{'CfgLinePerPage'} ||= 10;
  $Start = ( $CMD{'page'} - 1 ) * $CFG{'CfgLinePerPage'};
  $Start = 0  if( $Start < 0 );
  $End   = $CMD{'page'} * $CFG{'CfgLinePerPage'} - 1;
  $End = $#array  if( $End > $#array );
  $Start = $End if( $Start > $End );
  for( $i = $Start; $i <= $End; $i++ )
  {
    $key = $array[$i];
    next  if(!$key||!$MEMLIST{$key});
    %hash = ();
    $hash{'uid'} = $key;
    $hash{'num'} = $i + 1;
    ( $hash{'upass'}, $hash{'uperm'}, $hash{'uname'}, $hash{'umail'}, $hash{'uhome'}, $hash{'rtime'}, $hash{'atime'}, $hash{'uip'} ) = split(/\,/,$MEMLIST{$key},9);
    if( $hash{'uhome'} )
    {
      $hash{'uhome'} = "http://$hash{'uhome'}"  if( $hash{'uhome'} !~ /^http\:\/\//i );
      $hash{'uhome'} = "<A HREF=\"$hash{'uhome'}\" TARGET=\"$CFG{'CfgLinkTarget'}\">$hash{'uhome'}</A>";
    }

    $hash{'menu'} = !$CMD{'db'} ? "&nbsp;<A HREF=\"JavaScript:SubMit('add','$hash{'uid'}','$hash{'uname'}')\" TITLE=\"$hash{'uip'}\">승인</A>&nbsp;|" : "";
    $hash{'menu'} .= "&nbsp<A HREF=\"JavaScript:SubMit('del','$hash{'uid'}','$hash{'uname'}')\" TITLE=\"$hash{'uip'}\">삭제</A>&nbsp;|";
    $hash{'menu'} .= "&nbsp;<A HREF=\"JavaScript:SubMit('info','$hash{'uid'}','$hash{'uname'}')\" TITLE=\"$hash{'uip'}\">수정</A>&nbsp;";
    print &cwConv::ConvValue($HTML);
  }
  @DIR = &cwFunc::ReadDirFile("$PATH{'ezMem'}/group");
  $DBList = "|";
  for( $i = 0; $i < @DIR; $i++ )
  {
    next  if( $DIR[$i] =~ /^\./ || $DIR[$i] !~ /\.cgi$/ );
    $DIR[$i] =~ s/\.cgi$//;
    $DBList .= "<OPTION VALUE\=\"$DIR[$i]\"\>$DIR[$i]|";
  }
  @DIR = split(/\|/,$DBList);
  $CONV{'DBLIST'} = \@DIR;
  $URL{'prev'} = "<A HREF=\"$INFO{'CGI_FILE'}?db=$CMD{'db'}&page=".( $CMD{'page'} - 1 )."\">"  if( $Start > 0 );
  $URL{'next'} = "<A HREF=\"$INFO{'CGI_FILE'}?db=$CMD{'db'}&page=".( $CMD{'page'} + 1 )."\">"  if( $End < $#array );

  &PutSkinBin('ezmtail');
}
#---------------------------------------------------------------------
sub CheckPassWord
{
  my( $str );
  if( $CMD{'pass'} && open( HANDLE, "< $PATH{'ezMem'}/password.cgi" ) )
  {
    binmode(HANDLE);
    seek(HANDLE,0,0);
    sysread(HANDLE,$str,13);
    close(HANDLE);
    if( crypt($CMD{'pass'},'ez2000') ne $str )
    {
      &PutSkinBin();
      &cwFunc::UnLock();
      exit();
    }
    $PassOk = 1;
  }
  elsif( ( $CMD{'pass'} && ( $CMD{'pass'} eq $CMD{'repass'} )
           || $CMD{'npass'} && ( $CMD{'npass'} eq $CMD{'repass'} )
         )
         && !( -s "$PATH{'ezMem'}/password.cgi" ) )
  {
    if( open( HANDLE, "> $PATH{'ezMem'}/password.cgi" ) )
    {
      binmode(HANDLE);
      print HANDLE crypt($CMD{'pass'},'ez2000');
      close(HANDLE);
      $PassOk = 1;
    }
  }
  elsif( !( -s "$PATH{'ezMem'}/password.cgi" ) )
  {
    &PutSkinBin('ezmpassnew');
    &cwFunc::UnLock();
    exit();
  }
  else
  {
    &PutSkinBin();
    &cwFunc::UnLock();
    exit();
  }
}
#---------------------------------------------------------------------
sub PutSkinBin
{
  my( $str ) = @_;
  my( $HTML );
  $str ||= 'ezmpass';
  $CFG{'Title'} = "$CMD{'act'}";
  $HTML = &cwFunc::ReadBinFile("$PATH{'skin'}/$str$CFG{'CfgSkinExt'}");
  print  &cwConv::ConvValue($HTML);
}
#---------------------------------------------------------------------
sub HashList(\%)
{
  my( %hash ) = @_;
  my( $key );
  print "<PRE>\n";
  foreach $key ( sort keys %hash )
  {
    next  if( !$key );
    printf( " %-20s : %s\n", "\'$key\'", $hash{$key} );
  }
  print "</PRE>\n";
}
#---------------------------------------------------------------------
sub SendMail
{
  my( %hash ) = @_;
  $CONV{'USER'} = \%hash;
  if( $CFG{'CfgSMTPServer'} || $CFG{'CfgSMTP'} || $CMD{'smtp'} )
  {
    require cwlib::cwsockmail;
    $hash{'smtp'} = $CMD{'smtp'} || $CFG{'CfgSMTPServer'} || $CFG{'CfgSMTP'};
  }
  else
  {
    require cwlib::cwsendmail;
  }
  if( $CMD{'act'} eq 'del' )
  {
    $CFG{'CfgDenyMailSubject'} ||= "죄송합니다. 가입을 허락해드릴 수 없습니다.";
    $hash{'subject'} = $CFG{'CfgDenyMailSubject'};
    $CFG{'CfgTimeFormat'} ||= "%Y년 %M월 %D일, %h시 %m분";
    $HTML = &cwFunc::ReadBinFile("$PATH{'skin'}/ezmdeny$CFG{'CfgSkinExt'}");
  }
  elsif( $CMD{'act'} eq 'save' )
  {
    $CFG{'CfgModiMailSubject'} ||= "$hash{'uname'}님의 정보가 수정되었습니다.";
    $hash{'subject'} = $CFG{'CfgModiMailSubject'};
    $CFG{'CfgTimeFormat'} ||= "%Y년 %M월 %D일, %h시 %m분";
    $HTML = &cwFunc::ReadBinFile("$PATH{'skin'}/ezmmodi$CFG{'CfgSkinExt'}");
  }
  else
  {
    $CFG{'CfgAllowMailSubject'} ||= "가입이 처리되었습니다.";
    $hash{'subject'} = $CFG{'CfgAllowMailSubject'};
    $CFG{'CfgTimeFormat'} ||= "%Y년 %M월 %D일, %h시 %m분";
    $HTML = &cwFunc::ReadBinFile("$PATH{'skin'}/ezmallow$CFG{'CfgSkinExt'}");
  }
  $hash{'fromname'} = $CMD{'name'};
  $hash{'frommail'} = $CMD{'mail'};
  $hash{'toname'} = $hash{'uname'};
  $hash{'tomail'} = $hash{'umail'};
  $hash{'time'} = &cwFunc::GetTimeStr($CFG{'CfgTimeFormat'});
  $hash{'message'} = &cwConv::ConvValue($HTML);
  &SendMailFunc(%hash);
}
#---------------------------------------------------------------------
sub GetPass($)
{
  my( $pass ) = @_;
	my( $temp, $len, $i, $ch, $ch1, $ch2, $ch3 );
	$len = length( $pass );
	for( $i = 0; $i < $len; $i++ )
	{
		$ch = substr($pass, $i, 1);
		$temp .= sprintf( "%02x", ord($ch) + $i );
	}

	$pass = "";
	$len = length( $temp );
	for( $i = 0; $i < $len; $i+=3 )
	{
		$ch1 = substr($temp, $i,   1);
		$ch2 = substr($temp, $i+1, 1);
		$ch3 = substr($temp, $i+2, 1);
		$pass .= sprintf( "%02x", (ord($ch1)+ord($ch2)+ord($ch3)) % 256 );
	}
	$pass = substr( $pass, 0, 8 );
	return	$pass;
}
#---------------------------------------------------------------------
sub EditUserList
{
  my( @array, $HTML, $str );
  my( $UserFile ) = "$PATH{'ezMem'}/group/$CMD{'db'}$CFG{'CfgSkinExt'}";
  @array = &cwFunc::ReadTxtFile("$UserFile")  if( -e $UserFile );
  $str = join ("\r\n",sort(@array));
  $str =~ s/\r\n\r\n/\r\n/g;
  @array = split(/\r\n/,$str);
  $total = $#array + 1;
  $CONV{'USER'} = \@array;
  $HTML = &cwFunc::ReadBinFile("$PATH{'skin'}/ezmuser$CFG{'CfgSkinExt'}");
  print  &cwConv::ConvValue($HTML);
}
#---------------------------------------------------------------------
sub SaveUserList
{
  my( $UserFile ) = "$PATH{'ezMem'}/group/$CMD{'db'}$CFG{'CfgSkinExt'}";
  $CMD{'userlist'} =~ s/\r\n/\n/g;
  if( open( HANDLE, "> $UserFile" ) )
  {
    binmode(HANDLE);
    print HANDLE $CMD{'userlist'};
    close(HANDLE);
  }
}
#---------------------------------------------------------------------
sub Regist
{
  my( %hash );
  my( $UserFile ) = "$PATH{'ezMem'}/newlist$CFG{'CfgSkinExt'}";
  if( !$CMD{'uid'} || !$CMD{'uname'} || !$CMD{'umail'} )
  {
    if(!$CMD{'uname'})
    {
      $CFG{'ErrorTitle'}   = $ERRMSG{'NoName'}    || "이름을 넣어주세요.";
      $CFG{'ErrorMessage'} = $ERRMSG{'NoNameMsg'} || "이름이 없으면 처리되지 않습니다.";
    }
    elsif(!$CMD{'uid'})
    {
      $CFG{'ErrorTitle'}   = $ERRMSG{'NoID'}    || "아이디를 넣어주세요.";
      $CFG{'ErrorMessage'} = $ERRMSG{'NoIDMsg'} || "아이디가 없으면 처리되지 않습니다.";
    }
    elsif(!$CMD{'umail'})
    {
      $CFG{'ErrorTitle'}   = $ERRMSG{'NoMail'}    || "이메일을 넣어주세요.";
      $CFG{'ErrorMessage'} = $ERRMSG{'NoMailMsg'} || "이메일이 없으면 비밀번호를 받아보실 수 없습니다.";
    }
    $CFG{'CfgReURL'} = "JavaScript:this.history.go(-1)";
    &PutSkinBin("ezmmsg");
    &cwHTML::PutHTMLTail();
    &cwFunc::UnLock();
    exit();
  }
  %hash = &cwFunc::ReadCfgFile("$PATH{'ezMem'}/newlist.cgi");
  if( defined($hash{$CMD{'uid'}}) )
  {
    $CFG{'ErrorTitle'}   = $ERRMSG{'SameID'}    || "중복된 아이디입니다.";
    $CFG{'ErrorMessage'} = $ERRMSG{'SameIDMsg'} || "다른 아이디로 신청해주십시오.";
    $CFG{'CfgReURL'} = "JavaScript:this.history.go(-1)";
    &PutSkinBin("ezmmsg");
    &cwHTML::PutHTMLTail();
    &cwFunc::UnLock();
    exit();
  }
  %hash = &cwFunc::ReadCfgFile("$PATH{'ezMem'}/member.cgi");
  if( defined($hash{$CMD{'uid'}}) )
  {
    $CFG{'ErrorTitle'}   = $ERRMSG{'SameID'}    || "중복된 아이디입니다.";
    $CFG{'ErrorMessage'} = $ERRMSG{'SameIDMsg'} || "다른 아이디로 신청해주십시오.";
    $CFG{'CfgReURL'} = "JavaScript:this.history.go(-1)";
    &PutSkinBin("ezmmsg");
    &cwHTML::PutHTMLTail();
    &cwFunc::UnLock();
    exit();
  }
  if( open( HANDLE, ">> $UserFile" ) )
  {
    binmode(HANDLE);
    print HANDLE "$CMD{'uid'}=$CMD{'upass'},$CMD{'uperm'},$CMD{'uname'},$CMD{'umail'},$CMD{'uhome'},$CMD{'urest'}\n";
    close(HANDLE);
    $CFG{'ErrorTitle'}   = $ERRMSG{'RegOk'}    || "가입이 신청되었습니다.";
    $CFG{'ErrorMessage'} = $ERRMSG{'RegOkMsg'} || "비밀번호는 이메일로 보내드립니다.";
    $CFG{'CfgReURL'}     ||= "JavaScript:this.history.go(-2)";
    &PutSkinBin("ezmmsg");
  }
  &cwHTML::PutHTMLTail();
  &cwFunc::UnLock();
  exit();
}
#---------------------------------------------------------------------
