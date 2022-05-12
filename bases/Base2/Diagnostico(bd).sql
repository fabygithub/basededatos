CREATE DATABASE IF NOT EXISTS diagnostico;
USE diagnostico;

DROP TABLE if exists categorias;
CREATE TABLE categorias(
idCategoria tinyint(5) unsigned NOT null AUTO_INCREMENT,
nombreCategoria varchar(15) NOT null DEFAULT '',
descripcion mediumtext NOT null,
imagen varchar(50) NOT null DEFAULT '',
PRIMARY KEY (idCategoria),
UNIQUE KEY Uidx_categorias_name (nombreCategoria)
)ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT charset=utf8;

CREATE TABLE clientes(
	idCliente varchar(5) NOT null DEFAULT '',
    nombreCompania varchar(40) NOT null DEFAULT '',
    nombreContacto varchar (30) NOT null DEFAULT 'Unknown',
    direccion varchar(60) not null DEFAULT '',
    ciudad varchar(15) not null DEFAULT '',
    region varchar(15) not null DEFAULT '',
    codigoPostal varchar(10) not null DEFAULT '',
PRIMARY KEY (idCliente),
    KEY idx_clientes_company_name(nombreCompania),
    KEY idx_clientes_ciudad(ciudad),
    KEY idx_clientes_region(region),
    KEY idx_clientes_codigoPostal(codigoPostal)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE companiasEnvio(
idCompaniaEnvio int(10) unsigned not null AUTO_INCREMENT,
nombreCompania varchar(10) NOT null DEFAULT '',
telefono varchar(24) NOT null DEFAULT '',
PRIMARY KEY (idCompaniaEnvio)
)ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT charset=utf8;

CREATE TABLE empleados(
idEmpleado int(10) unsigned not null AUTO_INCREMENT,
apellido varchar(20) not null DEFAULT '',
nombre varchar(10) not null DEFAULT '',
cargo varchar(30) not null DEFAULT '',
tratamiento varchar(25) not null DEFAULT '',
fechaNacimiento DATETIME not null,
fechaContratacion DATETIME not null,
direccion varchar(60) not null DEFAULT '',
ciudad varchar(15) not null DEFAULT '',
region varchar(15) not null DEFAULT '',
codigoPostal varchar(10) not null DEFAULT '',
pais varchar(15) not null DEFAULT '',
telefonoDomicilio varchar(24) not null DEFAULT '',
extension varchar(4) not null DEFAULT '',
foto varchar(50) not null DEFAULT '',
notas mediumtext,
jefe int(10) unsigned DEFAULT null,
PRIMARY KEY (idEmpleado),
key idx_empleados_apellido (apellido),
key idx_empleados_codigoPostal (codigoPostal),
key idx_jefe (jefe),
CONSTRAINT FK_empleados_report_to foreign key (jefe) REFERENCES empleados
(idEmpleado)
)ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT charset=utf8;

CREATE TABLE proveedores(
idProveedor int(10) unsigned NOT null AUTO_INCREMENT,
nombreCompania varchar(40) NOT null DEFAULT '',
nombreContacto varchar (30) NOT null DEFAULT '',
cargoContacto varchar (30) NOT null DEFAULT '',
direccion varchar (60) NOT null DEFAULT '',
cuidad varchar (15) NOT null DEFAULT '',
region varchar (15) NOT null DEFAULT '',
codigoPostal varchar (10) NOT null DEFAULT '',
pais varchar (15) NOT null DEFAULT '',
telefono varchar (24) NOT null DEFAULT '',
fax varchar (24) NOT null DEFAULT '',
homePage varchar (255) NOT null DEFAULT '', 
PRIMARY KEY (idProveedor),
KEY idx_proveedores_product_name (nombreCompania),
KEY idx_proveedores_codigoPostal (codigoPostal)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

CREATE TABLE regiones(
idRegion INT(11) NOT null AUTO_INCREMENT,
descripcionRegion varchar(50) not null,
PRIMARY key(idRegion)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARset=utf8; 

CREATE TABLE territorios(
idTerritorio varchar(5) not null,
descripcionTerritorio varchar(50) not null,
idRegion int(11) not null,
primary key (idTerritorio),
KEY fk_region_idx (idRegion),
CONSTRAINT fk_region FOREIGN KEY (idRegion) REFERENCES regiones(idRegion)
)ENGINE=InnoDB DEFAULT charset=utf8;

