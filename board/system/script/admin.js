function ColorTheme( Value0, Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10 )
{
  var mf = document.ConfigForm;
  mf.EzDataHeadBkCol.value  = Value0;
  mf.EzDataHeadTxtCol.value = Value1;
  mf.EzDataBkCol.value      = Value2;
  mf.EzDataTxtCol.value     = Value3;
  mf.EzListHeadBkCol.value  = Value4;
  mf.EzListHeadTxtCol.value = Value5;
  mf.EzListBkColOdd.value   = Value6;
  mf.EzListTxtColOdd.value  = Value7;
  mf.EzListBkColEven.value  = Value8;
  mf.EzListTxtColEven.value = Value9;
  mf.EzSelColor.value       = Value10;
}

function SwitchLayer( layer_name, flag )
{
  if( navigator.appName == "Netscape" )
    document.layers[layer_name].visibility = ( ( flag == "show" ) ? "show" : "hide" );
  else
    document.all[layer_name].style.visibility = ( ( flag == "show" ) ? 'visible' : 'hidden' );
}

function SwitchAllLayer( layer_name )
{
  var layer_num, str;

  if( navigator.appName != "Netscape" )
  {
    for( layer_num = 1; layer_num <= maxlayer; layer_num++ )
    {
      str = "MENU" + layer_num;
      document.all[str].style.position = 'absolute';
      SwitchLayer( str, "hide" );
    }
    SwitchLayer( layer_name, "show" );
  }
}

function FormSubmit()
{
  var mf = document.ConfigForm;
  if( mf.pass.value != "" ||
      mf.repass.value != "" )
  {
    if( mf.pass.value != mf.repass.value )
    {
      alert('두개의 암호가 서로 일치하지 않습니다.\n정확하게 입력해주세요.');
      mf.pass.focus();
      return;
    }
  }
  mf.submit();
}

function FormReset()
{
  document.ConfigForm.reset();
}

function OnChangeLang()
{
  var mf = document.ConfigForm;
  mf.EzLang.value = mf.LangList.value;
}

function OnChangeGroup( name )
{
  var mf = document.ConfigForm;
//  alert( mf.GroupList.value );
  mf[name].value = mf['Group'+name].value;
}
