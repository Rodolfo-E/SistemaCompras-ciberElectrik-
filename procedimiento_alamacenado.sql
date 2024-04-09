-- seleccionamos la base de datos
use CiberkElectrik;
-- ------------------------------> Autor: Rodolfo Delgado <--------------------------------------------
-- procedimientos alamcenados > CRUD
-- Registro , Actulizacion, Eliminación, Mostrar y Buscar
-- procedimiento almacenado para mostrar
drop procedure if exists SP_MostrarPerfil;
delimiter $$
create procedure SP_MostrarPerfil()
begin 
select *from t_perfil where estper=1;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarPerfil();

drop procedure if exists SP_ValidarUsuario;
delimiter $$
create procedure SP_ValidarUsuario(in _usu varchar(40),_cla varchar(40))
begin 
select nomusu, clausu from t_usuario where nomusu=_usu and clausu=_cla;
end $$
delimiter ;


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarPerfilTodo;
delimiter $$
create procedure SP_MostrarPerfilTodo()
begin 
select *from t_perfil ;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarPerfilTodo();

-- procedimiento almacenado para Buscar
drop procedure if exists SP_BuscarPerfil;
delimiter $$
create procedure SP_BuscarPerfil(in _cod int)
begin 
select *from t_perfil where codper=_cod;
end $$
delimiter ;


-- Probamos el procedimiento
call SP_BuscarPerfil(2);


drop procedure if exists SP_RegistrarPerfil;
delimiter $$
create procedure SP_RegistrarPerfil(in _nom varchar(30), _est bit)
begin 
insert into t_perfil(nomper,estper) values(_nom,_est);
end $$
delimiter ;

-- Probamos el procedimiento
call SP_RegistrarPerfil('Soporte',0);

select *from t_perfil;

drop procedure if exists SP_ActualizarPerfil;
delimiter $$
create procedure SP_ActualizarPerfil(in _cod int, _nom varchar(30), _est bit)
begin 
update t_perfil set nomper=_nom, estper=_est where codper=_cod;
end $$
delimiter ;

-- Probamos el procedimiento



drop procedure if exists SP_EliminarPerfil;
delimiter $$
create procedure SP_EliminarPerfil(in _cod int)
begin 
update t_perfil set  estper=0 where codper=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_EliminarPerfil(4);
drop procedure if exists SP_HabilitarPerfil;
delimiter $$
create procedure SP_HabilitarPerfil(in _cod int)
begin 
update t_perfil set  estper=1 where codper=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_HabilitarPerfil(2);
-- 
drop procedure if exists SP_MostrarUsuario;
delimiter $$
create procedure SP_MostrarUsuario()
begin 
select u.codusu,u.nomusu,u.clausu,p.codper,p.nomper,u.estusu
 from t_usuario u inner join t_perfil p on u.codper=p.codper
 where estusu=1;
end $$
delimiter ;	

-- Probamos el procedimiento
call SP_MostrarUsuario();

-- Probamos el procedimiento


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarUsuarioTodo;
delimiter $$
create procedure SP_MostrarUsuarioTodo()
begin 
select u.codusu,u.nomusu,u.clausu,p.codper,p.nomper,u.estusu
 from t_usuario u inner join t_perfil p on u.codper=p.codper;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarUsuarioTodo();


-- Buscar Usuario
drop procedure if exists SP_BuscarUsuario;
delimiter $$
create procedure SP_BuscarUsuario(in _cod int)
begin 
select u.codusu,u.nomusu,u.clausu,p.codper,p.nomper,u.estusu
 from T_Usuario u inner join T_Perfil p on u.codper=p.codper
 where u.codusu=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarUsuario(3);


drop procedure if exists SP_RegistrarUsuario;
delimiter $$
create procedure SP_RegistrarUsuario(in _nom varchar(30),_clav varchar(40),_codper int,_est bit)
begin 
insert into T_Usuario(nomusu,clausu,codper,estusu) values(_nom,_clav,_codper,_est);
end $$
delimiter ;

-- Probamos el procedimiento


select *from T_Usuario;
drop procedure if exists SP_ActualizarUsuario;
delimiter $$
create procedure SP_ActualizarUsuario( _nom varchar(30),_cla varchar(40),_est bit,_codp int,_cod int)
begin 
update T_Usuario set nomusu=_nom, clausu=_cla,estusu=_est, codper=_codp  where codusu=_cod;
end $$
delimiter ;



