function SubMit( act, uid, name )
{
  document.MemberList.act.value = act;
  document.MemberList.uid.value  = uid;
  if( document.MemberList.act.value == 'del' )
  {
    msg = '���� �źθ� �Ͻø�, ' + name + '(' + uid + ')�� ������ ����Ʈ���� �����˴ϴ�.\n\n����Ͻðڽ��ϱ�?\n';
    if( confirm(msg) )
    {
      document.MemberList.submit();
    }
  }
  else if( document.MemberList.act.value == 'add' )
  {
    msg = '���� ������ �Ͻø�, ' + name + '(' + uid + ')�� ȸ���� ������ member.cgi�� �Ű����ϴ�.\n\n����Ͻðڽ��ϱ�?\n';
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
