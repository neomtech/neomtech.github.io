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

sub SendMailFunc
{
  my( %MAIL ) = @_;
  my( $response, $message );

  $MAIL{'message'} =~ s/^\./\.\./gm;
  $MAIL{'message'} =~ s/\r\n/\n/g;

  if(!$MAIL{'tomail'}) { return -8; }

  $message = "From: " . ( $MAIL{'fromname'} ? "$MAIL{'fromname'} <$MAIL{'frommail'}>" : "$MAIL{'frommail'}" ) . "\n";

  if( $MAIL{'tomail'} =~ /, / )
  {
    $message .= "To: ";
    foreach (split(/, +/,$MAIL{'tomail'}))
    {
      $message .= "<$_>, ";
    }
    while( $message =~ s/(\,| )$// ) {};
    $message .= "\n"
  }
  else
  {
    $message .= "To: " . ( $MAIL{'toname'} ? "$MAIL{'toname'} <$MAIL{'tomail'}>" : "$MAIL{'tomail'}" ) . "\n";
  }

  if( $MAIL{'notify'} )
  {
    $message .= "Disposition-Notification-To: $MAIL{'frommail'}\n";
  }
  if( $MAIL{'priority'} )
  {
    $message .= "X-Priority: $MAIL{'priority'}\n";
  }
  $message .= "Subject: $MAIL{'subject'}\n";
  $message .= "Content-Type: text/html; charset=euc-kr\n\n";
  $message .= $MAIL{'message'};
  $message .= "\n";
  $message .= "\n\n";

  $CFG{'CfgSendMailProgram'} ||= '/usr/lib/sendmail';
  if( $CFG{'CfgSendMailProgram'} =~ /sendmail$/ )
  {
    $CFG{'CfgSendMailProgram'} .= ' -t';
  }

  if( open(MAIL, "|$CFG{'CfgSendMailProgram'}") )
  {
    print MAIL $message;
    print MAIL "\n.\n";
    close(MAIL);
  }
  return  $message;
}

return  1;
