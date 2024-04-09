	-- creacion de la bd--
drop database if exists CiberkElectrik;
create database CiberkElectrik;

-- seleccionar la bd
use CiberkElectrik;

drop table if exists t_perfil;
create table t_perfil(
codper int primary key auto_increment,
nomper varchar(40)not null,
estper bit not null
);
insert into t_perfil(nomper,estper) values('Administrador',1);
insert into t_perfil(nomper,estper) values('Recepcionista',1);
insert into t_perfil(nomper,estper) values('Cajero',1);
insert into t_perfil(nomper,estper) values('Vendedor',1);
insert into t_perfil(nomper,estper) values('Jefe de Almacen',1);
insert into t_perfil(nomper,estper) values('Jefe de Area',1);
insert into t_perfil(nomper,estper) values('Seguridad',0);
/*
drop table if exists t_menu;
create table t_menu(
codmen int primary key auto_increment,
nommen varchar(40)not null,
icomen varchar(40)not null,
rutmen varchar(40)not null,
estme bit not null
);
drop table if exists t_submenu;
create table t_submenu(
codsme int primary key auto_increment,
nomsme varchar(40)not null,
icosme varchar(40)not null,
rutsme varchar(40)not null,
estsme bit not null
);


drop table if exists t_detallemenu;
create table t_detallemenu(
coddmen int primary key auto_increment,
codsme int not null,
codper int not null,
codmen int not null,
foreign key(codsme) references t_submenu(codsme),
foreign key(codper) references t_perfil(codper),
foreign key(codmen) references t_menu(codmen)
);*/

drop table if exists t_usuario;
create table t_usuario(
codusu int primary key auto_increment,
nomusu varchar(40) not null,
clausu varchar(40) not null,
codper int not null,
estusu bit not null,
foreign key (codper) references t_perfil(codper)
);

insert into t_usuario(nomusu,clausu,codper,estusu)values('Rodolfo','15151515',1,1);
insert into t_usuario(nomusu,clausu,codper,estusu)values('Alexis','123456',2,1);
insert into t_usuario(nomusu,clausu,codper,estusu)values('Jimy','123123',3,1);
insert into t_usuario(nomusu,clausu,codper,estusu)values('smorales','654321',4,1);
insert into t_usuario(nomusu,clausu,codper,estusu)values('Jose','123',4,1);
select *from t_usuario;

drop table if exists t_distrito;
create table t_distrito(
coddis int auto_increment primary key,
nomdis varchar(50) not null,
estdis bit not null
);
-- insertamos datos
insert into t_distrito(nomdis,estdis)  values  ('Cercado de Lima',1);
insert into t_distrito(nomdis,estdis)  values ('Breña',1);
insert into t_distrito(nomdis,estdis)  values ('Surco',1);
insert into t_distrito(nomdis,estdis)  values ('Callao',1);
insert into t_distrito(nomdis,estdis)  values ('La molina',1);

drop table if exists t_cliente;
create table t_cliente(
codcli int primary key auto_increment,
nomcli varchar(40) not null,
dircli varchar(40) not null,
dnicli varchar(40) not null,
feccli varchar(40) not null,
corcli varchar(40) not null,
telcli varchar(40) not null,
celcli varchar(40) not null,
coddis int not null,
estcli bit not null,
foreign key (coddis) references t_distrito(coddis)
);

insert into t_cliente(nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,coddis,estcli)values('Benjamin','Amazonas 145','98756768','25-10-2020','bjamin@gmail.com','7946467','849434343',1,1);
insert into t_cliente(nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,coddis,estcli)values('Alexander','Los lirios 180','986445','18-06-2020','alexander@gmail.com','7976464','844683495',2,1);
insert into t_cliente(nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,coddis,estcli)values('Jimmy','curva 14','984546458','18-12-2020','jimmy@gmail.com','7994346','943486435',3,1);
insert into t_cliente(nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,coddis,estcli)values('Edison','Guzman 456','987464685','20-06-2020','edison@gmail.com','7964434','863464872',4,1);
insert into t_cliente(nomcli,dircli,dnicli,feccli,corcli,telcli,celcli,coddis,estcli)values('Andrea','Amancaes 167','987545668','05-10-2019','andrea@gmail.com','9348645','943876737',5,1);
drop table if exists t_empleado;

create table t_empleado(
codemp int auto_increment primary key,
nomemp varchar(40) not null,
apeemp varchar(40) not null,
coremp varchar(50) not null,
diremp varchar(50) not null,
genemp varchar (50) not null,
fecemp date not null,
telemp varchar(10)not null,
sueemp decimal(7,2)not null,
-- fotemp longblob null,
coddis int not null,
codusu int not null,
estemp bit not null,
foreign key (coddis) references t_distrito(coddis),
foreign key (codusu)references t_usuario(codusu)
);

