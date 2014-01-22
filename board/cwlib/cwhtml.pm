#--------------------------------------------------------------------#
# HTML Library for cwPlus                                            #
#--------------------------------------------------------------------#
# File Name   : cwHtml.cgi                                           #
# Version     : 1.0.0.0                                              #
# Programmer  : Electronics, Chonbuk National Univ.                  #
#                       Cherie  (cherie@hello.to) Kyeong-Sam, Chae   #
# Powered     : Physics, Chonbuk National Univ.                      #
#                       Cacolith(cacolith@i.am)   Yun-Cheol, Chae    #
# UpDate      : 2000.12.24.                                          #
#--------------------------------------------------------------------#
#  This program is formed for UNIX and Linux                         #
#  So, if you want to edit, use CAN EDIT UNIX MODE.                  #
#  like as Edit Plus, Ultra Editor, EasyPad and etc.                 #
#--------------------------------------------------------------------#

package cwHTML;
require 5.000;

use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS );

$VERSION = "1.0.0.0";

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(
             PutHTMLHead
             PutHTMLTail
          );

%EXPORT_TAGS = (
    all     => [ @EXPORT, @EXPORT_OK ],
);

#---------------------------------------------------------------------
# This function for HTML Head.
# %CSS is construction of CSS and etc.
# See ezcfg.cgi
sub PutHTMLHead
{
  $CLOCK{'dummy'} = (times)[0];

  print "Content-type: text/html\n\n";
  print "<HTML>\n<HEAD>\n";
  print "<META HTTP-EQUIV=\"content-type\" CONTENT=\"text/html; charset=$CSS{'CfgLang'}\">\n";
  &PutLogo();
  &PutCSS();
  &PutScript();
  print "</HEAD>\n";

  $CLOCK{'PutHTMLHead'} = (times)[0] - $CLOCK{'dummy'};

  return;
}
#---------------------------------------------------------------------
# This function is for ending HTML.
sub PutHTMLTail
{
  $CLOCK{'dummy'} = (times)[0];

  if( $main::CLOCK{'Start'} )
  {
    printf( "\n\n<!-- CPU Time %0.2f seconds -->\n\n</HTML>\n", (times)[0] - $main::CLOCK{'Start'} );
  }

  $CLOCK{'PutHTMLTail'} = (times)[0] - $CLOCK{'dummy'};

  return;
}
#---------------------------------------------------------------------
sub PutLogo
{
  return  if( !$ENV{'REMOTE_ADDR'} || !$main::INFO{'CGI_NAME'} );
  $CLOCK{'dummy'} = (times)[0];

  print "<!-", "-" x 64, "-->\n";
  printf( "<!- %-62s -->\n", $main::INFO{'CGI_NAME'} );
  print "<!-", "-" x 64, "-->\n";
  &PutLogoLine( "File Name", $main::INFO{'CGI_FILE'} );
  &PutLogoLine( "Version",   $main::INFO{'CGI_VER'}   );
  &PutLogoLine( "Date",      $main::INFO{'CGI_DATE'}  );
  &PutLogoLine( "Programer", $main::INFO{'PROG_INFO'} );
  &PutLogoLineSub( "Name",     $main::INFO{'PROG_NAME'} );
  &PutLogoLineSub( "ID",       $main::INFO{'PROG_ID'}   );
  &PutLogoLineSub( "E-Mail",   $main::INFO{'PROG_MAIL'} );
  &PutLogoLineSub( "Homepage", $main::INFO{'PROG_HOME'} );
  if( $INFO{'UPDT_INFO'} )
  {
    &PutLogoLine( "Powered", $main::INFO{'UPDT_INFO'} );
    &PutLogoLineSub( "Name",   $main::INFO{'UPDT_NAME'} );
    &PutLogoLineSub( "ID",     $main::INFO{'UPDT_ID'}   );
    &PutLogoLineSub( "E-Mail", $main::INFO{'UPDT_MAIL'} );
  }
  &PutLogoLine( "Last UpDate", $main::INFO{'UPDT_DATE'} );
  print "<!-", "-" x 64, "-->\n";
  &PutLogoLine( "Server Name", $ENV{'SERVER_NAME'}     );
  &PutLogoLine( "Server IP",   $ENV{'SERVER_ADDR'}     );
  &PutLogoLine( "Server OS",   &isOS()                 );
  &PutLogoLine( "Server S/W",  $ENV{'SERVER_SOFTWARE'} );
  &PutLogoLine( "Perl Version", $] );
  print "<!-", "-" x 64, "-->\n";
  print "<META NAME=\"author\" CONTENT=\"$main::INFO{'PROG_NAME'}\">\n";
  print "<META NAME=\"discript\" CONTENT=\"$main::INFO{'CGI_NAME'}\">\n";
  print "<META NAME=\"keyword\" CONTENT=\"$main::INFO{'PROG_NAME'} $main::INFO{'CGI_NAME'} $main::INFO{'PROG_ID'} $main::INFO{'META_KEYWORD'}\">\n";
  print "<META NAME=\"program\" CONTENT=\"$main::INFO{'CGI_FILE'}\">\n";

  $CLOCK{'PutLogo'} = (times)[0] - $CLOCK{'dummy'};

  return;
}
#---------------------------------------------------------------------
sub PutLogoLine
{
  printf( "<!- %-14s : %-45s -->\n", $_[0], $_[1] );
}
#---------------------------------------------------------------------
sub PutLogoLineSub
{
  printf( "<!-                  %-8s : %-34s -->\n", $_[0], $_[1] );
}
#---------------------------------------------------------------------
sub PutCSS
{
  my( @vertcal )    = ('center','bottom','top');
  my( @horizontal ) = ('center','right','left');

  $CLOCK{'dummy'} = (times)[0];

  print "<STYLE TYPE=\"text/css\">\n";
  if(defined($main::CFG{'CfgLinkType'}))
  {
    &PutDecoration( "A", $main::CFG{'CfgLinkType'} );
    print " A:link      { color:$main::CFG{'CfgLinkCol'}; }\n";
    print " A:visited   { color:$main::CFG{'CfgVLinkCol'}; }\n";
    &PutDecoration( "A:visited", $main::CFG{'CfgVLinkType'} );
    print " A:active    { color:$main::CFG{'CfgALinkCol'}; }\n";
    &PutDecoration( "A:active",  $main::CFG{'CfgALinkType'} );
    print " A:hover     { color:$main::CFG{'CfgHLinkCol'}; }\n";
    &PutDecoration( "A:hover",   $main::CFG{'CfgHLinkType'} );
  }
  print " body,pre,table,tr,td,p,br,div,form,select,option,input,textarea\n";
  print "             { color:$main::CFG{'CfgTxtCol'}; font-family:$main::CFG{'CfgTxtFont'}; font-size:$main::CFG{'CfgTxtSize'}pt; }\n";
  &PutDecoration( "body", $main::CFG{'CfgTxtType'} );
  print " body        { bakcground-color:$main::CFG{'CfgBkCol'}; }\n";
  if( $main::CFG{'CfgBkImg'} )
  {
    print " body        { bakcground-image:url(\"$main::CFG{'CfgBkCol'}\"); ";
    if( $main::CFG{'CfgBkImgFix'} )
    {
      print "background-attachment:fixed; ";
    }
    if( $main::CFG{'CfgBkImgOnce'} )
    {
      print "background-repeat:no-repeat; ";
      print "background-position:",($vertical[$main::CFG{'CfgBkImgVAlign'}])
            ," ",($horizontal[$main::CFG{'CfgBkImgAlign'}])
            ,";";
    }
    print "}\n";
  }
  print "</STYLE>\n";
  if( $main::CFG{'CfgCSSFile'} )
  {
    print "<LINK rel=\"style\" TYPE=\"text/css\" SRC=\"$main::CFG{'CfgCSSFile'}\">\n";
  }

  $CLOCK{'PutCSS'} = (times)[0] - $CLOCK{'dummy'};

  return;
}
#---------------------------------------------------------------------
sub PutDecoration
{
  my( $name, $option ) = @_;
  my( @line ) = ('none','underline','overline','overline','line-through');
  printf( " %-11s { text-decoration:%s; } \n", $name, $line[$option] );;
  if( $option == 3 )
  {
    printf( " %-11s { text-decoration:underline; } \n", $name );;
  }
}
#---------------------------------------------------------------------
sub PutScript
{
#  print "<SCRIPT LANGUAGE=\"JavaScript\" SRC=\"$main::URL{'CfgScript'}/cwDefScript.js\"></SCRIPT>\n";
  if( $main::CFG{'CfgScriptFile'} )
  {
    print "<SCRIPT LANGUAGE=\"JavaScript\" SRC=\"$main::CFG{'CfgScriptFile'}\"></SCRIPT>\n";
  }
}
#---------------------------------------------------------------------
# This function just redirect URL.
sub ReFresh
{
  my($GOTO,$TIME) = @_;
  $TIME = 0  unless($TIME);
  print "Content-type: text/html\n\n";
  print "<HTML>\n<HEAD>\n";
  print "<META HTTP-EQUIV=\"content-type\" CONTENT=\"text/html; charset=euc-kr\">\n";
  print "<META HTTP-EQUIV=\"refresh\" CONTENT=\"$TIME;url=$GOTO\">\n";
  print "<TITLE>Please wait...</TITLE>\n";
  print "</HEAD>\n";
  print "<BODY>\n</BODY>\n</HTML>\n";
}
#---------------------------------------------------------------------
# This function for BODY tag.
# It's for not-supply-CSS browser.
sub PutBODYHead
{
  $main::CFG{'CfgBkCol'}    ||= "#FFFFFF";
  $main::CFG{'CfgTxtCol'}   ||= "#000000";
  $main::CFG{'CfgLinkCol'}  ||= "#0000FF";
  $main::CFG{'CfgALinkCol'} ||= "#FF0000";
  $main::CFG{'CfgVLinkCol'} ||= "#000099";

  print "<BODY BGCOLOR=\"$main::CFG{'CfgBkCol'}\"";
  print " TEXT=\"$main::CFG{'CfgTxtCol'}\"";
  print " LINK=\"$main::CFG{'CfgLinkCol'}\"";
  print " ALINK=\"$main::CFG{'CfgALinkCol'}\"";
  print " VLINK=\"$main::CFG{'CfgVLinkCol'}\"";
  if( defined($main::CFG{'CfgLeftMargin'}) )
  {
    print " LEFTMARGIN=\"$main::CFG{'CfgLeftMargin'}\"";
    print " MARGINWIDTH=\"$main::CFG{'CfgLeftMargin'}\"";
  }
  if( defined($main::CFG{'CfgTopMargin'}) )
  {
    print " TOPMARGIN=\"$main::CFG{'CfgTopMargin'}\"";
    print " MARGINHEIGHT=\"$main::CFG{'CfgTopMargin'}\"";
  }
  if( $main::CFG{'CfgOnLoad'} )
  {
    print " onLoad=\"$main::CFG{'CfgOnLoad'}\"";
  }
  print ">\n";

  return;
}
#---------------------------------------------------------------------
sub PutBODYTail
{
  print "</BODY>\n";
  return;
}
#---------------------------------------------------------------------
sub ConvLink
{
  my( $REF ) = @_;
  my( $str, @array, $ext, $LinkedStr, $url, $length, $isEMBED );
  my( $quote, $bracket );

  $LinkedStr = "";

  if( $REF =~ /^ARRAY\(0x/ )
  {
    $str = join('',@{$REF});
    @array = split(//,$str);
  }
  elsif( $REF =~ /^SCALAR\(0x/ )
  {
    @array = split(//,${$REF});
  }
  else
  {
    @array = split(//,$REF);
  }
  $str = join('',@array);

  while( $str )
  {
    if( $str =~ /^\<(?!\/)(\S+?).+?\>(.+?\<\/\1\>)?/ )
    {
      $url = $&;
      $length = length($url);
    }
    elsif( $str =~ /^([\'\"]?)(((http|ftp|mms|telnet)\:\/\/|www\.)\S+)\1/ )
    {
      $quote = $1;
      $url = $2;
      $length = length($&);

      if( ( $bracket = substr($LinkedStr,-1,1) ) =~ /[\(\[\{]/ )
      {
        $bracket = $bracket eq '(' ? '\)' : 
                   ( $bracket eq '[' ? '\]' :
                     ( $bracket eq '{' ? '\}' : '' )
                   );
        $url =~ s/(\S+)($bracket)/$1/;
        $length = length($url) + ( length($quote) * 2 );
      }

      ( $ext = $url ) =~ s/.*\.(.+?)$/$1/g;
      $url = "http://$url"  if( $url =~ /www\./ );

      $array[0] = ";$main::CFG{'Image'};";
      $array[1] = ";$main::CFG{'Sound'};$main::CFG{'Movie'};$main::CFG{'Embed'};";

      $array[0] =~ s/\;\;/\;/g;
      $array[1] =~ s/\;\;/\;/g;

      if( $ext && $array[0] =~ /\;$ext\;/ )
      {
        $url = "<IMG SRC=\"$url\" BORDER=\"0\" ALT=\"$url\">";
      }
      elsif( $ext && $array[1] =~ /\;$ext\;/ )
      {
        $url = "<EMBED SRC=\"$url\" ALT=\"$url\">";
      }
      else
      {
        $url = "$quote<A HREF=\"$url\" TARGET=\"$main::CFG{'CfgLinkTarget'}\">$url</A>$quote";
      }
    }
    elsif( $str =~ /^([\'\"]?)(www\.\S+)\1/ )
    {
      $quote = $1;
      $url = $2;
      $length = length($&);
      if( ( $bracket = substr($LinkedStr,-1,1) ) =~ /[\(\[\{]/ )
      {
        $bracket = $bracket eq '(' ? '\)' : 
                   ( $bracket eq '[' ? '\]' :
                     ( $bracket eq '{' ? '\}' : '' )
                   );
        $url =~ s/(\S+)($bracket)/$1/;
        $length = length($url) + ( length($quote) * 2 );
      }

      $url = "$quote<A HREF=\"http://$url\" TARGET=\"$main::CFG{'CfgLinkTarget'}\">$url</A>$quote";
    }
    elsif( $str =~ /^(\S*?[\'\"]?)((mailto\:\S+?|[\w\!\#\$\%\^]+?)\@\w+?\.[\w\!\@\#\$\%\^\&\*]+)\1/ )
    {
      $quote = $1;
      $url = $2;
      $length = length($&);

      $url =~ s/^(mailto\:)//g;
      $url = "$quote<A HREF=\"mailto:$url\">$url</A>$quote";
    }
    else
    {
      $url = substr($str,0,1);
      $length = 1;
    }

    $LinkedStr .= $url;
    $str = substr($str,$length,length($str));
  }

  return  $LinkedStr;
}
#---------------------------------------------------------------------
sub isOS
{
  my($OS) = $^O;
  if($OS=~/Win/i)
  {
    if($OS=~/95/)   { $OS = 'Win 95'; }
    if($OS=~/98/)   { $OS = 'Win 98'; }
    if($OS=~/5\./)  { $OS = 'Win 2k'; }
    if($OS=~/NT/)   { $OS = 'Win NT'; }
  }
  elsif($OS=~/vms/i)    { $OS = 'VMS';       }
  elsif($OS=~/^Mac/i)   { $OS = 'MACINTOSH'; }
  elsif($OS=~/os2/i)    { $OS = 'OS2';       }
  elsif($OS=~/free/i)   { $OS = 'FreeBSD';   }
  elsif($OS=~/bsd/i)    { $OS = 'BSD';       }
  elsif($OS=~/sol/i)    { $OS = 'Solaris';   }
  elsif($OS=~/linux/i)  { $OS = 'Linux';     }
  else                  { $OS = 'UNIX';      }
  return  $OS;
}
#---------------------------------------------------------------------
sub PutMSG
{
  &ShowMSG(@_);
}
#---------------------------------------------------------------------
# $array[0] is Image Name and then Massage.
sub ShowMSG
{
  my( @array ) = @_;
  my( $i );
  unshift( @array, "error" )  unless( -s "$PATH{'CfgImg'}/$array[0].gif" );
  &PutHTMLHead();
  print "<BODY>\n";
  print "<DIV ALIGN=center>\n";
  print "<TABLE BORDER='0' CELLSPACING='0' CELLPADDING='5'>\n";
  print "<TR><TD COLSPAN=3><IMG SRC=\"$URL{'CfgImg'}/$array[0].gif\" BORDER='0'></TD></TR>\n";
  for( $i = 1; $i <= $#array; $i++ )
  {
    print "<TR><TD WIDTH=10 nowrap>&nbsp;</TD><TD>$array[$i]</TD><TD WIDTH=10 nowrap>&nbsp;</TD></TR>\n";
  }
  print "</BODY>\n";
  &PutHTMLTail();

  &Exit();
}
#---------------------------------------------------------------------

return  1;