select *from t_usuario;

drop procedure if exists SP_EliminarUsuario;
delimiter $$
create procedure SP_EliminarUsuario(in _cod int)
begin 
update T_Usuario set  estusu=0 where codusu=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_EliminarUsuario(4);



drop procedure if exists SP_HabilitarUsuario;
delimiter $$
create procedure SP_HabilitarUsuario(in _cod int)
begin 
update T_Usuario set  estusu=1 where codusu=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_HabilitarUsuario(2);




drop procedure if exists SP_MostrarDistrito;
delimiter $$
create procedure SP_MostrarDistrito()
begin 
select *from t_distrito where estdis=1;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarDistrito();

-- Probamos el procedimiento


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarDistritoTodo;
delimiter $$
create procedure SP_MostrarDistritoTodo()
begin 
select *from  t_distrito;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarDistritoTodo();


-- Buscar Usuario
drop procedure if exists SP_BuscarDistrito;
delimiter $$
create procedure SP_BuscarDistrito(in _cod int)
begin 
select *from t_distrito where coddis=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarDistrito(2);


drop procedure if exists SP_RegistrarDistrito;
delimiter $$
create procedure SP_RegistrarDistrito(in _nom varchar(30),_est bit)
begin 
insert into t_distrito(nomdis,estdis) values(_nom,_est);
end $$
delimiter ;

-- Probamos el procedimiento
call SP_RegistrarDistrito('ventanilla',0);

select *from t_distrito;
drop procedure if exists SP_ActualizarDistrito;
delimiter $$
create procedure SP_ActualizarDistrito(in _cod int, _nom varchar(30), _est bit)
begin 
update t_distrito set nomdis=_nom,  estdis=_est  where coddis=_cod;
end $$
delimiter ;

call SP_ActualizarDistrito(4,'puente piedra',1);

select *from t_distrito;

drop procedure if exists SP_EliminarDistrito;
delimiter $$
create procedure SP_EliminarDistrito(in _cod int)
begin 
update t_distrito set  estdis=0 where coddis=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_EliminarDistrito(3);

drop procedure if exists SP_HabilitarDistrito;
delimiter $$
create procedure SP_HabilitarDistrito(in _cod int)
begin 
update t_distrito set  estdis=1 where coddis=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_HabilitarDistrito(2);



/*drop procedure if exists SP_MostrarEmpleado;
delimiter $$
create procedure SP_MostrarEmpleado()
begin 
select codemp,nomemp,apeemp,coremp,diremp,genemp,fecemp,telemp,sueemp,fotemp,d.coddis,nomdis,u.codusu,nomusu,estemp 
from  t_empleado e inner join t_distrito d on e.coddis=d.coddis inner join t_usuario u
on e.codusu=u.codusu where estemp=1;
end $$
delimiter ;*/
drop procedure if exists SP_MostrarEmpleado;
delimiter $$
create procedure SP_MostrarEmpleado()
begin 
select codemp,nomemp,apeemp,coremp,diremp,genemp,fecemp,telemp,sueemp,d.coddis,nomdis,u.codusu,nomusu,estemp 
from  t_empleado e inner join t_distrito d on e.coddis=d.coddis inner join t_usuario u
on e.codusu=u.codusu where estemp=1;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_MostrarEmpleado();

-- Probamos el procedimiento


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarEmpleadoTodo;
delimiter $$
create procedure SP_MostrarEmpleadoTodo()
begin 
select codemp,nomemp,apeemp,coremp,diremp,genemp,fecemp,telemp,sueemp,d.coddis,nomdis,u.codusu,nomusu,estemp 
from  t_empleado e inner join t_distrito d on e.coddis=d.coddis inner join t_usuario u
on e.codusu=u.codusu ;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarEmpleadoTodo();


-- Buscar Usuario
drop procedure if exists SP_BuscarEmpleado;
delimiter $$
create procedure SP_BuscarEmpleado(in _cod int)
begin 
select codemp,nomemp,apeemp,coremp,diremp,genemp,fecemp,telemp,sueemp,d.coddis,nomdis,u.codusu,nomusu,estemp 
from  t_empleado e inner join t_distrito d on e.coddis=d.coddis inner join t_usuario u
on e.codusu=u.codusu where codemp=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarEmpleado(2);


