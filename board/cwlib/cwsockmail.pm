#!/usr/bin/perl
#--------------------------------------------------------------------#
# EasyBoard Execute Program.                                         #
#--------------------------------------------------------------------#
# File Name   : ezplus.cgi                                           #
# Version     : 1.2.0.0                                              #
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

use Socket;

sub SendMailFunc
{
  my( %MAIL ) = @_;
  my( $response, $message );

  $MAIL{'smtp'}    =~ s/\s+//g;
  $MAIL{'message'} =~ s/^\./\.\./gm;
  $MAIL{'message'} =~ s/\r\n/\n/g;
  $MAIL{'message'} =~ s/\n/\r\n/g;

  if(!$MAIL{'tomail'}) { return -8; }
  if(!$MAIL{'smtp'})   { return -9; }

  my( $proto ) = (getprotobyname('tcp'))[2];
  my( $port )  = (getservbyname('smtp','tcp'))[2];
  my( $smtpaddr ) = ( $MAIL{'smtp'} =~ /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ ) ? pack('C4',$1,$2,$3,$4) : (gethostbyname($MAIL{'smtp'}))[4];

  if( !defined($smtpaddr) ) { return  -1; }
  if( !socket(SMTP,AF_INET,SOCK_STREAM,$proto) ) { return  -2; }
  if( !connect(SMTP,pack('Sna4x8',AF_INET,$port,$smtpaddr)) ) { return  -3; }

  my($oldfh) = select(SMTP);
  $| = 1;
  select($oldfh);

  $response = <SMTP>;  if( $response =~ /^[45]/ ) { close(SMTP); return  -4; }

  binmode(SMTP);

  print SMTP "HELO localhost\r\n";
  $response = <SMTP>;  if( $response =~ /^[45]/ ) { close(SMTP); return  -5; }

  print SMTP "MAIL from: $MAIL{'frommail'}\r\n";
  $response = <SMTP>;  if( $response =~ /^[45]/ ) { close(SMTP); return  -5; }

  foreach (split(/, +/,$MAIL{'tomail'}))
  {
    print SMTP "RCPT to: <$_>\r\n";
    $response = <SMTP>;  if( $response =~ /^[45]/ ) { close(SMTP); return  -6; }
  }
  $response = <SMTP>;  if( $response =~ /^[45]/ ) { close(SMTP); return  -6; }

  print SMTP "DATA\r\n";
  $response = <SMTP>;  if( $response =~ /^[45]/ ) { close(SMTP); return  -5; }

  $boundary = "-" x 20 . time . "-cwPlus";

  $message = "From: " . ( $MAIL{'fromname'} ? "$MAIL{'fromname'} <$MAIL{'frommail'}>" : "$MAIL{'frommail'}" ) . "\r\n";

  if( $MAIL{'tomail'} =~ /, / )
  {
    $message .= "To: ";
    foreach (split(/, +/,$MAIL{'tomail'}))
    {
      $message .= "<$_>, ";
    }
    while( $message =~ s/(\,| )$// ) {};
    $message .= "\r\n"
  }
  else
  {
    $message .= "To: " . ( $MAIL{'toname'} ? "$MAIL{'toname'} <$MAIL{'tomail'}>" : "$MAIL{'tomail'}" ) . "\r\n";
  }

  if( $MAIL{'notify'} )
  {
    $message .= "Disposition-Notification-To: $MAIL{'frommail'}\r\n";
  }
  if( $MAIL{'priority'} )
  {
    $message .= "X-Priority: $MAIL{'priority'}\r\n";
  }
  $message .= "Subject: $MAIL{'subject'}\r\n";
  $message .= "MIME-Version: 1.0\r\n";
  $message .= "Content-Type: multipart/mixed; boundary=\"$boundary\"\r\n\r\n";
  $message .= "X-Mailer: cwMail in cwPlus\r\n";
  $message .= "This is a multi-part message in MIME format.\r\n";
  $message .= "--$boundary\r\n";
  $message .= "Content-Type: text/html; charset=euc-kr\r\n";
  $message .= $MAIL{'message'};
#  $message .= "Content-Transfer-Encoding: base64\r\n\r\n";
#  $message .= &EnCodeBASE64($MAIL{'message'});
  $message .= "\r\n";
  foreach( keys %MAIL )
  {
    if( $_ =~ /^file/ && $MAIL{"$_.name"} =~ /(http|ftp|mms):\/\// )
    {
      $message .= "--$boundary\r\n";
      $message .= "Location: ".$MAIL{"$_.name"}."\r\n";
      $message .= "\r\n";
    }
    elsif( $_ =~ /^file/ && $MAIL{"$_.size"} )
    {
      $message .= "Content-Type: application/octet-stream; name=\"".$MAIL{"$_.name"}."\"\r\n";
      $message .= "Content-Transfer-Encoding: base64\r\n";
      $message .= "Content-Disposition: attachment; filename=\"".$MAIL{"$_.name"}."\"\r\n\r\n";
      $message .= &EnCodeBASE64($MAIL{"$_"});
      $message .= "\r\n";
    }
  }
  $message .= "--$boundary" . "--";
  $message .= "\r\n\r\n";

  print SMTP $message;

  print SMTP "\r\n.\r\n";
  $response = <SMTP>;  if( $response =~ /^[45]/ ) { close(SMTP); return  -7; }

  print SMTP "quit\r\n";

  $response = <SMTP>;
  close(SMTP);
  return  $message;
}

sub EnCodeBASE64
{
  my( $str ) = @_;
  return  undef  if(!$str);
  my( @org ) = split(//,$str);
  my( $enclength, @buffer, $i, $restr );
  my( @BASE64 ) = ( 'A','B','C','D','E','F','G','H','I','J',
                    'K','L','M','N','O','P','Q','R','S','T',
                    'U','V','W','X','Y','Z',
                    'a','b','c','d','e','f','g','h','i','j',
                    'k','l','m','n','o','p','q','r','s','t',
                    'u','v','w','x','y','z',
                    '0','1','2','3','4','5','6','7','8','9',
                    '+','/' );

  for( $i = 0; $i < ( @org - 2 ); $i += 3 )
  {
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i])   & 0xFC ) >> 2 ) ];
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i])   & 0x03 ) << 4 )
                                   + ( ( ord($org[$i+1]) & 0xF0 ) >> 4 ) ];
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i+1]) & 0x0F ) << 2 )
                                   + ( ( ord($org[$i+2]) & 0xC0 ) >> 6 ) ];
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i+2]) & 0x3F )      ) ];
  }

  if( $i < @org )
  {
    $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i])   & 0xFC ) >> 2 ) ];
    $buffer[$enclength]   = $BASE64[ ( ( ord($org[$i])   & 0x03 ) << 4 ) ];
    $i++;
    if( $i < @org )
    {
      $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i-1]) & 0x03 ) << 4 )
                                     + ( ( ord($org[$i])   & 0xF0 ) >> 4 ) ];
      $buffer[$enclength++] = $BASE64[ ( ( ord($org[$i])   & 0x0F ) << 2 ) ];
    }
    else
    {
      $buffer[$enclength++] = "=";
    }
    $buffer[$enclength++] = "=";
  }

  $restr = join('',@buffer);
  $restr =~ s/(.{76})/$1\n/g;
  $restr .= /\n/;

  return  $restr;
}

