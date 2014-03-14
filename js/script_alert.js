$(function () {
    //Muestro el primer div
    $("#columnas div:eq(0)").show();//show()
    //cada 1 segundo ejecuto la función mostrar()
    setInterval("mostrar()", 3000);
});
mostrar = function () {
    //Oculto el div que se encuentra vivisble
    var div = $("#columnas div:visible").hide();

    //Selecciono el siguiente div que oculte en el paso anterior
    divNext = div.next();
    //Si existe otro div después lo muestro, si no existe quiere decir que es el último, entonces muestro el primero para que la próxima vez que se ejecute la función continue con el segundo
    if (divNext.length) {
        divNext.show();
    } else {
        $("#columnas div:eq(0)").show();
    }
};