drop procedure if exists SP_RegistrarEmpleado;
delimiter $$
create procedure SP_RegistrarEmpleado(in _nom varchar(30),_ape varchar(30),_corr varchar(30),_dire varchar(30),_gen varchar(30),
_fec date,_tel varchar(30),_sue decimal ,_coddis int,_codusu int,_est bit)
begin 
insert into  t_empleado(nomemp,apeemp,coremp,diremp,genemp,fecemp,telemp,sueemp,coddis,codusu,estemp) 
values(_nom,_ape,_corr,_dire,_gen,_fec,_tel,_sue,_coddis,_codusu,_est);
end $$
delimiter ;

-- Probamos el SP_RegistrarEmpleadoprocedimiento
call SP_RegistrarEmpleado('Andrea ','Larosa','landrea@gmail.com','Los Jasmines 450','Masculino','2017-10-19','5895687','250',1,1,1);


select *from t_empleado;
drop procedure if exists SP_ActualizarEmpleado;
delimiter $$
create procedure SP_ActualizarEmpleado(in _nom varchar(30),_ape varchar(30),_corr varchar(30),_dire varchar(30),_gen varchar(30),
_fec date,_tel varchar(30),_sue decimal ,_coddis int,_codusu int,_est bit,_cod int)
begin 
update t_empleado set nomemp=_nom, apeemp=_ape,coremp=_corr,diremp=_dire,genemp=_gen,fecemp=_fec,telemp=_tel,sueemp=_sue,
 estemp=_est,coddis=_coddis,codusu=_codusu where codemp=_cod;
end $$
delimiter ;

call SP_ActualizarEmpleado('artesi','Lobaton','r_artesi@gmail.com','Las palmas 543','Masculino','2018-10-17','5464646','950',2,3,1,2);

select *from t_empleado;

drop procedure if exists SP_EliminarEmpleado;
delimiter $$
create procedure SP_EliminarEmpleado(in _cod int)
begin 
update t_empleado set  estemp=0 where codemp=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_EliminarEmpleado(3);
drop procedure if exists SP_HabilitarEmpleado;
delimiter $$
create procedure SP_HabilitarEmpleado(in _cod int)
begin 
update t_empleado set  estemp=1 where codemp=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_HabilitarEmpleado(2);


drop procedure if exists SP_MostrarCliente;
delimiter $$
create procedure SP_MostrarCliente()
begin 
select codcli,nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,d.coddis,d.nomdis,estcli
from  t_cliente c inner join t_distrito d on c.coddis=d.coddis  where estcli=1;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_MostrarCliente();

drop procedure if exists SP_MostrarClienteTodo;
delimiter $$
create procedure SP_MostrarClienteTodo()
begin 
select codcli,nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,d.coddis,d.nomdis,estcli
from  t_cliente c inner join t_distrito d on c.coddis=d.coddis ;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_MostrarClienteTodo();

drop procedure if exists SP_RegistrarCliente;
delimiter $$
create procedure SP_RegistrarCliente(in _nom varchar(30),_dir varchar(30),_dni varchar(30),_fec varchar(30),_cor varchar(30),
_tel varchar(40),_cel varchar(40) ,_coddis int,_est bit)
begin 
insert into  t_cliente(nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,coddis,estcli) 
values(_nom,_dir,_dni,_fec,_cor,_tel,_cel,_coddis,_est);
end $$
delimiter ;

-- Probamos el SP_RegistrarEmpleadoprocedimiento
call SP_RegistrarEmpleado('Andrea ','Larosa','landrea@gmail.com','Los Jasmines 450','Masculino','2017-10-19','5895687','250',1,1,1);


select *from t_cliente;
drop procedure if exists SP_ActualizarCliente;
delimiter $$
create procedure SP_ActualizarCliente(in _nom varchar(30),_dir varchar(30),_dni varchar(30),_fec varchar(30),_cor varchar(30),
_tel varchar(40),_cel varchar(40) ,_coddis int,_est bit,_cod int)
begin 
update t_cliente set nomcli=_nom, dircli=_dir,dnicli=_dni,feccli=_fec,corcli=_cor,telcli=_tel,celcli=_cel,
 estcli=_est,coddis=_coddis where codcli=_cod;
end $$
delimiter ;
call SP_ActualizarCliente('Anderson ','Los Jasmines 450','8646464','2000-10-19','ander@gmail.com','464648','646464',2,1,7);
drop procedure if exists SP_EliminarCliente;
delimiter $$
create procedure SP_EliminarCliente(in _cod int)
begin 
update t_cliente set  estcli=0 where codcli=_cod;
end $$
delimiter ;

