function login_validar(formlogin)
{
    var error='';
    error+=formlogin.login.value==''?'\nlogin':'';
    error+=formlogin.clave.value==''?'\nclave':'';
    if (error!='')
    {
        alert('Por favor indique:'+error);
	    return(false);
    }
	else
	{
		/*document.formlogin.submit();*/
		return(true);
	}
}
