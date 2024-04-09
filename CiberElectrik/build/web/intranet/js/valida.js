function ValidarPerfil(){
    if(txtNom.value==""){
        alert("Ingrese el Nombre");
        txtNom.focus();
        return false;
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarPerfil.submit();
        return true;
    }
}


   function ValidarDistrito(){
    if(txtNom.value==""){
        alert("Ingrese el Nombre del Distrito");
        txtNom.focus();
        return false;
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarDistrito.submit();
        return true;
    }

}

 function ValidarCategoria(){
    if(txtNom.value==""){
        alert("Ingrese el Nombre de la Categoria");
        txtNom.focus();
        return false;
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarCategoria.submit();
        return true;
    }

 }
 
  function ValidarUsuario(){
    if(txtNom.value==""){
        alert("Ingrese el Nombre de Usuario");
        txtNom.focus();
        return false;
        
    }else if(txtCla.value==""){
         alert("Ingrese su Clave");
        txtCla.focus();
        return false; 
     }else if(cboPerfil.selectedIndex==0){
      alert("Seleccione un Perfil");
      cboPerfil.focus();
     return false; 
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarUsuario.submit();
        return true;
    }

 }
  
  function ValidarProveedor(){
    if(txtNom.value==""){
        alert("Ingrese su Nombre");
        txtNom.focus();
        return false;
        
    }else if(txtDir.value==""){
         alert("Ingrese su Direccion");
        txtDir.focus();
        return false; 
     }else if(txtTel.value==""){
         alert("Ingrese su Telefono");
        txtTel.focus();
        return false; 
     }else if(txtCor.value==""){
         alert("Ingrese su Correo");
        txtCor.focus();
        return false; 
         }else if(txtRuc.value==""){
         alert("Ingrese su Ruc");
        txtRuc.focus();
        return false; 
     }else if(cboDistrito.selectedIndex==0){
      alert("Seleccione un Distrito");
      cboDistrito.focus();
     return false; 
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarProveedor.submit();
        return true;
    }

 }
  function ValidarProducto(){
    if(txtNom.value==""){
        alert("Ingrese el Nombre del Producto");
        txtNom.focus();
        return false;
        
 
    }else if(txtCan.value==""){
         alert("Ingrese su Cantidad");
        txtCan.focus();
        return false; 
     }else if(txtPre.value==""){
         alert("Ingrese su Precio");
        txtPre.focus();
        return false; 
 
     }else if(cboProveedor.selectedIndex==0){
      alert("Seleccione un Proveedor");
      cboProveedor.focus();
     return false; 
     }else if(cboCategoria.selectedIndex==0){
      alert("Seleccione una Catetoria");
      cboCategoria.focus();
     return false; 
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarProducto.submit();
        return true;
    }

 }
  function ValidarCompra(){
    if(txtFec.value==""){
        alert("Ingrese la Fecha de Compra");
        txtFec.focus();
        return false;
 
     }else if(cboProveedor.selectedIndex==0){
      alert("Seleccione un Proveedor");
      cboProveedor.focus();
     return false; 
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarCompra.submit();
        return true;
    }

 }
 function ValidarDetalleCompra(){
    if(txtPre.value==""){
        alert("Ingrese el Precio");
        txtPre.focus();
        return false;
 
    }else if(txtCan.value==""){
        alert("Ingrese la Cantidad");
        txtCan.focus();
        return false;
 
    
     }else if(cboProducto.selectedIndex==0){
      alert("Seleccione un Producto");
      cboProducto.focus();
     return false; 
    }else if(cboCompra.selectedIndex==0){
      alert("Seleccione una Fecha");
      cboCompra.focus();
     return false; 
        
    }else{
        frmRegistrarDetalleCompra.submit();
        return true;
    }

 }
 
   function ValidarEmpleado(){
    if(txtNom.value==""){
        alert("Ingrese su Nombre");
        txtNom.focus();
        return false;
        
 
    }else if(txtApe.value==""){
         alert("Ingrese su Apellido");
        txtApe.focus();
        return false; 
     }else if(txtCor.value==""){
         alert("Ingrese su Correo");
        txtCor.focus();
        return false; 
     }else if(txtDir.value==""){
         alert("Ingrese su Correo");
        txtDir.focus();
        return false; 
       }else if(rbM.ckecked==false && rbF.checked==false){
         alert("Seleccione su genero");
        rbM.focus();
        return false; 
       }else if(txtFec.value==""){
         alert("Ingrese su fecha");
        txtFec.focus();
        return false; 
         }else if(txtTel.value==""){
         alert("Ingrese su Telefono");
        txtTel.focus();
        return false; 
      }else if(txtSue.value==""){
         alert("Ingrese su Sueldo");
        txtSue.focus();
        return false; 
     }else if(cboDistrito.selectedIndex==0){
      alert("Seleccione un Distrito");
      cboDistrito.focus();
     return false; 
     }else if(cboUsuario.selectedIndex==0){
      alert("Seleccione un Usuario");
      cboUsuario.focus();
     return false; 
    }else if(chkEstado.checked==false){
        alert("Seleccione el estado ");
        chkEstado.focus();
        return false;
        
    }else{
        frmRegistrarEmpleado.submit();
        return true;
    }

 }
 
 

