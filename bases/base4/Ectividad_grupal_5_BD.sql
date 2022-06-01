/*Creamos la base de datos*/
CREATE SCHEMA bd_telovendo DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;

/*creamos el usuario*/
CREATE USER 'usuariotlv'@'localhost' IDENTIFIED BY '1234';
/*otorgamos privilegio*/
GRANT ALL PRIVILEGES ON bd_telovendo.* TO 'usuariotlv'@'localhost';
FLUSH PRIVILEGES;

/*Creamoa la tabla usuario*/
 CREATE TABLE usuario
(
    id_usuario INT NOT NULL auto_increment,
    nombre varchar (50),
    apellido varchar(50),
    contrasena char(32),
    zona_horaria varchar(5) default 'UTC-3',
	genero char(1),
    telefono varchar (12),
    PRIMARY KEY(id_usuario)
); 

Select* from usuario;

/*Insertamos registros en la tabla usuario*/
INSERT INTO bd_telovendo.usuario (nombre, apellido, contrasena, zona_horaria, genero, telefono) 
VALUES ('Homero', 'Simpson ', 'hom123', default, 'M', '+56963514785'),
('Lisa', 'Simpson', 'lis123', default, 'F', '+56945871236'),
('Edna', 'Krabappel', 'edn123',default , 'F', '+56932145698'),
('Moe', 'Szislak', 'moe123', default, 'M', '+56978521458'),
('Milhouse', 'Van Houten', 'mil123', default, 'M', '+5698741258'),
 ('Ned', 'Flanders', 'ned123', default, 'M', '+56998743256'),
('Patty', 'Bouvier', 'pat123', default , 'F', '+56998742563'),
('Seymour', 'Skinner', 'Sey123', default, 'M', '+56945871256');

/*Creamos la tabla ingreso*/
 CREATE TABLE ingreso
(
    id_ingreso INT NOT NULL auto_increment,
    id_usuario INT NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id_ingreso),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
); 
select * from ingreso; 

/*Insertamos registros en la tabla ingreso*/
INSERT INTO bd_telovendo.ingreso (id_usuario) 
VALUES ('1'),('2'),('3'),('4'),('5'),('6'),('7'), ('8');

/*Modificamos el valor por defecto UTF-3 por UTF-2 en la tabla usuario*/
ALTER TABLE usuario MODIFY COLUMN zona_horaria varchar(5) default 'UTC-2';
ALTER TABLE usuario ALTER COLUMN zona_horaria  SET DEFAULT 'UTC-2';

select * from usuario; 

/*creamos la tabla contacto*/
 CREATE TABLE contacto
(
    id_contacto INT NOT NULL auto_increment,
	id_usuario INT NOT NULL,
    telefono varchar (12),
    correo_electronico varchar (200),
    PRIMARY KEY(id_contacto),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
); 

select * from contacto;

/*insertamos registros en la tabla contacto*/
INSERT INTO bd_telovendo.contacto (id_usuario, telefono, correo_electronico) 
VALUES ('1', '+56963514785', 'homero@correo.cl'),
('2', '+56945871236', 'lisa@correo.cl'),
('3', '+56932145698', 'edna@correo.cl'),
('4', '+56978521458', 'moe@correo.cl'),
('5', '+5698741258', 'milhouse@correo.cl'),
('6', '+56998743256', 'ned@correo.cl'),
('7', '+56998742563', 'patty@correo.cl'),
('8', '+56945871256', 'seymour@correo.cl');

/*referenciamos la tabla contacto con la de usurio a traves de contacto telefónico*/
ALTER TABLE contacto ADD FOREIGN KEY(telefono) REFERENCES usuario(telefono);

describe contacto;