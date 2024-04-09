
$(document).ready(function () {
    $("tr #Cantidad").click(function (e) {
        e.preventDefault();
        var idp = $(this).parent().find('#codpro').val();        
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
                        parent.location.href = "/intranet/mantenimiento/carrito/frmCarrito.jsp";
                 }
                });
            }else{
                swal("Registro no Eliminado");
            }
        });
    });

function eliminar(idp) {
        var url = "Controla?accion=Eliminar";
       // console.log("hol");
        $.ajax({
            type:'POST',
            url: url,
            data:"codp="+codp,
           success: function (data, textStatus, jqXHR) {
                alert("Registro Eliminado");
            }
        });
        
        }
        
        
  

    $("tr #Cantidad").click(function (e) {
        var idp = $(this).parent().find("#codpro").val();
        var cantidad = $(this).parent().find("#Cantidad").val();
        var url = "Controla?accion=ActualizarCantidad";
        console.log(idp, cantidad);
        $.ajax({
            type: 'POST',
            url: url,
            data: "codpro=" + idp + "&Cantidad=" + cantidad,
            success: function (data, textStatus, jqXHR) {
               parent.location.href = "Controla?accion=Carrito";
            }
        });
    });    
   
});



