function usuario_validar()
{
    if (document.formusuario.nombre.value === '' || document.formusuario.apellidos.value === '' || document.formusuario.nif.value === ''
            || document.formusuario.login.value === '' || document.formusuario.clave.value === '' || document.formusuario.clave2.value === '')
    {
        alert('Debe rellenar todos los campos marcados como requeridos');
        return(false);
    }
    else
    {
        if (document.formusuario.clave.value === document.formusuario.clave2.value)
        {
            document.formusuario.submit();
            return(true);
        }
        else
        {
            alert('Las claves no coinciden');
            return(false);
        }
    }
}
