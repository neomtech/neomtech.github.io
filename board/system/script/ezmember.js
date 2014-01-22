function SubMit( act )
{
  document.MemberList.act.value = act;
  if( document.MemberList.act.value == 'del' )
  {
    if( confirm('정말로 삭제하시겠습니까?') )
    {
      document.forms["MemberList"].submit();
    }
    else
    {
      setTimeout( 'document.MemberList["N.id"].focus()', 10 );
    }
  }
  else
  {
    document.MemberList.submit();
  }
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
