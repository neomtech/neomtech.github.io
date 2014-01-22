#--------------------------------------------------------------------
#
#	이지보드 2000 시스템 환경 설정
#
# 이지보드 2000이 동작하기위한 주환경을 설정하는 부분입니다.
# 따라서 정확하게 설정하지 않으면 이지보드가 동작하지 않게 됨에
# 주의 바랍니다.
#
#                        2000.05.03. 전북대학교 전자공학과
#                                    Cherie 채경삼(cherie@hello.to)
#
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# 이지보드 경로 설정
# 대부분의 계정에서는 SystemPath와 CGIWRAPSystemPath 경로를 수정할
# 필요가 없습니다.
#--------------------------------------------------------------------
# 예) /home/httpd/html/ez2000/system
#     /user/cherie/public_html/ez2000/system 등등
SystemPath=./system

# CGIWRAP을 지원하는 경우 http://user.debianlover.org/~cherie/ez2000/system등의
# 형식으로 실제로 웹브라우저에서 보이는 완전한 경로(상대경로)를 적어줘야 한다.
# 이 경로는 다운경로및 이지보드의 아이콘이 제대로 출력되도록 하기위한 경로설정
# 항목입니다.
CGIWRAPSystemPath=./system

# 만일 CGIWRAP을 지원하는 계정에서 이지보드를 설치하려면
# 다음과 같은 방법을 따른다.
#
# @ 사용자 계정이 /cherie 라고 한다면..
# /cherie -+- /cgi-bin          - ezboard디렉토리내의 모든 파일들을 복사
#          |
#          +- /ez2000/system (777)  - ezboard디렉토리밑의 system디렉토리의
#                                 모든 파일 및 디렉토리를 복사
#
# SystemPath와 CGIWRAPSystemPath를 다음과 같이 설정한다.
# SystemPath=/cherie/cgi-bin
# CGIWRAPSystemPath=http://홈페이지/~cherie/ez2000/system


#--------------------------------------------------------------------
# 게시판 관리자 메뉴 초기 비밀번호 설정
#--------------------------------------------------------------------
# 초기 게시판 비밀번호 설정
# 새로운 게시판 생성시 기본 암호를 설정합니다.
# 1.27 정식버전부터는 더 이상 사용하지 않습니다.
# InitPass=0000

# Root 관리자 아이디
# RootID=cherie


#--------------------------------------------------------------------
# 이지보드 보안 관련 설정
#
# DenyUpTXT, DenyUpWinEXE, DenyUpUnixEXE 값을 1로 설정해주면
# 대부분의 크래킹을 막을 수 있습니다.
#--------------------------------------------------------------------
# 다음 확장자의 파일은 업로드하지 못하도록 설정
BadUpFile=.cgi;.php;.php3;.php4;.phtml;.pml;.asp;.sphp3;.sphp4;.shtml;.html;.xml;.xhtml;.class;.jar;.java;

# 다음 파일 형식은 업로드하지 못하도록 설정
# 텍스트형식(일반 텍스트, html, php등)의 업로드 여부 설정
DenyUpTXT=0
# 도스및 윈도우즈용 실행파일 업로드 여부 설정
DenyUpWinEXE=0
# 유닉스(리눅스 포함)용 실행파일 업로드 여부 설정
DenyUpUnixEXE=0


#--------------------------------------------------------------------
# 이지보드 기본 설정
#--------------------------------------------------------------------
# 스마일리 최대 표현 갯수
# 너무 크게 설정하면 게시판이 지저분해질 수 있으므로 10 내외로
# 설정하는 것이 좋습니다.
MaxSmile=10

# 페이지 이동 메뉴 출력 페이지 갯수
MaxPageMenu=10

# 제목/이름이 긴경우 줄여서 보여줄때..
ShortWord=..

# 채니메일 URL
CheniMailURL=http://ezboard.new21.org/cgi/cheniemail/cheniemail.cgi

#--------------------------------------------------------------------
# 확장자에 따른 파일타입 아이콘 설정
#--------------------------------------------------------------------
TypeMax=13
; 0 : 알수 없는 타입에 대한 아이콘
TypeFile0=unknown.gif
; 1 : 업로드가 없는 일반문서 아이콘
TypeFile1=text.gif

