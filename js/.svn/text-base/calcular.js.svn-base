function redondear(num)
{ 		
	var original=parseFloat(num);
	if ((original*100%100)>=0.5)
	{
		var result=Math.round(original*100)/100+0.01;
	}
	else
	{
		var result=Math.round(original*100)/100; 		
	}
	return result;
}

function calcular()
{
	if(document.formvalor.calculo.value != "")
	{
		document.formvalor.dato_valor.value = redondear(eval(document.formvalor.calculo.value));
	}
}
