  

  function ValidarLoguin(){
    if(txtUsu.value==""){
     //   alert("Ingrese el Nombre de Usuario");
        swal("dada","Ingrese el Nombre Usuario464");
        txtUsu.focus();
        return false;
        
    }else if(txtCla.value==""){
         alert("Ingrese su Clave");
        txtCla.focus();
        return false; 
    
        
    }else{
        frmIngreso.submit();
        return true;
    }

 }
  function ValidarLoguinalert(){
    if(txtUsu.value==""){
     //   alert("Ingrese el Nombre de Usuario");
        swal("dada","Ingrese el Nombre Usuario464");
        txtUsu.focus();
        return false;
        
    }else if(txtCla.value==""){
         alert("Ingrese su Clave");
        txtCla.focus();
        return false; 
    
        
    }else{
        frmIngreso.submit();
        return true;
    }

 }