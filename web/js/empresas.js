$(document).ready(function(){
    $('#deleteButton').click(function(){
        $.ajax({
            type: 'DELETE',
            dataType: 'json',
            success: function(respuesta){
                window.location = respuesta.redirect;
            }
        });
    });

    $('#aceptar').click(function(e){
       $('#seleccionarCategoria').html('');

       //el seleccione categoria vale 8
       if($('#categoria').val() == 8 ){
           e.preventDefault();
           $('#seleccionarCategoria').append('<p class="text-danger">Debes seleccionar una categoria</p>');
       }

       //el seleccione provincia vale 53
       if($('#provincia').val() == 53 ){
           e.preventDefault();
           $('#seleccionarCategoria').append('<p class="text-danger">Debes seleccionar una provincia</p>');
       }

    });

    $('#provincia').on('change',function(){
        var json = {
            'idEmpresa':$('#idEmpresa').val(),
            'idProvincia':this.value
        }
        $.ajax({
            url: '/empresas/provincia-ajax',
            type: 'GET',
            data: json,
            success: function(respuesta){
                console.log('terminamos con provincia: '+respuesta);
                $("#cajaMunicipio").html('');
                $("#cajaMunicipio").html(respuesta);
            },
            error : function(xhr, status) {
                alert('Disculpe, existió un problema: '+xhr);
            }
        });
    });

    //Para envio individual
    $('.envio').click(function(e){
        $('#tipo').val('individual');
        $('#idEmpresa').val($(this).attr("value"));
        $('#comentario').val('');
    });

    //Para envio colectivo
    $('#enviarTodos').click(function(e){
        //Inicialización
        $('#comentario').val('');
        var haySeleccionados = false;

        //vamos a recorrer todos los checkbox
        $('.check').each(function(e){
            var id = this.getAttribute('id');
            //var id = $(this).attr('id'); otra manera de hacerlo
            if($('#'+id).prop('checked')){
                haySeleccionados = true;
            }
        });

        if(!haySeleccionados){
            //Al no seleccionar ninguno, mostramos un alert
            $('#envioVacio').html('<p id="alertDanger" class="alert alert-danger" role="alert">Debe seleccionar alguna empresa</p>');
            $("#alertDanger").delay(2000).slideUp(200, function() {
                $(this).alert('close');
            });
        }else{
            //hay seleccionados, por lo tanto abriremos las ventana modal de Confirmar Envio
            $('#confirmarEnvio').modal('show');
            $('#tipo').val('colectivo');
        }
    });

    $('#btnConfirmarEnvio').click(function(){
        //recogemos las variables
        var comentario = $('#comentario').val();
        var tipo = $('#tipo').val();

        if(tipo == 'individual'){
            var idEmpresa =  $('#idEmpresa').val();
            RealizarEnvio(idEmpresa, comentario);
        }else{
            //Esto es la 1ª Manera de hacerlo

            //aqui sera colectivo, vamos a recorrer para ver quien esta chequeado
            //y lo enviamos a realizarenvio
            /* $('.check').each(function(e){
                   var id= this.id;
                   if( $('#'+id).prop('checked') ){
                       var idEmpresa= $('#'+id).attr('value');
                       console.log('ID: '+id+" comentario: "+comentario+" value: "+$('#'+id).attr('value'));
                       RealizarEnvio(idEmpresa, comentario);
                   }
               });
            */

            //Segunda manera de hacerlo y creo que la más eficiente
            var json={
                'check': $('.check').serializeArray(),
                'comentario': $('#comentario').val()
            }
            $.ajax({
                url: 'envioColectivo-ajax',
                data: json,
                type:'GET',
                success: function(respuesta){
                    MostrarEnvioFinalizado();
                }
            });
        }
    });

    function RealizarEnvio(id, comentario){
        var json = {
            'idEmpresa':id,
            'comentario': comentario
        };
        $.ajax({
            url: 'envio-ajax',
            data: json,
            type:'GET',
            success: function(respuesta){
                MostrarEnvioFinalizado();
            }
        });
    }

    function MostrarEnvioFinalizado(){
        $('#envioVacio').html('<p id="alertSuccess" class="alert alert-success" role="alert">El envio se ha realizado correctamente</p>');
        $("#alertSuccess").delay(2000).slideUp(200, function() {
            $(this).alert('close');
        });
        //Deseleccionamos todos los check
        $('.check').prop("checked", false);
    }
});