drop procedure if exists SP_BuscarCliente;
delimiter $$
create procedure SP_BuscarCliente(in _cod int)
begin 
select codcli,nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,d.coddis,d.nomdis,estcli
from  t_cliente c inner join t_distrito d on c.coddis=d.coddis where codcli=_cod;
end $$
delimiter ;
-- ---------Proveedor------------------

drop procedure if exists SP_MostrarProveedor;
delimiter $$
create procedure SP_MostrarProveedor()
begin 
select codprove,nomprove,dirprove,telprove,corprove,rucprove,d.coddis,nomdis,estprove
from t_Proveedor p inner join t_distrito d on p.coddis=d.coddis
 where estprove=1;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarProveedor();

-- Probamos el procedimiento


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarProveedorTodo;
delimiter $$
create procedure SP_MostrarProveedorTodo()
begin 
select codprove,nomprove,dirprove,telprove,corprove,rucprove,d.coddis,nomdis,estprove
from t_Proveedor p inner join t_distrito d on p.coddis=d.coddis;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarProveedorTodo();


-- Buscar Usuario
drop procedure if exists SP_BuscarProveedor;
delimiter $$
create procedure SP_BuscarProveedor(in _cod int)
begin 
select codprove,nomprove,dirprove,telprove,corprove,rucprove,d.coddis,nomdis,estprove
from t_Proveedor p inner join t_distrito d on p.coddis=d.coddis
 where  codprove=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarProveedor(2);


drop procedure if exists SP_RegistrarProveedor;
delimiter $$
create procedure SP_RegistrarProveedor(in _nom varchar(30),_dir varchar(40),_tel varchar(10),_corr varchar(40),
_ruc varchar(15),_coddis int ,_est bit)
begin 
insert into t_Proveedor(nomprove,dirprove,telprove,corprove,rucprove,coddis,estprove) 
values(_nom,_dir,_tel,_corr,_ruc,_coddis,_est);
end $$
delimiter ;

-- Probamos el procedimiento
call SP_RegistrarProveedor('Rodolfo','Los Jasmines','6588464','rdelgado@gmail.com','20555454847',1,1);

select *from t_Proveedor;

drop procedure if exists SP_ActualizarProveedor;
delimiter $$
create procedure SP_ActualizarProveedor(in _nom varchar(30),_dir varchar(40),_tel varchar(10),_corr varchar(40),
_ruc varchar(15),_est bit,_codd int ,_cod int)
begin 
update t_Proveedor set nomprove=_nom, dirprove=_dir,telprove=_tel,corprove=_corr, rucprove=_ruc ,coddis=_codd ,estprove=_est 
 where codprove=_cod;
end $$
delimiter ;

call SP_ActualizarProveedor('Rafa Duran ','ddaf','76767','rbenite@gmail.com','20464464656',1,2,5);

select *from t_Proveedor;

drop procedure if exists SP_EliminarProveedor;
delimiter $$
create procedure SP_EliminarProveedor(in _cod int)
begin 
update t_Proveedor set  estprove=0 where codprove=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_EliminarProveedor(4);

drop procedure if exists SP_HabilitarProveedor;
delimiter $$
create procedure SP_HabilitarProveedor(in _cod int)
begin 
update t_Proveedor set  estprove=1 where codprove=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_HabilitarProveedor(2);



-- ---------------------Producto--------------------------
drop procedure if exists SP_MostrarProducto;
delimiter $$
create procedure SP_MostrarProducto()
begin 
select  p.codpro,p.nompro,p.canpro,p.prepro,p.fotpro,pr.codprove,pr.nomprove,c.codcat,c.nomcat,estpro
from t_ProductoTienda p inner join t_proveedor pr on p.codprove=pr.codprove
inner join t_Categoria c on p.codcat=c.codcat where estpro=1;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarProducto();

-- Probamos el procedimiento


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarProductoTodo;
delimiter $$
create procedure SP_MostrarProductoTodo()
begin 
select  codpro,nompro,canpro,prepro,fotpro,pr.codprove,nomprove,c.codcat,nomcat,estpro
from t_ProductoTienda p inner join t_proveedor pr on p.codprove=pr.codprove
inner join t_Categoria c on p.codcat=c.codcat;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarProductoTodo();


