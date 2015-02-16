function redondear(num)
{
    var result;
    var original = parseFloat(num);
    if ((original * 100 % 100) >= 0.5)
    {
        result = Math.round(original * 100) / 100 + 0.01;
    }
    else
    {
        result = Math.round(original * 100) / 100;
    }
    return result;
}

function calcular()
{
    if (document.formvalor.calculo.value !== "")
    {
        document.formvalor.dato_valor.value = redondear(eval(document.formvalor.calculo.value));
    }
}
