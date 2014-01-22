#--------------------------------------------------------------------
#	이지보드 2000 기본 환경 설정
#
# 새로운 게시판 생성시 이 설정파일을 통해서 기본적인 환경이 설정되게
# 된다.
# 따라서 미리 원하는 환경으로 설정해두면 더욱 편리하게 게시판을 사용
# 할 수 있습니다.
#
#                        2000.05.03. 전북대학교 전자공학과
#                                    Cherie 채경삼(cherie@hello.to)
#
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# 관리자 설정
#--------------------------------------------------------------------
EzAdminName=
EzAdminMail=
EzAdminHome=
EzHomeTarget=_blank

#--------------------------------------------------------------------
#	필터 설정
#--------------------------------------------------------------------
; 관리자 사칭금지 사용여부
EzAdminProtect=0
; 음란어 검사 여부
EzBadWord=0
; 광고문구 검사 여부
EzBadBanner=0
; 도배글 검사 여부
EzDobaeText=0
; 불량 사용자 차단 by IP
EzBadIP=0
; 불량 사용자 차단 by Name
EzBadName=0
; 불량 사용자 차단 by Mail
EzBadMail=0

#--------------------------------------------------------------------
# 게시판 설정
#--------------------------------------------------------------------
;	브라우저 타이틀
EzBrowserTitle=이지보드 2000

;	게시판 제목
EzBoardTitle=이지보드 2000

;	게시판 제목 그림
EzBoardImage=./system/image/title.gif

;	게시판 제목 출력 설정
EzAutoTitle=1

;	게시판 배경색
EzBackColor=white

;	기본 글자색
EzDefColor=black

;	기본 폰트 이름
EzDefFont=굴림

;	기본 폰트 크기
EzDefFontSize=9

;	목록 제목 배경색
EzListHeadBkCol=#efefef

;	목록 제목 글자색
EzListHeadTxtCol=#000000

;	목록 홀수 배경색
EzListBkColOdd=#ffffff

;	목록 홀수 글자색
EzListTxtColOdd=#000000

;	목록 짝수 배경색
EzListBkColEven=#ffffff

;	목록 짝수 글자색
EzListTxtColEven=#000000

;	본문읽기 제목 배경색
EzDataHeadBkCol=#efefef

;	본문읽기 제목 글자색
EzDataHeadTxtCol=#000000

;	본문 배경색
EzDataBkCol=#ffffff

;	본문 글자색
EzDataTxtCol=#000000

;	게시물 목록 표시 줄수
EzPageLine=12

;	목록 버튼 위치
;	0	:	상
;	1	:	하
;	2 : 상하모두
EzListButtonPos=1

;	본문 버튼 위치
;	0	:	상
;	1	:	하
;	2 : 상하모두
EzContButtonPos=1

;	메일 프로그램 경로
EzMailServer=127.0.0.1
EzMailSender=/usr/lib/sendmail

;	글쓰기 권한
EzAccessWrite=0

; 관련글 작성 여부
EzAccessReply=0

;	게시물 작성시 관리자에게 메일로 알림
EzPostAdmin=0

;	게시물 작성시 원본글 작성자에게 메일로 알림
EzPostReply=1

; 메일 형식
; 1 : HTML
; 0 : Text
EzMailHtml=1

; 자동 링크 설정
EzAutoLink=1

; 자동 링크 타겟 설정
EzLinkTarget=_blank

;	링크 모양
EzLinkType=0

;	링크 색상
EzLinkColor=#000000

;	링크 색상(visit)
EzVLinkColor=dimgray

;	링크 색상(hover)
EzHLinkColor=#000000

; 체크 박스
; 0 : 없음
; 1 : 선택 보기
; 2 : 선택 삭제
EzShowCheckBox=1

;	목록 번호 보이기
EzDocNum=1

;	폴더 아이콘 보이기
EzFolderIcon=1

;	파일 업로드 여부
EzFileUpload=1
EzImgUpload=1

;	파일 종류 아이콘 보이기
EzFileIcon=1

;	하이라이팅 표시 여부
EzHighLight=1

;	페이지 이동 메뉴 보이기
EzShowPageMenu=1

;	검색 메뉴 보이기
EzShowSearch=1

;	긴 제목을 짧게 줄일 길이
EzShortSubjectLen=50

;	긴 이름을 짧게 줄일 길이
EzShortNameLen=8

;	본문읽기에서 본문아래 목록 보이기
EzShowList=1

; 관련글을 작성하는 경우, 원본글의 내용이 처리되어 표기되는데
; 이때 사용할 기호를 나타낸다.
;
; [원본글]
; 이름 : Cherie
; 제목 : 안녕하세요?
; 본문 : 이지보드 2000입니다.
;
; [관련글]
; 이름 : cacolith
; 제목 : Re: 안녕하세요?
;        Cherie님께서 남기신 글입니다.
;        : 이지보드 2000입니다.
;
EzReSubject=Re:
EzReText=님께서 남기신 글입니다.
EzReLine=:

; 이름 보이기
EzShowName=1

; 홈페이지 입력란 보이기
EzShowHome=1

; 조회수 보이기
EzReadCount=1

; 다운수 보이기
EzDownCount=0

; 테이블 설정
EzTableWidth=95%
EzTableBorder=0
EzCellSpacing=0
EzCellPadding=3

; 아이콘 종류 설정
EzButtonName=default
EzTypeName=default
EzSmileName=cacofrog
; 스킨 설정
EzSkinName=default

; 스마일리 설정
EzUseSmile=1

; 그라디언트 색상
EzUseGrad=1

; 회원관리
; 관리자 그룹
EzPermAdmin=axlrwpud
EzGrpAdmin=admin
; 회원1 그룹
EzPermUser1=lrd
EzGrpUser1=user1
; 회원2 그룹
EzPermUser2=lrd
EzGrpUser2=user2
; 회원3 그룹
EzPermUser3=lrd
EzGrpUser3=user3
; 손님 권한
EzPermGuest=lrd