-- Buscar Usuario
drop procedure if exists SP_BuscarProducto;
delimiter $$
create procedure SP_BuscarProducto(in _cod int)
begin 
select  p.codpro,p.nompro,p.canpro,p.prepro,p.fotpro,pr.codprove,nomprove,c.codcat,nomcat,estpro
from t_ProductoTienda p inner join t_proveedor pr on p.codprove=pr.codprove
inner join t_Categoria c on p.codcat=c.codcat  where codpro=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarProducto(3);


drop procedure if exists SP_RegistrarProducto;
delimiter $$
create procedure SP_RegistrarProducto(in _nom varchar(30),_can varchar(10),_pre decimal(7,2),
_fotpro varchar(200),_codprove int,_codcat int ,_est bit)
begin 
insert into t_ProductoTienda(nompro,canpro,prepro,fotpro,codprove,codcat,estpro) 
values(_nom,_can,_pre,_fotpro,_codprove,_codcat,_est);
end $$
delimiter ;

-- Probamos el procedimiento


select *from t_ProductoTienda;

drop procedure if exists SP_ActualizarProducto;
delimiter $$
create procedure SP_ActualizarProducto(in _nom varchar(30),_can varchar(10),_pre decimal(7,2),
_fotpro varchar(200),_est bit,_codpr int,_codca int ,_cod int)
begin 
update t_ProductoTienda set nompro=_nom, canpro=_can,prepro=_pre,fotpro=_fotpro,codprove=_codpr,codcat=_codca,estpro=_est 
 where codpro=_cod;
end $$
delimiter ;

-- call SP_ActualizarProducto('listones ','20','450',null,4,2,1,2);

select *from t_ProductoTienda;

drop procedure if exists SP_EliminarProducto;
delimiter $$
create procedure SP_EliminarProducto(in _cod int)
begin 
update t_ProductoTienda set  estpro=0 where codpro=_cod;
end $$
delimiter ;
-- Probamos el procedimiento


drop procedure if exists SP_HabilitarProducto;
delimiter $$  
create procedure SP_HabilitarProducto(in _cod int)
begin 
update t_ProductoTienda set  estpro=1 where codpro
=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_HabilitarProducto(2);

-- ------------------------------Categoria---------------------
drop procedure if exists SP_MostrarCategoria;
delimiter $$
create procedure SP_MostrarCategoria()
begin 
select *from t_Categoria where estcat=1;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarCategoria();

-- Probamos el procedimiento


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarCategoriaTodo;
delimiter $$
create procedure SP_MostrarCategoriaTodo()
begin 
select *from  t_Categoria;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarCategoriaTodo();


-- Buscar Usuario
drop procedure if exists SP_BuscarCategoria;
delimiter $$
create procedure SP_BuscarCategoria(in _cod int)
begin 
select *from t_Categoria where codcat=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarCategoria(2);


drop procedure if exists SP_RegistrarCategoria;
delimiter $$
create procedure SP_RegistrarCategoria(in _nom varchar(30),_est bit)
begin 
insert into t_Categoria(nomcat,estcat) 
values(_nom,_est);
end $$
delimiter ;

-- Probamos el procedimiento
call SP_RegistrarCategoria('madera',1);

select *from t_Categoria;

drop procedure if exists SP_ActualizarCategoria;
delimiter $$
create procedure SP_ActualizarCategoria(in _cod int,_nom varchar(30),_est bit)
begin 
update t_Categoria set nomcat=_nom,estcat=_est 
 where codcat=_cod;
end $$
delimiter ;

call SP_ActualizarCategoria(2,'ceramicos ',0);

select *from t_Categoria;

drop procedure if exists SP_EliminarCategoria;
delimiter $$
create procedure SP_EliminarCategoria(in _cod int)
begin 
update t_Categoria set  estcat=0 where codcat=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_EliminarCategoria(2);

drop procedure if exists SP_HabilitarCategoria;
delimiter $$
create procedure SP_HabilitarCategoria(in _cod int)
begin 
update t_Categoria set  estcat=1 where codcat=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_HabilitarCategoria(2);

