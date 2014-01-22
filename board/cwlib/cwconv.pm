#--------------------------------------------------------------------#
# Default Function Library for CGI.                                  #
#--------------------------------------------------------------------#
# File Name   : ezFunc.pm                                            #
# Version     : 1.0.0.0                                              #
# Programmer  : Yun-Cheol, Chae.                                     #
#               ID       : Cacolith                                  #
#               E-Mail   : cacolith@i.am                             #
#               HomePage : http://cacolith.i.am                      #
# UpDate      : 2001.02.14.                                          #
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

package cwConv;
require 5.000;

use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS );

$VERSION = "1.0.0.0";

use Carp;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(
             @BASE64 %BASE64
             EnCodeUUE DecodeUUE
             EnCodeBASE64 DecodeBASE64
             Num2Hex Hex2Num NumToStr
             ConvValue
          );

%EXPORT_TAGS = (
    all     => [ @EXPORT, @EXPORT_OK ],
);

#--------------------------------------------------------------------
# These are for base convert to BASE64
my( @BASE64 ) = ( 'A','B','C','D','E','F','G','H','I','J',
                  'K','L','M','N','O','P','Q','R','S','T',
                  'U','V','W','X','Y','Z',
                  'a','b','c','d','e','f','g','h','i','j',
                  'k','l','m','n','o','p','q','r','s','t',
                  'u','v','w','x','y','z',
                  '0','1','2','3','4','5','6','7','8','9',
                  '+','/' );
#---------------------------------------------------------------------
# These are for base convert from BASE64
my( %BASE64 ) = ( 'A' =>  0, 'B' =>  1, 'C' =>  2, 'D' =>  3,
                  'E' =>  4, 'F' =>  5, 'G' =>  6, 'H' =>  7,
                  'I' =>  8, 'J' =>  9, 'K' => 10, 'L' => 11,
                  'M' => 12, 'N' => 13, 'O' => 14, 'P' => 15,
                  'Q' => 16, 'R' => 17, 'S' => 18, 'T' => 19,
                  'U' => 20, 'V' => 21, 'W' => 22, 'X' => 23,
                  'Y' => 24, 'Z' => 25, 'a' => 26, 'b' => 27,
                  'c' => 28, 'd' => 29, 'e' => 30, 'f' => 31,
                  'g' => 32, 'h' => 33, 'i' => 34, 'j' => 35,
                  'k' => 36, 'l' => 37, 'm' => 38, 'n' => 39,
                  'o' => 40, 'p' => 41, 'q' => 42, 'r' => 43,
                  's' => 44, 't' => 45, 'u' => 46, 'v' => 47,
                  'w' => 48, 'x' => 49, 'y' => 50, 'z' => 51,
                  '0' => 52, '1' => 53, '2' => 54, '3' => 55,
                  '4' => 56, '5' => 57, '6' => 58, '7' => 59,
                  '8' => 60, '9' => 61, '+' => 62, '/' => 63,
                  '=' => 0 );
