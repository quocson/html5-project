// Cookie Save
function setCookie(name,value,days) {
  var date = new Date();
  date.setTime( date.getTime() + (days * 24 * 60 * 60* 1000) );
  value = encodeURIComponent( value );
  
	document.cookie = name+"="+value+"; expires= "+ date.toUTCString() +"; path=/";
}

// Cookie Load
function getCookie( name ) {
  var nameOfCookie = name + "=";
  var x = 0;
  while ( x <= document.cookie.length )
  {
      var y = (x+nameOfCookie.length);
      if ( document.cookie.substring( x, y ) == nameOfCookie ) {
          if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
              endOfCookie = document.cookie.length;
          return decodeURIComponent( document.cookie.substring( y, endOfCookie ) );
      }
      x = document.cookie.indexOf( " ", x ) + 1;
      if ( x == 0 )
      break;
  }
  return "";
}

// Delete Cookie
function deleteCookie(name) {
	setCookie(name,"",-1);
}