-- -------------------Compra-------------------
/*drop procedure if exists SP_MostrarCompra;
delimiter $$
create procedure SP_MostrarCompra()
begin 
 select codcom,feccom,p.codprove,nomprove,estcom 
from  t_Compra c  inner join t_Proveedor p on 
c.codprove=p.codprove where estcom=1;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarCompra();

-- Probamos el procedimiento


-- procedimiento almacenado para mostrar Todo
drop procedure if exists SP_MostrarCompraTodo;
delimiter $$
create procedure SP_MostrarCompraTodo()
begin 
 select codcom,feccom,p.codprove,nomprove,estcom 
from  t_Compra c  inner join t_Proveedor p on 
c.codprove=p.codprove;
end $$

delimiter ;

-- Probamos el procedimiento
call SP_MostrarCompraTodo();


-- Buscar Usuario
drop procedure if exists SP_BuscarCompra;
delimiter $$
create procedure SP_BuscarCompra(in _cod int)
begin 
 select codcom,feccom,p.codprove,nomprove,estcom 
from  t_Compra c  inner join t_Proveedor p on 
c.codprove=p.codprove  where codcom=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarCompra(2);


drop procedure if exists SP_RegistrarCompra;
delimiter $$
create procedure SP_RegistrarCompra(in _fec datetime,_codprove int,_est bit)
begin 
insert into t_Compra(feccom,codprove,estcom) 
values(_fec,_codprove,_est);
end $$
delimiter ;

-- Probamos el procedimiento
call SP_RegistrarCompra('2018-10-18',3,1);

select *from t_Compra;

drop procedure if exists SP_ActualizarCompra;
delimiter $$
create procedure SP_ActualizarCompra(in _cod int,_fec datetime,_codprove int,_est bit)
begin 
update t_Compra set feccom=_fec,codprove=_codprove, estcom=_est 
 where codcom=_cod;
end $$
delimiter ;

call SP_ActualizarCompra(3,'2017-09-28 ',4,1);

select *from t_Compra;

drop procedure if exists SP_EliminarCompra;
delimiter $$
create procedure SP_EliminarCompra(in _cod int)
begin 
update t_Compra set  estcom=0 where codcom=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_EliminarCompra(4);

drop procedure if exists SP_HabilitarCompra;
delimiter $$
create procedure SP_HabilitarCompra(in _cod int)
begin 
update t_Compra set  estcom=1 where codcom=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_HabilitarCompra(5);


-- ----------------------------------Detalles de Compra--------------------------
drop procedure if exists SP_MostrarDetalleCompra;
delimiter $$
create procedure SP_MostrarDetalleCompra()
begin 
select d.prepro,canprodet,p.codpro,nompro,c.codcom,feccom
from t_Detalles_de_Compra d  inner join  t_ProductoTienda p
on d.codpro=p.codpro inner join t_Compra c on
d.codcom=c.codcom ;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_MostrarDetalleCompra();
*/







-- Probamos el procedimiento



-- Buscar Usuario
/*drop procedure if exists SP_BuscarDetalleCompra;
delimiter $$
create procedure SP_BuscarDetalleCompra(in _cod int)
begin 
select *from t_Detalles_de_Compra where codcom=_cod;
end $$
delimiter ;

-- Probamos el procedimiento
call SP_BuscarDetalleCompra(2);


drop procedure if exists SP_RegistrarDetalleCompra;
delimiter $$
create procedure SP_RegistrarDetalleCompra(in _pre decimal,_can int,_codpro int,_codcom int)
begin
insert into t_Detalles_de_Compra(prepro,canprodet,codpro,codcom) 
values(_pre,_can,_codpro,_codcom);
end $$
delimiter ;

-- Probamos el procedimiento
call SP_RegistrarDetalleCompra('251','50',1,4);

select *from t_Detalles_de_Compra;


drop procedure if exists SP_ActualizarDetalleCompra;
delimiter $$
create procedure SP_ActualizarDetalleCompra(in _pre decimal,_can varchar(10),_codpro int,_codcom int)
begin 
update t_Detalles_de_Compra set prepro=_pre,canprodet=_can, codpro=_codpro
 where codcom=_codcom;
end $$
delimiter ;

call SP_ActualizarDetalleCompra(4,'250','50',3);
*/
/*select *from t_Detalles_de_Compra;

drop procedure if exists SP_EliminarDetalleCompra;
delimiter $$
create procedure SP_EliminarDetalleCompra(in _cod int)
begin 
update SP_EliminarDetalleCompra set  estcom=0 where codcom=_cod;
end $$
delimiter ;
-- Probamos el procedimiento
call SP_EliminarDetalleCompra(4);*/