sub DeCodeBASE64
{
  my( $str ) = @_;
  return  undef  if(!$str);
  $str =~ s/\n//g;
  my( $enclength, @buffer, $i, $restr, %BASE64 );
  my( @org ) = ( 'A','B','C','D','E','F','G','H','I','J',
                 'K','L','M','N','O','P','Q','R','S','T',
                 'U','V','W','X','Y','Z',
                 'a','b','c','d','e','f','g','h','i','j',
                 'k','l','m','n','o','p','q','r','s','t',
                 'u','v','w','x','y','z',
                 '0','1','2','3','4','5','6','7','8','9',
                 '+','/' );

  for( $i = 0; $i < @org; $i++ )
  {
    $BASE64{"$org[$i]"} = $i;
  }

  @org = split(//,$str);

  for( $i = 0; $i < @org; $i+=4 )
  {
    $buffer[$enclength++] = chr( ( ( ( $BASE64{$org[$i]}   & 0x3F ) << 2 )
                                 + ( ( $BASE64{$org[$i+1]} & 0x30 ) >> 4 ) ) );
    $buffer[$enclength++] = chr( ( ( ( $BASE64{$org[$i+1]} & 0x0F ) << 4 )
                                 + ( ( $BASE64{$org[$i+2]} & 0x3C ) >> 2 ) ) );
    $buffer[$enclength++] = chr( ( ( ( $BASE64{$org[$i+2]} & 0x03 ) << 6 )
                                 + ( ( $BASE64{$org[$i+3]} & 0x3F )      ) ) );
  }

  $restr = join('',@buffer);

  while( $str =~ s/\=$// )  { chop($restr); }

  return  $restr;
}

return  1;
