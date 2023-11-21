//Función que se ejecuta al inicio
function init(){
	mostrarform(true);
	//listar();

	$("#formulario").on("submit",function(e)
	{
		guardaryeditar(e);	
	});
	$('#mVentas').addClass("treeview active");
    $('#lClientes').addClass("active");
}
function guardaryeditar(e)
{
	e.preventDefault(); //No se activará la acción predeterminada del evento
	$("#btnGuardar").prop("disabled",true);
	var formData = new FormData($("#formulario")[0]);

	$.ajax({
            url: "UsuarioControlador?action=add",
	    type: "POST",
	    data: formData,
	    contentType: false,
	    processData: false,

	    success: function(datos)
	    {                    
	          bootbox.alert(datos);	          
	          mostrarform(false);
	          tabla.ajax.reload();
	    }

	});
	limpiar();
}


