#--------------------------------------------------------------------
#
#	�������� 2000 �ý��� ȯ�� ����
#
# �������� 2000�� �����ϱ����� ��ȯ���� �����ϴ� �κ��Դϴ�.
# ���� ��Ȯ�ϰ� �������� ������ �������尡 �������� �ʰ� �ʿ�
# ���� �ٶ��ϴ�.
#
#                        2000.05.03. ���ϴ��б� ���ڰ��а�
#                                    Cherie ä���(cherie@hello.to)
#
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# �������� ��� ����
# ��κ��� ���������� SystemPath�� CGIWRAPSystemPath ��θ� ������
# �ʿ䰡 �����ϴ�.
#--------------------------------------------------------------------
# ��) /home/httpd/html/ez2000/system
#     /user/cherie/public_html/ez2000/system ���
SystemPath=./system

# CGIWRAP�� �����ϴ� ��� http://user.debianlover.org/~cherie/ez2000/system����
# �������� ������ ������������ ���̴� ������ ���(�����)�� ������� �Ѵ�.
# �� ��δ� �ٿ��ι� ���������� �������� ����� ��µǵ��� �ϱ����� ��μ���
# �׸��Դϴ�.
CGIWRAPSystemPath=./system

# ���� CGIWRAP�� �����ϴ� �������� �������带 ��ġ�Ϸ���
# ������ ���� ����� ������.
#
# @ ����� ������ /cherie ��� �Ѵٸ�..
# /cherie -+- /cgi-bin          - ezboard���丮���� ��� ���ϵ��� ����
#          |
#          +- /ez2000/system (777)  - ezboard���丮���� system���丮��
#                                 ��� ���� �� ���丮�� ����
#
# SystemPath�� CGIWRAPSystemPath�� ������ ���� �����Ѵ�.
# SystemPath=/cherie/cgi-bin
# CGIWRAPSystemPath=http://Ȩ������/~cherie/ez2000/system


#--------------------------------------------------------------------
# �Խ��� ������ �޴� �ʱ� ��й�ȣ ����
#--------------------------------------------------------------------
# �ʱ� �Խ��� ��й�ȣ ����
# ���ο� �Խ��� ������ �⺻ ��ȣ�� �����մϴ�.
# 1.27 ���Ĺ������ʹ� �� �̻� ������� �ʽ��ϴ�.
# InitPass=0000

# Root ������ ���̵�
# RootID=cherie


#--------------------------------------------------------------------
# �������� ���� ���� ����
#
# DenyUpTXT, DenyUpWinEXE, DenyUpUnixEXE ���� 1�� �������ָ�
# ��κ��� ũ��ŷ�� ���� �� �ֽ��ϴ�.
#--------------------------------------------------------------------
# ���� Ȯ������ ������ ���ε����� ���ϵ��� ����
BadUpFile=.cgi;.php;.php3;.php4;.phtml;.pml;.asp;.sphp3;.sphp4;.shtml;.html;.xml;.xhtml;.class;.jar;.java;

# ���� ���� ������ ���ε����� ���ϵ��� ����
# �ؽ�Ʈ����(�Ϲ� �ؽ�Ʈ, html, php��)�� ���ε� ���� ����
DenyUpTXT=0
# ������ ��������� �������� ���ε� ���� ����
DenyUpWinEXE=0
# ���н�(������ ����)�� �������� ���ε� ���� ����
DenyUpUnixEXE=0


#--------------------------------------------------------------------
# �������� �⺻ ����
#--------------------------------------------------------------------
# �����ϸ� �ִ� ǥ�� ����
# �ʹ� ũ�� �����ϸ� �Խ����� ���������� �� �����Ƿ� 10 ���ܷ�
# �����ϴ� ���� �����ϴ�.
MaxSmile=10

# ������ �̵� �޴� ��� ������ ����
MaxPageMenu=10

# ����/�̸��� ���� �ٿ��� �����ٶ�..
ShortWord=..

# ä�ϸ��� URL
CheniMailURL=http://ezboard.new21.org/cgi/cheniemail/cheniemail.cgi

