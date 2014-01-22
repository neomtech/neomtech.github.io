function SubMit( act, uid, name )
{
  document.MemberList.act.value = act;
  document.MemberList.uid.value  = uid;
  if( document.MemberList.act.value == 'del' )
  {
    msg = '승인 거부를 하시면, ' + name + '(' + uid + ')의 정보가 리스트에서 삭제됩니다.\n\n계속하시겠습니까?\n';
    if( confirm(msg) )
    {
      document.MemberList.submit();
    }
  }
  else if( document.MemberList.act.value == 'add' )
  {
    msg = '가입 승인을 하시면, ' + name + '(' + uid + ')의 회원의 정보가 member.cgi로 옮겨집니다.\n\n계속하시겠습니까?\n';
    if( confirm(msg) )
    {
      document.MemberList.submit();
    }
  }
  else if( document.MemberList.act.value == 'info' )
  {
    document.MemberList.submit();
  }
  else if( document.MemberList.act.value == 'save' )
  {
    document.MemberList.submit();
  }
  else
  {
    document.MemberList.submit();
  }
}

function CwPopWin( url, SizeX, SizeY, Name, Menu, Resize, Scroll, PosX, PosY )
{
  if( !SizeX )   { SizeX  = 500;    }
  if( !SizeY )   { SizeY  = 400;    }
  if( !Name )    { Name   = "_new"; }
  if( !Menu )    { Menu   = "no";   }
  if( !Resize )  { Resize = "no";   }
  if( !Scroll )  { Scroll = "yes";  }
  if( !PosX )    { PosX   = 0;      }
  if( !PosY )    { PosY   = 0;      }

  var CwPopWin = window.open( url, Name, "width=" + SizeX + ",height=" + SizeY + ",menubar=" + Menu + ",toolbar=" + Menu + ",location=" + Menu + ",directories=" + Menu + ",resizable=" + Resize + ",scrollbars=" + Scroll + ",status=" + Menu + ",top=" + PosY + ",left=" + PosX );
}

function ChkSubMit()
{
  var isOk;
  var posAt  = document.RegForm.mail.value.indexOf("@");
  var posDot = document.RegForm.mail.value.indexOf(".");
  document.RegForm.act.value = 'add';
  if( !document.RegForm.name.value )
  {
    alert('이름을 입력해주세요.');
    setTimeout( 'document.RegForm.name.focus()', 10 );
  }
  else if( !document.RegForm.id.value )
  {
    alert('아이디를 입력해주세요.');
    setTimeout( 'document.RegForm.id.focus()', 10 );
  }
  else if( !document.RegForm.pass.value )
  {
    alert('비밀번호를 입력해주세요.');
    setTimeout( 'document.RegForm.pass.focus()', 10 );
  }
  else if( document.RegForm.pass.value != document.RegForm.repass.value )
  {
    alert('입력된 두개의 비밀번호가 다릅니다.');
    setTimeout( 'document.RegForm.pass.focus()', 10 );
  }
  else if( !document.RegForm.mail.value )
  {
    alert('이메일을 입력해주세요.');
    setTimeout( 'document.RegForm.mail.focus()', 10 );
  }
  else if( ( posAt < 0 ) || ( posDot < 0 ) || ( posDot < posAt + 2 ) )
  {
    alert('이메일 형식이 잘못되었습니다.');
    setTimeout( 'document.RegForm.mail.focus()', 10 );
  }
  else if( !document.RegForm.home.value )
  {
    if( confirm('홈페이지가 입력되지 않았습니다.\n이대로 전송하시겠습니까?','예','아니오') )
    {
      document.RegForm.submit();
    }
    else
    {
      setTimeout( 'document.RegForm.home.focus()', 10 );
    }
  }
  else if( document.RegForm.home.value.indexOf("\.") < 0 )
  {
    alert('홈페이지 URL 형식이 잘못되었습니다.');
    setTimeout( 'document.RegForm.home.focus()', 10 );
  }
  else
  {
    document.RegForm.submit();
  }
}
