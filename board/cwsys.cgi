#--------------------------------------------------------------------#
# Basic Conficuration for ezmem.cgi                                  #
#--------------------------------------------------------------------#
# File Name   : cwsys                                                #
# Version     : 0.0.0.1                                              #
# Programmer  : Yun-Cheol, Chae.                                     #
#               ID       : Cacolith                                  #
#               E-Mail   : cacolith@i.am                             #
#               HomePage : http://cacolith.i.am                      #
# UpDate      : 2001.04.01.                                          #
#--------------------------------------------------------------------#
#  This file is formed for UNIX and Linux                            #
#  So, if you want to edit at WINDOWS, use CAN EDIT UNIX MODE.       #
#    like as Edit Plus, Ultra Editor, EasyPad and etc.               #
#--------------------------------------------------------------------#
#  If you want desciption of this file,                              #
#     visit my homepage. ^^                                          #
#--------------------------------------------------------------------#

# Boundary is just boundary for split section.
boundary="--- CacoWorld / ver 0.01 ---"

#---------------------------------------------------------------------

--- CacoWorld / ver 0.01 ---
# Set PATH for program.
HashName=PATH
# Path, EzBoard 2000 installed.
ezRoot=./
ezSys=./system
# Path, member file exist.
ezMem=./system/users

#---------------------------------------------------------------------

--- CacoWorld / ver 0.01 ---
# Set URL for browser.
HashName=URL
# URL, EzBoard 2000 installed.
ezRoot=./
ezSys=./system
# URL, member file exist.
ezMem=./system/users

--- CacoWorld / ver 0.01 ---
# First Section is default value for HTML
HashName=CFG

#---------------------------------------------------------------------
# If use Socket Mail, Set it.
#CfgSMTP=210.117.148.112
#CfgSMTP=127.0.0.1
# sendmail path.
CfgSendMailProgram=/usr/lib/sendmail

#---------------------------------------------------------------------
# Default Background / Foreground.
# Set Char-Set for korean
CfgLang=euc-kr

# Default Color.
#  'Bk' means BacKground, 'Txt' means TeXT.
#  and, 'Col' means COLor.
CfgBkCol=#FFFFFF
CfgTxtCol=#000000

# Font Set.
# Default is '굴림' for korean.
#  but, not exist, use Arial or fixedsys.
CfgTxtFont=굴림체

# Default Font Size is 9pt.
# It is good to read.
CfgTxtSize=9


CfgLinePerPage=20

#---------------------------------------------------------------------
# Link Type Define

# Linked String Decoration type.
#  0 : no-decoration.
#  1 : under-line.
#  2 : over-line.
#  3 : over and under line. 
#  4 : line-through.
CfgLinkType=0

# Mouse-Over Linked String Decoration type.
#  0 : same as CfgLinkType.
#  1 : under-line.
#  2 : over-line.
#  3 : over and under line. 
#  4 : line-through.
CfgHLinkType=0

# Default Link Target
CfgLinkTarget=_blank

# Default Linked String Color
CfgLinkCol=blue

# Actived Linked String Color
CfgALinkCol=red

# Mouse-Over Linked String Color
CfgHLinkCol=red

# Visited Linked String Color
CfgVLinkCol=purple

# Default Width
CfgWidth=95%
# Default Border
CfgBorder=0
# Default CellSpacing
CfgCellSpacing=1
# Default CellPadding
CfgCellPadding=3

# Skin File Extension
CfgSkinExt=.cgi

# Skin File Extension
CfgReURL=

#---------------------------------------------------------------------
# Error Title and Message
# Do not attach blank line.
--- CacoWorld / ver 0.01 ---
# Title for Regist Ok
name=RegOk
가입이 신청되었습니다.
--- CacoWorld / ver 0.01 ---
# Message for Regist Ok
name=RegOkMsg
비밀번호는 이메일로 보내드립니다.
--- CacoWorld / ver 0.01 ---
# Title for ID Not exist
name=SameID
이미 사용중인 아이디입니다.
--- CacoWorld / ver 0.01 ---
# Message for ID Not exist
name=SameIDMsg
다른 아이디로 다시 신청해주시기 바랍니다.
--- CacoWorld / ver 0.01 ---
# Title for ID Not exist
name=NoID
아이디가 빠졌습니다.
--- CacoWorld / ver 0.01 ---
# Message for ID Not exist
name=NoIDMsg
아이디는 로그인을 위해 필요합니다.
반드시 입력해주십시오.
--- CacoWorld / ver 0.01 ---
# Title for ID Not exist
name=NoName
이름이 빠졌습니다.
--- CacoWorld / ver 0.01 ---
# Message for ID Not exist
name=NoNameMsg
게시판등에서 사용할 이름을 넣어주십시오.
--- CacoWorld / ver 0.01 ---
# Title for ID Not exist
name=NoMail
이메일이 빠졌습니다.
--- CacoWorld / ver 0.01 ---
# Message for ID Not exist
name=NoMailMsg
비밀번호를 이메일로 보내드리고 있습니다.
이메일을 반드시 입력해주시기 바랍니다.
--- CacoWorld / ver 0.01 ---
__EOF__