#--------------------------------------------------------------------
# Ȯ���ڿ� ���� ����Ÿ�� ������ ����
#--------------------------------------------------------------------
TypeMax=13
; 0 : �˼� ���� Ÿ�Կ� ���� ������
TypeFile0=unknown.gif
; 1 : ���ε尡 ���� �Ϲݹ��� ������
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

# ����/�̹���/������ ���� Ȯ���� ����
# ���� ������ Ȯ���ڴ� ������ �ɼǿ� ���� ���� �����ϵ��� ���۵ȴ�.
SoundExt=.mp3;.mp2;.ra;.ram;.wav;.aa3;.aac;.mid;.midi;.s3m;.voc;.wrk;.mod;.rol;.ims;.m3u;.pls
SoundFile=sound.gif
ImageExt=.gif;.jpg;.psd;.png;.tiff;.bmp;.pcx;.pic;.tga
ImageFile=image.gif
MovieExt=.mov;.avi;.rm;.ram;.mpg;.asf;
MovieFile=movie.gif


# ����� ��¥ ���� ����
# %y %m %d : ���ڸ��� ��¥(���� ��/��/��)
# %Y       : 4�ڸ��� ����
# %I %M %S : ���ڸ��� �ð�(���� ��/��/��)
# %H       : 24�ð��� �ð�
# %a %A    : ����  Sun / Sunday
# %b %B    : ��    Jan / January
# %p       : am / pm
DateFormat=%Y/%m/%d, %H:%M:%S
ShortDateFormat=%Y/%m/%d

# �Խù� ������ ���� ������ ���ΰ� ����
# 1.27 b3�������ʹ� ������ �ʽ��ϴ�.
#
# 0 : ���� ����
# 1 : ���������� �̵�
# EzDelMode=1


# �α����� ����
# 0 : ������
# 1 : ������
# 2 : �Խ���
# 3 : ������/�Խ���
# 4 : �Ŵ���
# 5 : ������/�Ŵ���
# 6 : �Խ���/�Ŵ���
# 7 : ������/�Խ���/�Ŵ���
EzLogFile=7

#	�α����� ũ�� ����(���� k)
#	0���� �����ϸ� ���������� �����˴ϴ�.
EzLogSize=10


# ������ ���� �ð����� ����(���� ��)
# �������带 �ܱ������� ��ġ�� ��� �ѱ��� �ð��� ���� �ʴ� ���
# �Ʒ����� ������ �����ϸ� �ð����� ������ �� �ֽ��ϴ�.
EzSetTime=0


# ������ �޴� ���ӽ� �Ź� ��й�ȣ�� ���� �ʵ��� �մϴ�.
# ���ȹ����� ������ �Ƚ��ϼŵ� �˴ϴ�.
# 0 : �Ź� ��й�ȣ �Է�
# 1 : ���� ����
AdminCookie=1


# ��Ű ����� ���� ��ҿ� �߰��� �������ݴϴ�.
EzMenuCookie=0
EzMenuURL=
EzMenuPath=/


# ��Ų�� Ȯ���ڸ� �ٸ� �̸����� ������ �� �ֽ��ϴ�.
# SkinExt=ez

# �⺻ ��ȣȭŰ�� �����Ѵ�.
# �� �̹� DB�� �����ϴ� ��쿡�� ����� �ٲٸ� �ȵȴ�.
Seed=Cherie

# �ϴܺ� �ΰ� ����
# �������������� �������� �ʽ��ϴ�.
BottomBanner=<a href='http://hello.to/cherie' target=_new>Copyright(c) 1999-2000, Cherie</a>
;BottomBanner=<a href='http://hello.to/cherie' target=_new>Copyright(c) 1999-2000, Cherie. all rights reserved</a>

# ȸ�� �α�� Ÿ�Ӿƿ� �ð�(���� ��)
# �����ð����� �ƹ� �ϵ� ���� �ʴ� ��� �ڵ����� �α׾ƿ����°� �ȴ�
EzSessTimeOut=3600