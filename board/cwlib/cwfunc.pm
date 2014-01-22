#--------------------------------------------------------------------#
# Default Library for cwPlus                                         #
#--------------------------------------------------------------------#
# File Name   : cwFunc.cgi                                           #
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
#  If you want desciption of this library,                           #
#     just run perldoc with this library,                            #
#     or visit my homepage. ^^                                       #
#--------------------------------------------------------------------#
#  If you want 'Convert for your country language,                   #
#     find line include 'convert your language'.                     #
#--------------------------------------------------------------------#

package cwFunc;
require 5.000;

use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS );

$VERSION = "1.0.0.0";

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(
             EnCodeUrl DecodeUrl
             StrCutSize
             GetCookie SetCookie
             GetTimeStr GetDate
             GetParams GetARGs
             ShortFileName
             StrCutSize
             isOS
             ReadBinFile ReadTxtFile ReadCfgFile ReadExtFile
             Lock UnLock
          );

@EXPORT_OK = qw(
                 $OVERWRITE
               );

%EXPORT_TAGS = (
    all     => [ @EXPORT, @EXPORT_OK ],
);

$OVERWRITE = 0;

#---------------------------------------------------------------------
# This function is ENCODING to UrlEncoding
sub EnCodeUrl
{
  my( $i, $buf, $len );

  $len = length($_[0]);
  for( $i = 0; $i < $len; $i++ )
  {
    $buf .= sprintf( "%%%02x", ord(substr($_[0],$i,1)) );
  }

  return  $buf;
}
#---------------------------------------------------------------------
# This function is DECODING to UrlEncoding
sub DeCodeUrl
{
  $_[0] =~ tr/+/ /;
  $_[0] =~ s/%([a-fA-F0-9]{2})/pack("c",hex($1))/eg;

  return  $_[0];
}
#---------------------------------------------------------------------
sub StrCutSize
{
  my( $Str, $len, $opt ) = @_;
  my( $off, @array, $i );

  return  $Str  if( !$len );

  if( $opt && $Str =~ /\s/ )
  {
    while( substr($Str,$len,1) =~ /\S/ ) { $len--; }
  }
  else
  {
    @array = split(/\s/,substr($Str,0,$len));
    @array = split(//,$array[$#array]);
    for( $i = 0; $i < $#array; $i++ )
    {
      if( ord($array[$i]) > 127 )
      {
        $i++;
        $off = ( $i != $#array ? 1 : 0 );
      }
      else
      {
        $off = 0;
      }
    }
    $len-- if($off);
  }

  return  substr($Str,0,$len);
}
#---------------------------------------------------------------------
# This function is GET COOKIE from HTTP Header
sub GetCookie
{
  my( @cookies, %hash, $key );
  my( $name, $value, $data );

  $CLOCK{'dummy'} = (times)[0];

  if($ENV{'HTTP_COOKIE'})
  {
    @cookies = split(/\; /,$ENV{'HTTP_COOKIE'});
    foreach $data (@cookies)
    {
      ($name,$value) = split(/\=/,$data,2);
      $name = &DeCodeUrl($name);
      $hash{$name} = &DeCodeUrl($value);
      if( $hash{$name} =~ /\,/ )
      {
        $key = $name . ".array";
        $hash{$key} = \(split(/\,/,$value));
      }
    }
  }

  $CLOCK{'GetCookie'} = (times)[0] - $CLOCK{'dummy'};

  return  %hash;
}
#---------------------------------------------------------------------
# This function SET COOKIE.
#   So, Please call before any printing.
#   Cookie is formed UUE Code.
sub SetCookie
{
  my( $name, $value, $expire, $path ) = @_;
  my( $extime, $exs );

  if( $name && $value && $COOKIE{$name} ne $value )
  {
    print "Set-Cookie: ", ( &EnCodeUrl($name) ), "=", ( &EnCodeUrl($value) ), ";";
    if( $expire )
    {
      if( $expire =~ /[a-zA-Z]$/ )
      {
        $exs = $&;
        $expire = $`;
        if( $exs =~ /s/i )    { $extime =     1; }
        elsif( $exs =~ /m/i ) { $extime =    60; }
        elsif( $exs =~ /h/i ) { $extime =  3600; }
        else                  { $extime = 86400; }
      }
      $extime = 86400  unless($extime);
      $expire = $extime * $expire + time;
      my($sec,$min,$hour,$mday,$mon,$year,$wday,$apm,$halfhour,$sw) = &GetTimeFunc( gmtime($expire) );
      print " expires=$wday, $mday-$mon-$year $hour:$min:$sec GMT;";
    }
    print " path=$path;"  if($path);
    print "\n";
  }

  return;
}
#---------------------------------------------------------------------
# This function is Get Time for String Type.
sub GetTimeFunc
{
  my($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst,$sw) = @_;
  my($month,$week);
  my($halfhour) = $hour;
# If you want convert your language, change here. ^^
  my($apm) = $sw ? "오전" : "am";

# If $sw set, for korean.
#  'cause, I'm korean. ^^;
  if( $sw )
  {
# If you want convert your language, change here. ^^
    $week  = (qw(일 월 화 수 목 금 토))[$wday];
    $month = $mon + 1;
  }
  else
  {
    $week  = (qw(Sun Mon Tue Wed Thu Fri Sat))[$wday];
    $month = (qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec))[$mon];
  }
  $year += 1900;
  if( $halfhour > 12 )
  {
    $halfhour -= 12;
# If you want convert your language, change here. ^^
    $apm = $sw ? "오후" : "pm";
  }
  $halfhour = 12  if( !$halfhour );

  $sec      = sprintf( "%02d", $sec );
  $min      = sprintf( "%02d", $min );
  $hour     = sprintf( "%02d", $hour );
  $halfhour = sprintf( "%02d", $halfhour );
  $mday     = sprintf( "%02d", $mday );
  $month    = sprintf( "%02d", $month )  if($sw);

  return  ($sec,$min,$hour,$mday,$month,$year,$week,$apm,$halfhour,$sw);
}
#---------------------------------------------------------------------
# This function is 
sub GetTimeStr
{
  my($format,$sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst,$sw) = @_;

  $format = '%Y/%M/%D(%w), %h:%m:%s'  if(!$format);

  if( !$sec && !$min && !$hour && !$mday && !$mon && !$year )
  {
    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst,$sw)
      = &GetTimeFunc(localtime(time),1);
  }

  $format =~ s/\%s/$sec/;
  $format =~ s/\%m/$min/;
  $format =~ s/\%h/$hour/;
  $format =~ s/\%D/$mday/;
  $format =~ s/\%M/$mon/;
  $format =~ s/\%Y/$year/;
  $format =~ s/\%w/$wday/;
  $format =~ s/\%a/$yday/;
  $format =~ s/\%f/$isdst/;

  return  $format;
}
#---------------------------------------------------------------------
# This function is 
sub GetDate
{
  my($format) = @_;

  $format = '%Y%M%D'  if(!$format);
  $format = &GetTimeStr($format);

  return  $format;
}
#---------------------------------------------------------------------
# This function is 
sub GetParams
{
  my( $ParamStr, %hash );

  $CLOCK{'dummy'} = (times)[0];

  if( $ENV{'QUERY_STRING'} )
  {
    %hash = &ParseUrlEncode( $ENV{'QUERY_STRING'} );
  }
  elsif($ENV{'CONTENT_LENGTH'})
  {
    binmode(STDIN);
    read( STDIN, $ParamStr, $ENV{'CONTENT_LENGTH'} );
#    print "Content-type : text/html\n\n<PRE>$ParamStr</PRE>";
    if( !$ENV{'CONTENT_TYPE'} || $ENV{'CONTENT_TYPE'} eq 'application/x-www-form-urlencoded' )
    {
      %hash = &ParseUrlEncode( $ParamStr );
    }
    elsif( $ENV{'CONTENT_TYPE'} =~ /^multipart\/form-data/ )
    {
      %hash = &ParseMultiPart( $ParamStr );
    }
  }
  else
  {
    $CLOCK{'GetParams'} = (times)[0] - $CLOCK{'dummy'};
    return  undef;
  }

  $CLOCK{'GetParams'} = (times)[0] - $CLOCK{'dummy'};

  return  %hash;
}
#---------------------------------------------------------------------
# This function is 
sub ParseUrlEncode
{
  my( $str, $name, $value, %hash );
  my( @array );

  $CLOCK{'dummy'} = (times)[0];

  @array = split(/\&/,$_[0]);

  foreach $str (@array)
  {
    ($name,$value) = split(/=/,$str,2);
    $name  = &DeCodeUrl($name);
    $value = &DeCodeUrl($value);
    if( $hash{$name} )
    {
      $hash{$name} .= ",$value";
    }
    else
    {
      $hash{$name} = $value;
    }
  }

  $CLOCK{'ParseUrlEncode'} = (times)[0] - $CLOCK{'dummy'};

  return  %hash;
}
#---------------------------------------------------------------------
sub ParseMultiPart
{
  my( $str ) = @_;
  my( $boundary );
  my( @array, %hash, $line, $rest, @temp );
  my( $key, $value );
  my( $filename, $filetype );

  $CLOCK{'dummy'} = (times)[0];

  ($boundary = $ENV{'CONTENT_TYPE'}) =~ s/.+boundary=(.+)/$1/;
  $str =~ s/\-\-$boundary\-\-\r\n$//;

  @array = split( /\-\-$boundary\r\n/, $str );
  shift(@array);

  foreach $str (@array)
  {
    last  if( $str eq '--' );
    ($line,$value,$key,$filename,$filetype) = ();
    $str =~ s/^\r\n(.+)\r\n$/$1/;
    ($line,$value) = split(/\r\n/,$str,2);
    ( $key = $line ) =~ s/.+\; name\=\"(.*?)\".*/$1/;

    $value =~ s/\r\n$//;

    if( $line =~ /.+\; filename\=\"(.*?)\".*/ )
    {
      $filename = $1;
      ($line,$value) = split(/\r\n/,$value,2);
      ( $filetype = $line ) =~ s/.+\: (\S+)/$1/;

    }
    $value =~ s/^\r\n//;

    if( $key eq 'cwCLEAR' )
    {
      $OVERWRITE = $value;
      next;
    }

    if( $filename )
    {
      $filename =~ s/\/(.+)$/$1/  if( $filename !~ /^(((http|ftp|mms)\:\/\/|www\.).+?\..+?\/)/ );
      $hash{"$key.name"} = $filename;
      $hash{"$key.size"} = length($value);
      $hash{"$key.type"} = $filetype;
      $hash{$key} = $value;
    }
    else
    {
      if( !$OVERWRITE && defined($hash{$key}) )
      {
        $hash{$key} .= ",$value";
      }
      else
      {
        $hash{$key} = $value;
      }
    }
  }

  $CLOCK{'ParseMultiPart'} = (times)[0] - $CLOCK{'dummy'};

  return %hash;
}
#---------------------------------------------------------------------
sub UrlStrEncode
{
  my( $i, $buf, $len, $ch, $chr );

  $buf = '';
  $len = length($_[0]);
  for( $i = 0; $i < $len; $i++ )
  {
    $ch = ord(substr($_[0],$i,1));
    $chr = $ch >> 4;  $buf .= $chr;
    $chr = $ch & 16;  $buf .= $chr;
  }

  return $buf;
}
#---------------------------------------------------------------------
sub GetARGs
{
  my( @ARGs ) = @_;
  my( $str, @array, %hash );

  foreach $str (@ARGs)
  {
    @array = split( '=', $str, 2 );
    chomp( $array[0] );
    chomp( $array[1] );
    $hash{$array[0]} = $array[1];
  }

  return  %hash;
}
#---------------------------------------------------------------------
sub ShortFileName
{
  my( $filename, $length, $shortstr ) = @_;
  my( @array );

  return  $filename  if( $filename =~ /^(http|ftp|mms):\/\// );

  @array = split(/\\/,$filename);

  return  ( (substr($array[$#array],0,$length)) . $shortstr )  if( $length && $length < length($array[$#array]) );

  return  $array[$#array];
}
#---------------------------------------------------------------------
sub StrCutSize
{
  my( $Str, $len, $opt ) = @_;
  my( $off, @array, $i );

  return  $Str  if( !$len );

  if( $opt && $Str =~ /\s/ )
  {
    while( substr($Str,$len,1) =~ /\S/ ) { $len--; }
  }
  else
  {
    @array = split(/\s/,substr($Str,0,$len));
    @array = split(//,$array[$#array]);
    for( $i = 0; $i < $#array; $i++ )
    {
      if( ord($array[$i]) > 127 )
      {
        $i++;
        $off = ( $i != $#array ? 1 : 0 );
      }
      else
      {
        $off = 0;
      }
    }
    $len-- if($off);
  }

  return  substr($Str,0,$len);
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
sub ReadDirFunc
{
  my( $dir ) = @_;
  my( @array, @dir, @file, $i );
  return  undef  if(!$dir);
  if( opendir( DIRHANDLE, "$dir" ) )
  {
    @array = readdir(DIRHANDLE);
    close(DIRHANDLE);
    for( $i = 0; $i <= $#array; $i++ )
    {
      next  if( $array[$i] =~ /^\./ );
      if( -d "$dir/$array[$i]" )
      {
        $dir[++$#dir] = $array[$i];
      }
      else
      {
        $file[++$#file] = $array[$i];
      }
    }
    return  ( \@dir, \@file );
  }
}
#---------------------------------------------------------------------
sub ReadDirSub
{
  my( $dir ) = @_;
  return  undef  unless($dir);
  $dir = ( &ReadDirFunc($dir) )[0];
  return  @{$dir};
}
#---------------------------------------------------------------------
sub ReadDirFile
{
  my( $dir ) = @_;
  return  undef  unless($dir);
  $dir = ( &ReadDirFunc($dir) )[1];
  return  @{$dir};
}
#---------------------------------------------------------------------
# This Function read file.
#   $pos is position of start to read.
#   $len is length to read.
sub ReadBinFile
{
  my( $filename, $pos, $len ) = @_;
  my( $str, @array );

# If $filename is not FILE, Return Error Message.
  return  "FILE NOT FOUND \"$filename\""  if( !( -f "$filename" ) );
# If size of $filename is zero, Return null.
  return                                  if( !( -s "$filename" ) );
# If cannot read from $filename, Return Error Message.
  return  "CAN NOT READ FILE"             if( !( -r "$filename" ) );

  $CLOCK{'dummy'} = (times)[0];

# If not exist $pos, read from start of file.
  $pos = 0  unless($pos);
# If not exist $len, read to end of file.
  $len = ( -s "$filename" ) || 0  unless($len);

# If size for read is over file size, correct size.
  if( $pos + $len > -s "$filename" )
  {
    $len = ( -s "$filename" ) - $pos;
  }

  if( open( HANDLE, "< $filename" ) )
  {
    binmode HANDLE;
    seek( HANDLE, $pos, 0 );
    sysread( HANDLE, $str, $len );
    close(HANDLE);
  }

  $filename =~ s/\/(.+?)/$1/g;

  $CLOCK{"ReadBinFile\($filename\)"} = (times)[0] - $CLOCK{'dummy'};

  return  $str;
}
#---------------------------------------------------------------------
# This Function read file.
#   $pos is position of start to read.
#   $len is length to read.
#   $splitkey is split keyword for line-split.
sub ReadTxtFile
{
  my( $filename, $splitkey ) = @_;
  my( $len, $str, @array );

# If $filename is not FILE, Return Error Message.
  return  "FILE NOT FOUND \"$filename\""  if( !( -f "$filename" ) );
# If size of $filename is zero, Return null.
  return                                  if( !( -s "$filename" ) );
# If cannot read from $filename, Return Error Message.
  return  "CAN NOT READ FILE"             if( !( -r "$filename" ) );

  $CLOCK{'dummy'} = (times)[0];

  $len = ( -s "$filename" );

  if( open( HANDLE, "< $filename" ) )
  {
    binmode HANDLE;
    seek( HANDLE, 0, 0 );
    sysread( HANDLE, $str, $len );
    close(HANDLE);
  }

  $splitkey ||= "\n";
  @array = split(/$splitkey/,$str);

  $CLOCK{"ReadTxtFile\($filename\)"} = (times)[0] - $CLOCK{'dummy'};

  return  @array;
}
#---------------------------------------------------------------------
# This Function read file.
#   $withquote is for using quote.
#     If you want to use quote, set this value to 'yes' or 1.
#   $pos is position of start to read.
#   $len is length to read.
sub ReadCfgFile
{
  my( $filename, $withquote ) = @_;
  my( $len, $str, @array, %hash );
  my( $key, $value, @dummy );

# If $filename is not FILE, Return Error Message.
  return  "FILE NOT FOUND \"$filename\""  if( !( -f "$filename" ) );
# If size of $filename is zero, Return null.
  return                                  if( !( -s "$filename" ) );
# If cannot read from $filename, Return Error Message.
  return  "CAN NOT READ FILE"             if( !( -r "$filename" ) );

  $CLOCK{'dummy'} = (times)[0];

  $len = ( -s "$filename" );

  if( open( HANDLE, "< $filename" ) )
  {
    binmode HANDLE;
    seek( HANDLE, 0, 0 );
    sysread( HANDLE, $str, $len );
    close(HANDLE);
  }

  @array = split(/\n/,$str);

  foreach $str ( @array )
  {
    next  if( $str =~ /^((\#|\;|\/\/).*|\s*)$/ );

    ( $key, $value ) = split(/\=/,$str,2);

    $key   =~ s/\r//g;
    $value =~ s/\r//g;

    if( $withquote =~ /(yes|1)/i )
    {
      $key   =~ s/^\s*(\S+)\s*$/$1/;
      $value =~ s/^\s*(\'|\")?(\S+)(\1)\s*$/$2/;
    }

    if( $hash{$key} )
    {
      $hash{$key} .= ",$value";
    }
    else
    {
      $hash{$key} = $value;
    }
  }

  $CLOCK{"ReadCfgFile\($filename\)"} = (times)[0] - $CLOCK{'dummy'};

  return  %hash;
}
#---------------------------------------------------------------------
# This Function read file.
#   Here is the file structure.
#     ------------------------------------------------------
#     boundary = "boundary keyword"
#     boundary keyword
#     name     = "Key Name"
#     Contents
#     boundary keyword
#     name     = "Key Name"
#     enctype  = ""
#     Contents
#     boundary keyword
#     ------------------------------------------------------
#  Next line of __EOF__, ignored.
#  If used quote, space at before and after '=', ignored.
#    else recognized in value.
sub ReadExtFile($;$$)
{
  my( $filename, $boundary, $NoClear ) = @_;
  my( $len, $str, @array, %hash, $enctype );
  my( $name, $key, $value, $dummy, @dummy, %dummy, $i );

# If $filename is not FILE, Return Error Message.
  return  "FILE NOT FOUND \"$filename\""  if( !( -f "$filename" ) );
# If size of $filename is zero, Return null.
  return                                  if( !( -s "$filename" ) );
# If cannot read from $filename, Return Error Message.
  return  "CAN NOT READ FILE"             if( !( -r "$filename" ) );

  $CLOCK{'dummy'} = (times)[0];

  $len = ( -s "$filename" );

  if( open( HANDLE, "< $filename" ) )
  {
    binmode HANDLE;
    seek( HANDLE, 0, 0 );
    sysread( HANDLE, $str, $len );
    close(HANDLE);
  }

  $str =~ s/\r//g;

  @array = split(/\n/,$str);

  while( $array[0] =~ /^((\;|\#|\/\/).*|\s*)$/ )  { shift(@array) };

  ( $dummy = $array[0] ) =~ s/boundary\=([\'\"]?)(.+?)\1/$2/i;

  return  ( "BOUNDARY MISSMATCHED", "1" )  if( $boundary && ( $dummy !~ /\:$boundary\:?/  ) );

  $boundary ||= $dummy;

  return  ( "NOEXTFILE", "1" )  if(!$boundary);

  $hash{'boundary'} = $boundary;

  shift(@array);

  while( $array[0] =~ /^((\;|\#|\/\/).*?|$boundary.*?|\s*?)$/ )  { shift(@array) };

  $str = join("\n",@array);
  @array = split(/$boundary(\n?)/,$str);

  foreach $str ( @array )
  {
    last  if( $str =~ /^__EOF__$/ );

    ( $name, $key, $value, @dummy ) = ();
    @dummy = split(/\n/,$str);
    while( $dummy[0] =~ /^((\;|\#|\/\/).*?|\s*?)$/ )
    {
      shift(@dummy);
      last  if( !@dummy );
    };
    next  if( !@dummy );

    if( ( $name = $dummy[0] ) =~ s/^HashName\s*\=\s*([\'\"]?)(.+)\1$/$2/i )
    {
      shift(@dummy);
      while( $dummy[0] =~ /^((\;|\#|\/\/).*?|\s*?)$/ )
      {
        shift(@dummy);
        last  if( !@dummy );
      };

      for( $i = 0; $i <= $#dummy; $i++ )
      {
        next  if( $dummy[$i] =~ /^((\;|\#|\/\/).*?|\s*?)$/ );
        last  if( $dummy[$i] eq "__EOF__" );

        ( $key, $value ) = split(/\=/,$dummy[$i]);
        $key =~ s/^\s*(.+?)\s*$/$1/;

        if( $value =~ s/^(\s*[\'\"])// )
        {
          ( $dummy = $1 ) =~ s/^\s*//;
          $value =~ s/$dummy\s*$//;
        }

        if( $NoClear && $main::{$name}{$key} )
        {
          $main::{$name}{$key} .= ",$value";
        }
        else
        {
          $main::{$name}{$key} = $value;
        }
      }
    }
    elsif( ( $name = $dummy[0] ) =~ s/^KeyName\s*\=\s*([\'\"]?)(.+)\1$/$2/i )
    {
      my( %temp );
      shift(@dummy);
      while( $dummy[0] =~ /^((\;|\#|\/\/).*?|\s*?)$/ )
      {
        shift(@dummy);
        last  if( !@dummy );
      };

      for( $i = 0; $i <= $#dummy; $i++ )
      {
        next  if( $dummy[$i] =~ /^((\;|\#|\/\/).*?|\s*?)$/ );
        last  if( $dummy[$i] eq "__EOF__" );

        ( $key, $value ) = split(/\=/,$dummy[$i]);
        $key =~ s/^\s*(.+?)\s*$/$1/;

        if( $value =~ s/^(\s*[\'\"])// )
        {
          ( $dummy = $1 ) =~ s/^\s*//;
          $value =~ s/$dummy\s*$//;
        }

        if( $NoClear && $temp{$key} )
        {
          $temp{$key} .= ",$value";
        }
        else
        {
          $temp{$key} = $value;
        }
      }
      $hash{$name} = \%temp;
    }
    elsif( ( $key = $dummy[0] ) =~ s/^name\s*\=\s*([\'\"]?)(.+)\1$/$2/i )
    {
      shift(@dummy);
      while( $dummy[0] =~ /^((\;|\#|\/\/).*?|\s*?)$/ )
      {
        shift(@dummy);
        last  if( !@dummy );
      };

      if( ( $enctype = $dummy[0] ) =~ s/^enctype\s*\=\s*([\'\"]?)(.+)\1/$2/i )
      {
        shift(@dummy);
        require cwConv;
        $value = join("\n",@dummy);
        if( $enctype =~ /base64/i )
        {
          $value = &DeCodeBASE64($value);
        }
        elsif( $enctype =~ /uue/i )
        {
          $value = &DeCodeUrl($value);
        }
      }
      else
      {
        $value = join("\n",@dummy);
      }

      if( !$NoClear && $hash{$key} )
      {
        $hash{$key} .= ",$value";
      }
      else
      {
        $hash{$key} = $value;
      }
    }
  }

  $CLOCK{"ReadExtFile\($filename\)"} = (times)[0] - $CLOCK{'dummy'};

  return  %hash;
}
#---------------------------------------------------------------------
sub SaveExtFile
{
  my( $filename, %hash ) = @_;
  my( $BaseOn, $key );

  return  "NEED FILE NAME"  if(!$filename);
  return  "NEED BOUNDARY"   if(!$hash{'boundary'});

  if( open( HANDLE, "> $filename" ) )
  {
    binmode(HANDLE);
    print HANDLE "boundary=\"$hash{'boundary'}\"\n$hash{'boundary'}\n";
    foreach $BaseOn ( sort keys %hash )
    {
      next  if( $BaseOn eq 'boundary' );
      next  if(!$BaseOn);
      if( $hash{$BaseOn} =~ /^HASH\(0x/ )
      {
        print HANDLE "baseon=\"$BaseOn\"\n";
        foreach $key ( sort keys %{$hash{$BaseOn}} )
        {
          print HANDLE "$key=\"${$hash{$BaseOn}}{$key}\"\n";
        }
        print HANDLE "$hash{'boundary'}\n";
      }
      else
      {
        print HANDLE "name=\"$BaseOn\"\n";
        print HANDLE "$hash{$BaseOn}\n";
        print HANDLE "$hash{'boundary'}\n";
      }
    }
    print HANDLE "__EOF__\n";
    close(HANDLE);

    return;
  }
  else
  {
    return  "CAN NOT SAVE FILE"  if(!$filename);
  }
}
#---------------------------------------------------------------------
sub Lock
{
  $CLOCK{'dummy'} = (times)[0];
  $LOCK{'TIME'} = time;
  $LOCK{'FILE'} = "./lock.cgi"  unless($LOCK{'FILE'});
  unlink( $LOCK{'FILE'} )  if( (stat($LOCK{'FILE'}))[9] < ( $LOCK{'TIME'} - 60 ) );
  while( -e $LOCK{'FILE'} )
  {
    $CLOCK{"Lock($LOCK{'FILE'})"} = (times)[0] - $CLOCK{'dummy'};
    return  "Access Time Out!"  if( time > ( $LOCK{'TIME'} + 60 ) );
  }
  open( LOCK, "> $LOCK{'FILE'}" );
  $CLOCK{"Lock($LOCK{'FILE'})"} = (times)[0] - $CLOCK{'dummy'};

  return;
}
#---------------------------------------------------------------------
sub UnLock
{
  $CLOCK{'dummy'} = (times)[0];
  if( LOCK )
  {
    close(LOCK);
    unlink( $LOCK{'FILE'} );
  }
  $CLOCK{"UnLock($LOCK{'FILE'})"} = (times)[0] - $CLOCK{'dummy'};

  return;
}
#---------------------------------------------------------------------
sub Wait
{
  my( $file, $during ) = @_;
  my( $time ) = time;

  $CLOCK{'dummy'} = (times)[0];

  $during ||= 30;
  while( ( -e $file ) && ( ( time - $time ) < $during ) )  { };

  $CLOCK{'WAIT'} = (times)[0] - $CLOCK{'dummy'};

  return;
}
#---------------------------------------------------------------------

return  1  if( $0 !~ /cwFunc\.pm$/ );
