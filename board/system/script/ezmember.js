function SubMit( act )
{
  document.MemberList.act.value = act;
  if( document.MemberList.act.value == 'del' )
  {
    if( confirm('������ �����Ͻðڽ��ϱ�?') )
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
    alert('�̸��� �Է����ּ���.');
    setTimeout( 'document.RegForm.name.focus()', 10 );
  }
  else if( !document.RegForm.id.value )
  {
    alert('���̵� �Է����ּ���.');
    setTimeout( 'document.RegForm.id.focus()', 10 );
  }
  else if( !document.RegForm.pass.value )
  {
    alert('��й�ȣ�� �Է����ּ���.');
    setTimeout( 'document.RegForm.pass.focus()', 10 );
  }
  else if( document.RegForm.pass.value != document.RegForm.repass.value )
  {
    alert('�Էµ� �ΰ��� ��й�ȣ�� �ٸ��ϴ�.');
    setTimeout( 'document.RegForm.pass.focus()', 10 );
  }
  else if( !document.RegForm.mail.value )
  {
    alert('�̸����� �Է����ּ���.');
    setTimeout( 'document.RegForm.mail.focus()', 10 );
  }
  else if( ( posAt < 0 ) || ( posDot < 0 ) || ( posDot < posAt + 2 ) )
  {
    alert('�̸��� ������ �߸��Ǿ����ϴ�.');
    setTimeout( 'document.RegForm.mail.focus()', 10 );
  }
  else if( !document.RegForm.home.value )
  {
    if( confirm('Ȩ�������� �Էµ��� �ʾҽ��ϴ�.\n�̴�� �����Ͻðڽ��ϱ�?','��','�ƴϿ�') )
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
    alert('Ȩ������ URL ������ �߸��Ǿ����ϴ�.');
    setTimeout( 'document.RegForm.home.focus()', 10 );
  }
  else
  {
    document.RegForm.submit();
  }
}
