$(document).ready(function () {
   /* $("tr #btnEliminar").click(function (e) {
        e.preventDefault();
        var idp = $(this).parent().find('#codp').val();        
        swal({
            title: "Esta Seguro de Eliminar?",
            text: "Una una Vez Eliminado, Debera Agregar de Nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idp);
                swal(" ¡Oh! ¡Registro Borrado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Controla?accion=Carrito";
                    }
                });
            }
        });
    });
/*
$(document).ready(function () {
    $("tr #btnEliminar").click(function (e) {
        e.preventDefault();
        var idp = $(this).parent().find('#codp').val();   
        eliminar(idp);
    });
   
    function eliminar(idp) {
        var url = "Controla?accion=deleteProducto&id=" + idp;
        console.log("hol");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
            }
        });
    }*/
/*
function eliminar(idp) {
        var url = "Controla?accion=Eliminar";
       // console.log("hol");
        $.ajax({
            type:'POST',
            url: url,
            data:"codp="+idp,
            success: function (datat,textStatus,jq) {
                alert("Registro Eliminado");
            }
        })
        }
        
        
   });
   */
   
    $("tr #Cantidad").click(function () {
        var idp = $(this).parent().find("#codpro").val();
        var cantidad = $(this).parent().find("#Cantidad").val();
     var url = "Controla?accion=ActualizarCantidad";
  //   var url="intranet/mantenimiento/carrito/Controla?accion=ActualizarCantidad";
       console.log(idp, cantidad);
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp + "&Cantidad=" + cantidad,
            success: function (data, textStatus, jqXHR) {
                location.href = "Controla?accion=Carrito";
            }
        });
    });    
   
});