#---------------------------------------------------------------------
# This function is ENCODING to UUE CODE
sub EnCodeUUE
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
# This function is DECODING to UUE CODE
sub DeCodeUUE
{
  $_[0] =~ tr/+/ /;
  $_[0]  =~ s/%([a-fA-F0-9]{2})/pack("c",hex($1))/eg;
  return  $_[0];
}
#---------------------------------------------------------------------
# This function is ENCODING to BASE64
sub EnCodeBASE64
{
  my( $str ) = @_;

  return  undef  if(!$str);

  my( @org ) = split(//,$str);
  my( $enclength, @buffer, $i, $restr );

  for( $i = 0; $i < ( @org - 2 ); $i += 3 )
  {
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i])          ) >> 2 ) ];
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i])   & 0x03 ) << 4 )
                                   + ( ( ord($org[$i+1])        ) >> 4 ) ];
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i+1]) & 0x0F ) << 2 )
                                   + ( ( ord($org[$i+2])        ) >> 6 ) ];
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i+2]) & 0x3F )      ) ];
  }

  if( $i < @org )
  {
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i])        ) >> 2 ) ];
    $buffer[$enclength]   = $BASE64[ ( ( ord($org[$i]) & 0x03 ) << 4 ) ];
    $i++;
    if( $i < @org )
    {
      $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i-1]) & 0x03 ) << 4 )
                                       + ( ( ord($org[$i])        ) >> 4 ) ];
      $buffer[$enclength]   = $BASE64[ ( ( ord($org[$i])   & 0x0F ) << 2 ) ];
    }
    else
    {
      $buffer[++$enclength] = "=";
    }
    $buffer[++$enclength] = "=";
  }

  $restr = join('',@buffer);
  $restr =~ s/(.{76})/$1\n/g;
  $restr .= "\n";

  return  $restr;
}
#---------------------------------------------------------------------
# This function is DECODING to BASE64
sub DeCodeBASE64
{
  my( @org ) = @_;

  return  undef  if(!@org);

  my( $enclength, @buffer, $i, $restr );

  $str = join('',@org);
  $str =~ s/\r|\n//g;
  @org = split(//,$str);

  for( $i = 0; $i < @org; $i+=4 )
  {
    $buffer[$enclength++] = chr( ( ( ( $BASE64{$org[$i]}   & 0x3F ) << 2 )
                                 + ( ( $BASE64{$org[$i+1]}        ) >> 4 ) ) );
    $buffer[$enclength++] = chr( ( ( ( $BASE64{$org[$i+1]} & 0x0F ) << 4 )
                                 + ( ( $BASE64{$org[$i+2]}        ) >> 2 ) ) );
    $buffer[$enclength++] = chr( ( ( ( $BASE64{$org[$i+2]} & 0x03 ) << 6 )
                                 + ( ( $BASE64{$org[$i+3]} & 0x3F ) ) ) );
  }

  $restr = join('',@buffer);

  while( $str =~ s/\=$// )  { chop($restr); }

  return  $restr;
}
#---------------------------------------------------------------------
sub Num2Hex
{
  my( $num ) = @_;
  my( $hex, $temp, $i ) = ();
  $temp = int($num);
  while( $temp )
  {
    $hex .= chr( $temp & 255 );
    $temp >>= 8;
  }
  return  $hex;
}
#---------------------------------------------------------------------
sub Hex2Num
{
  my( $hex ) = @_;
  my( $num, $temp, $i ) = ();
  for( $i = 0; $i <= length($hex); $i++ )
  {
    $num += ord( substr($hex,$i,1) ) * ( 256 ** $i );
  }
  return  $num;
}
#---------------------------------------------------------------------
sub NumToStr
{
  my( $str ) = @_;
  $str = reverse $str;
  $str =~ s/(\d{3})/$1\,/g;
  $str = reverse $str;
  $str =~ s/^\,//;
  return  $str;
}
#---------------------------------------------------------------------
sub ConvValue
{
  my( @ORG ) = @_;
  my( $str, @array, %hash ) = ();
  my( $prev, $next, $conv, $temp, @temp, %temp ) = ();
  my( $ReStr, $length, $type, $code, $conved ) = ();

  for( $i = 0; $i <= $#ORG; $i++ )
  {
    if( $ORG[$i] =~ /^ARRAY\(0x/ )
    {
      $str .= join('',@{$ORG[$i]});
    }
    elsif( $ORG[$i] =~ /^SCALAR\(0x/ )
    {
      $str .= ${$ORG[$i]};
    }
    else
    {
      $str .= $ORG[$i];
    }
  }

  while( $str )
  {
    if( $str =~ /^\(([\!\@\#\$\%\^\&\*])(.+?)\)/ )
#    if( $str =~ /\(([\!\@\#\$\%\^\&\*])(.+?)\)/ )
    {
      $here = $&; $next = $';
      $type = $1; $code = $2;
      @array = split(/\./,$code,2)  if( $code =~ /\./ );

      $array[0] = uc($array[0]);
      $array[1] = uc($array[1])  if( !$array[0] );
# This type means Undefined Name in main is DENIED.
      if( !defined($main::CONV{$code})
          && !defined($main::CONV{$array[0]})
          && !defined($main::CONV{$array[1]}) )
      {
        $ReStr .= $here;
        $str   = $next;
        next;
      }
      elsif( $type eq '$' )
      {
# ($NAME.) for value of scalar named NAME
        if( $main::CONV{$array[0]} =~ /SCALAR\(0x/ )
        {
          $ReStr .= ${$main::CONV{$code}};
        }
# ($.NAME) for size of scalar named NAME
        elsif( $main::CONV{$array[1]} =~ /SCALAR\(0x/ )
        {
          $ReStr .= length(${$main::CONV{$array[1]}});
        }
# ($NAME) same as ($NAME.), just without '.'
        elsif( $main::CONV{$code} =~ /SCALAR\(0x/ )
        {
          $ReStr .= ${$main::CONV{$code}};
        }
# other has no mean.
        else
        {
          $ReStr .= $here;
        }
      }
# This type means Array.
      elsif( $type eq '@' )
      {
        if( $array[0] && $main::CONV{$array[0]} =~ /ARRAY\(0x/ )
        {
          if( $array[1] )
          {
            $ReStr .= ( $array[1] < @{$main::CONV{$array[0]}} ) ? ${$main::CONV{$array[0]}}[$array[1]] : "";
            while( $ReStr =~ s/(\n|\r| )$//g ) {};
          }
          else
          {
            @temp = @{$main::CONV{$array[0]}};
            for( $i = 0; $i < @temp; $i++ )
            {
              while( $temp[$i] =~ s/(\n|\r| )$//g ) {};
            }
            $ReStr .= join("\n",@temp);
          }
        }
        elsif( !$array[0] && $array[1] && $main::CONV{$array[1]} =~ /ARRAY\(0x/ )
        {
          $ReStr .= @{$main::CONV{$array[1]}};
        }
        else
        {
          $ReStr .= $here;
        }
      }
# This type means Hash.
      elsif( $type eq '%' )
      {
        if( $array[0] && $main::CONV{$array[0]} =~ /HASH\(0x/ && $array[1] ne '*' && $array[1] !~ /^\*.*?\*$/ )
        {
          if( $array[1] )
          {
            if( $array[1] =~ /\*$/ )
            {
              $temp = $`;
              %temp = %{$main::CONV{$array[0]}};
              foreach $i ( sort keys %temp )
              {
                next  if( !length($i) );
                next  if( $i !~ /^$temp/i );
                while( $temp{$i} =~ s/(\n|\r| )$//g ) {};
                $ReStr .= sprintf( "%-30s : %s\n", $i, $temp{$i} );
              }
            }
            elsif( $array[1] =~ /^\*/ )
            {
              $temp = $';
              %temp = %{$main::CONV{$array[0]}};
              foreach $i ( sort keys %temp )
              {
                next  if( !length($i) );
                next  if( $i !~ /$temp$/i );
                while( $temp{$i} =~ s/(\n|\r| )$//g ) {};
                $ReStr .= sprintf( "%-30s : %s\n", $i, $temp{$i} );
              }
            }
            else
            {
              $ReStr .= ${$main::CONV{$array[0]}}{$array[1]};
              while( $ReStr =~ s/(\n|\r| )$//g ) {};
            }
          }
          else
          {
            %temp = %{$main::CONV{$array[0]}};
            foreach $i ( sort keys %temp )
            {
              next  if( !length($i) );
              while( $temp{$i} =~ s/(\n|\r| )$//g ) {};
              $ReStr .= sprintf( "%-30s : %s\n", $i, $temp{$i} );
            }
          }
        }
        elsif( !$array[0] && $array[1] && $main::CONV{$array[1]} =~ /HASH\(0x/ )
        {
          @temp  = keys( %{$main::CONV{$array[1]}} );
          $ReStr .= @temp;
        }
        else
        {
          $ReStr .= $here;
        }
      }
# This type means Return value of Function.
      elsif( $type eq '&' && $main::CONV{$array[0]} =~ /CODE\(0x/ )
      {
        @temp = split(/\,/,$array[1]);
        $ReStr .= &{$main::CONV{$array[0]}}(@temp);
      }

      $str = $next;
      next;
    }
    else
    {
#      $ReStr .= $str;
#      last;
      $ReStr .= substr($str,0,1);
      $str = substr($str,1,length($str)-1);
      next;
    }
  }

  return  $ReStr;
}
#---------------------------------------------------------------------

return  1  if( $0 !~ /cwConv\.pm$/ );