drop table if exists t_Proveedor;
create table t_Proveedor(
codprove int auto_increment primary key,
nomprove varchar(50) not null,
dirprove varchar(50) not null,
telprove varchar(10) not null,
corprove varchar(50) not null,
rucprove varchar (15)not null,
coddis int not null,
estprove bit not null,
foreign key (coddis)references t_distrito(coddis)

);
-- insertamos datos
insert into t_Proveedor(nomprove,dirprove,telprove,corprove,coddis,rucprove,estprove)
values('Armando Torres','La Florida 132','54654566','a_torres@gamil.com',1,'206556465',1);
insert into t_Proveedor(nomprove,dirprove,telprove,corprove,coddis,rucprove,estprove)
values('Andrea Larosa','Amazonas 45','46545457','a_larosa@gmail.com',2,'201654655',1);
insert into t_Proveedor(nomprove,dirprove,telprove,corprove,coddis,rucprove,estprove)
values('Rafael Bravo','Los lirios 210 ','46545647','b_rafa@gmail.com',3,'205644665',1);
insert into t_Proveedor(nomprove,dirprove,telprove,corprove,coddis,rucprove,estprove)
values('Fernanda Rosas','Proceres 85','64564564','f_rosas@gamil.com',4,'20464644',1);
insert into t_Proveedor(nomprove,dirprove,telprove,corprove,coddis,rucprove,estprove)
values('Alejandro Piedra','Tupac Amaru 135','46544636','a_piedra@gmail.com',5,'204646589',1);
drop table if exists t_Categoria;
create table t_Categoria(
codcat int auto_increment primary key,
nomcat varchar(50) not null,
estcat bit not null
);
insert into t_Categoria(nomcat,estcat) values ('Materiales Petreos',1);
insert into t_Categoria(nomcat,estcat) values ('Ceramicos y vidrios',1);
insert into t_Categoria(nomcat,estcat) values ('Union',1);
insert into t_Categoria(nomcat,estcat) values ('Metales',1);
insert into t_Categoria(nomcat,estcat) values ('Acabados',1);

drop table if exists t_ProductoTienda;
create table t_ProductoTienda(
codpro int auto_increment primary key,
nompro varchar(50) not null,
canpro varchar(10)not null,
prepro decimal(7,2)not null,
fotpro varchar(200),
codprove int not null,
codcat int not null,
estpro bit not null,
foreign key(codprove)references t_proveedor(codprove),
foreign key(codcat)references t_Categoria(codcat)
);
insert into t_ProductoTienda(nompro,canpro,prepro,fotpro,codprove,codcat,estpro)
values('Rocas','1500','252','licuadora.png',1,1,1);
insert into t_ProductoTienda(nompro,canpro,prepro,fotpro,codprove,codcat,estpro)
values('Porcelana','1200','150','microondas.jpg',2,2,1);
insert into t_ProductoTienda(nompro,canpro,prepro,fotpro,codprove,codcat,estpro)
values('Cola','1400','162','lavadora.jpg',3,3,1);
insert into t_ProductoTienda(nompro,canpro,prepro,fotpro,codprove,codcat,estpro)
values('Remaches','1000','160','refrigeradora.jpg',4,4,1);
insert into t_ProductoTienda(nompro,canpro,prepro,fotpro,codprove,codcat,estpro)
values('Pinturas','2500','142','aspiradora.jpg',5,5,1);

select *from t_ProductoTienda;

drop table if exists t_ticketpedido;
create table t_ticketpedido(
nrotic int auto_increment primary key,
fectic date,
fantic date,
codcli int not null,
codemp int not null,
foreign key(codcli)references t_cliente(codcli),
foreign key(codemp)references t_empleado(codemp)
);

drop table if exists t_detalleticketproducto;
create table t_detalleticketproducto(
nrotic int not null,
codpro int not null,
cantdet int not null,
predet int not null,
foreign key(nrotic)references t_ticketpedido(nrotic),
foreign key(codpro)references t_ProductoTienda(codpro)

);

drop table if exists t_tipocomprobante;
create table t_tipocomprobante(
codtco int auto_increment primary key,
nomtco varchar(40) not null,
esttco bit not null
);

drop table if exists t_comprobantepago;
create table t_comprobantepago(
nrocom int auto_increment primary key,
feccom date,
igvcom double not null,
fancom date,
estcom bit not null,
nrotic int not null,
codemp int not null,
codtco int not null,
foreign key(nrotic)references t_ticketpedido(nrotic),
foreign key(codemp)references t_empleado(codemp),
foreign key(codtco)references t_tipocomprobante(codtco)
);
drop table if exists T_Guia_Remisión;
create table  T_Guia_Remision
(
idremi int primary key,
nrocom int not null,
nrotic int not null,
codcli int not null,
foreign key(nrocom)references t_comprobantepago(nrocom),
foreign key(nrotic)references t_ticketpedido(nrotic),
foreign key(codcli)references t_cliente(codcli)
);

drop table if exists t_Detalles_de_Compra;
create table t_Detalles_de_Compra(
coddcom int primary key,
codpro int not null,
nompro varchar(50)not null,
prepro varchar(50)not null,
canpro varchar (10)not null,
foreign key(codpro)references t_ProductoTienda(codpro)

);

drop table if exists t_Compra;
create table t_Compra(
Nrcom int auto_increment primary key,
feccom datetime not null,
estcom bit not null,
codprove int not null,
codemp int not null,
coddcom int not null,
foreign key (codprove) references t_Proveedor(codprove),
foreign key (codemp) references t_empleado(codemp),
foreign key (coddcom) references t_Detalles_de_Compra(coddcom)
);

drop table if exists t_SalidaProducto;
create  table t_SalidaProducto(
NroSalida int auto_increment primary key,
Fecsali datetime not null,
nomemp varchar (50) not null,
distri varchar (50) not null,
fpedi varchar (50),
referencia varchar(50),
cantidad varchar(50)not null,
peso varchar(50)not null,
descripcion varchar(50)not null,
contabilidad varchar(50)not null,
codpro  int not null,
foreign key (codpro) references t_ProductoTienda(codpro)
);
