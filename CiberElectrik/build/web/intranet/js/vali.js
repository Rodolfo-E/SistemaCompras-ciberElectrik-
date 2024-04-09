 function Validacion(){
    if(txtUsu.value==""){
     alert("Ingrese el Nombre de Usuario");
      //  swal("Aviso","Ingrese el Nombre Usuario");
        txtUsu.focus();
        return false;
        
    }else if(txtCla.value==""){
    // swal("Aviso","Ingrese su Clave");
     alert("Ingrese su Clave");
        txtCla.focus();
        return false; 
    
        
    }else{
        frmIngreso.submit();
        return true;
    }

 }
 function Validacionfa(){
      swal("Aviso","Bienvenido al Sistema","succes");
 }

