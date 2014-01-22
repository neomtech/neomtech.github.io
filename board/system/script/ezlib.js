/*
 *  JavaScript Function for EasyBoard 2000 
 */
//---------------------------------------------------------
function SetCookie( name, value, expire )
{
  var exp = new Date();
  var exptime = "";

  if( expire == null )
    expire = 0;

  if( expire <= 0 )
  {
    if( expire < 0 )
      value = "";
    exptime = "";
  }
  else
  {
    exp.setTime( exp.getTime() + (1000 * expire) );
    exptime = "expires=" + exp.toGMTString() + ";";
  }

  document.cookie = name + '=' + value + "; path=/; " + exptime;
//  document.cookie = name + '=' + escape(value) + "; path=/; " + exptime;
}
//---------------------------------------------------------
function DelCookie( name )
{
  document.cookie = name + "=; path=/; expires=Thu, 01-Jan-70 00:00:01 GMT;";
}
//---------------------------------------------------------
