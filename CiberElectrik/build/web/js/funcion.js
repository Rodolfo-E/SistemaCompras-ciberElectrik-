
$(document).ready(function () {
    $("tr #btnEliminar").click(function (e) {
        e.preventDefault();
        var codp = $(this).parent().find('#codp').val();        
        swal({
            title: "Esta Seguro de Eliminar?",
            text: "Una una Vez Eliminado, Debera Agregar de Nuevo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(codp);
                swal(" ¡Oh! ¡Registro Borrado! ", {
                    icon: "success",
                }).then((willDelete) => {
                    if (willDelete) {
                        parent.location.href = "Control?menu=Carrito&accion=listado";
                    }
                });
            }else{
                swal("Registro no Eliminado");
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

function eliminar(idp) {
        var url = "Controla?hacer=Eliminar";
       // console.log("hol");
        $.ajax({
            type:'POST',
            url: url,
            data:"codp="+codp,
            success: function (datat,textStatus,jq) {
                alert("Registro Eliminado");
            }
        })
        
        }
        
        
   });  