TypeExt2=.mp3;.mp2;.ra;.ram;.wav;.aa3;.aac;.mid;.midi;.s3m;.voc;.wrk;.mod;.rol;.ims;.m3u;.pls
TypeFile2=sound.gif
TypeExt3=.mov;.avi;.rm;.mpg;.dat;.mpeg;.asf;
TypeFile3=movie.gif
TypeExt4=.bat;.com;.exe;.pif
TypeFile4=exe.gif
TypeExt5=.zip;.rar;.arj;.zoo;.pak;.gz;.tar;.z
TypeFile5=compress.gif
TypeExt6=.txt;.doc;.cap;.gal;.pdf;.wri
TypeFile6=text.gif
TypeExt7=.hwp
TypeFile7=hwp.gif
TypeExt8=.cpp;.bas;.pas;.asm;.java;.hpp
TypeFile8=source.gif
TypeExt9=.html;.htm
TypeFile9=html.gif
TypeExt10=.cgi;.pl;.pm;.ez;.php3;.asp
TypeFile10=cgi.gif
TypeExt11=.gif;.jpg;.psd;.png;.tiff;.bmp;.pcx;.pic;.tga
TypeFile11=image.gif
TypeExt12=.ttf;.ttc;.fon;.fnt;
TypeFile12=font.gif

# 사운드/이미지/동영상 파일 확장자 설정
# 다음 설정된 확장자는 관리자 옵션에 따라서 직접 실행하도록 동작된다.
SoundExt=.mp3;.mp2;.ra;.ram;.wav;.aa3;.aac;.mid;.midi;.s3m;.voc;.wrk;.mod;.rol;.ims;.m3u;.pls
SoundFile=sound.gif
ImageExt=.gif;.jpg;.psd;.png;.tiff;.bmp;.pcx;.pic;.tga
ImageFile=image.gif
MovieExt=.mov;.avi;.rm;.ram;.mpg;.asf;
MovieFile=movie.gif


# 출력할 날짜 포맷 설정
# %y %m %d : 두자리수 날짜(각각 연/월/일)
# %Y       : 4자리수 연도
# %I %M %S : 두자리수 시간(각각 시/분/초)
# %H       : 24시간제 시간
# %a %A    : 요일  Sun / Sunday
# %b %B    : 달    Jan / January
# %p       : am / pm
DateFormat=%Y/%m/%d, %H:%M:%S
ShortDateFormat=%Y/%m/%d

# 게시물 삭제시 완전 삭제할 것인가 설정
# 1.27 b3버전부터는 사용되지 않습니다.
#
# 0 : 완전 삭제
# 1 : 휴지통으로 이동
# EzDelMode=1


# 로그파일 생성
# 0 : 사용안함
# 1 : 관리자
# 2 : 게시판
# 3 : 관리자/게시판
# 4 : 매니저
# 5 : 관리자/매니저
# 6 : 게시판/매니저
# 7 : 관리자/게시판/매니저
EzLogFile=7

#	로그파일 크기 제한(단위 k)
#	0으로 설정하면 무제한으로 생성됩니다.
EzLogSize=10


# 지역에 따른 시간편차 보정(단위 초)
# 이지보드를 외국계정에 설치한 경우 한국과 시간이 맞지 않는 경우
# 아래값을 적절히 조절하면 시간차를 보정할 수 있습니다.
EzSetTime=0


# 관리자 메뉴 접속시 매번 비밀번호를 묻지 않도록 합니다.
# 보안문제가 없으니 안심하셔도 됩니다.
# 0 : 매번 비밀번호 입력
# 1 : 묻지 않음
AdminCookie=1


# 쿠키 저장시 다음 장소에 추가로 저장해줍니다.
EzMenuCookie=0
EzMenuURL=
EzMenuPath=/


# 스킨의 확장자를 다른 이름으로 변경할 수 있습니다.
# SkinExt=ez

# 기본 암호화키를 설정한다.
# 단 이미 DB가 존재하는 경우에는 절대로 바꾸면 안된다.
Seed=Cherie

# 하단부 로고 설정
# 공개버전에서는 지원되지 않습니다.
BottomBanner=<a href='http://hello.to/cherie' target=_new>Copyright(c) 1999-2000, Cherie</a>
;BottomBanner=<a href='http://hello.to/cherie' target=_new>Copyright(c) 1999-2000, Cherie. all rights reserved</a>

# 회원 로긴시 타임아웃 시간(단위 초)
# 설정시간동안 아무 일도 하지 않는 경우 자동으로 로그아웃상태가 된다
EzSessTimeOut=3600