curso de mysql resumen
https://www.youtube.com/playlist?list=PLCTD_CpMeEKQmH9cRKWWHahygZFtIdwYG

https://www.tutorialesprogramacionya.com/mysqlya/temarios/descripcion.php?cod=68&punto=73&inicio=

// tabla editorial mysql
create table editorial;

//modificar clave primaria
ALTER TABLE editorial MODIFY COLUMN id_editorial varchar(10);

telefono  mysql

create table editorial(
 id_editorial int auto_increment primary key,
 nom_editorial varchar (100) not null,
 direccion varchar (40) not null,
 telefono varchar (40) not null,
 email varchar (40) not null 
);


create table autor(
 id_autor varchar(10) primary key,
 nom_autor varchar (10) not null,
 apat varchar (10) not null,
 amat varchar(10) not null,
 fecha_nac date ,
 nacionalidad varchar (10) not null
);


create table libro(
 id_libro varchar(10) primary key,
 nom_libro varchar (20) not null,
 categoria varchar (40) not null,
 paginas int not null,
 id_editorial varchar (10) not null,
 id_autor varchar (10) not null 
);


//insertar editorial 

insert into editorial values
('ED_001','ALFAGUARA',	'EDIFICIO ', '99542312','ALFAGUARA@GMAIL.COM'),
('ED_002','SANTILLANA','ANDRES BELLO 2209, SANTIAGO'	,'98745563'	,'SANTILLANA@GMAIL.COM'),
('ED_003','PLANETA','BARROS ARANA 1524'	,'36568952','PLANETALIBROS@PLANETA.CL'),
('ED_004','PRENTICE HALL','WENTIS 1489 MIAMI','888-232323',	'PRENTICEHALL@EDUCATION.COM'),
('ED_005','MC GRAU HILL','CRAWFORD 2325, NEW YORK',	'564-874522','MCGRAU@HILL.COM');	


insert into autor values
('AU_111',	'GABRIELA', 'MISTRAL','MISTRAL','7-04-1889','CHILENA'),
('AU_222',	'PABLO' ,'NERUDA','NERUDA',	'12-07-1904','CHILENA'),
('AU_333',	'MARTA',	'BRUNET','CARAVES', '9-08-1897','CHILENA'),
('AU_444',	'JOSE' ,	'DONOSO','YAÑEZ',	'05-10-1924','CHILENA'),
('AU_555',	'MANUEL',	'ROJAS','SEPULVEDA',	'08-01-1896','CHILENA');



//agregar clave foranea
alter table libro add constraint fk_id_editorial foreign key (id_editorial)
references editorial(id_editorial) on delete cascade on update cascade

alter table libro add constraint fk_id_autor foreign key (id_autor)
references autor(id_autor) on delete cascade on update cascade

insert into libro values
('LB_001',	'CIELO, MAR Y TIERRA', 	'POESIA',	'120',	'ED_002',	'AU_111'),
('LB_002',	'CORONACION'	,'NOVELA'	,'350',	'ED_004','AU_444'),
('LB_003',	'UNA HISTORIA CON DOS GATAS','	INFANTIL',	'200',	'ED_001','AU_333'),
('LB_004',	'LANCHAS EN LA BAHIA', 'CUENTO','200',	'ED_005,''AU_555'),
('LB_005',	'20 POEMAS DE AMOR','SONETOS Y POESIA','145', 'ED_003','AU_222');


update autor set fecha =  '7-04-1889'  where id_autor = 'AU_111';
update autor set fecha_nac =  '7-04-1889'  where id_autor = 'AU_111';
update autor set fecha_nac =  1889-04-7  where id_autor = 'AU_111';

update autor set fecha_nac =  '1889-04-7'  where id_autor = 'AU_111',
update autor set fecha_nac = '1904-07-12'   where id_autor = 'AU_222',
update autor set fecha_nac = '1897-08-9'  where id_autor = 'AU_333',
update autor set fecha_nac = '1924-10-05'  where id_autor = 'AU_444',
update autor set fecha_nac = '1896-01-08'  where id_autor = 'AU_555';



//tabla libro  mysql
//tabla autor  mysql



// crear una conexion local

Connection name: localhost
Hostname: 127.0.0.1
port: 3306
Username: root
Password : root

administration : server status

// crear una base de datos
create database prueba;
// usar la base de datos
use prueba;
//borrar la base de datos
drop database prueba;

create database prueba character set utf8mb4 collate utf8mb4_spanish_ci;

seleccionar base : primer icono

crear una tabla en mysql
sintaxis

// crear una base de datos llamada escuela
create database escuela character set utf8mb4 collate utf8mb4_spanish_ci;
use escuela;

// crear una tabla llamada alumnos
create table alumnos(
    id int auto_increment primary key,
    nombre varchar (100) not null,
    grado smallint not null,
    grupo varchar(2) not null,
    fecha_ingreso date default '0000-00-00'
);

use escuela;
show tables;
show columns from alumnos;
show create table alumnos;

// cambiar el nombre de una tabla
rename table alumonos to alumno;
show columns from alumno;

// agregar el campo edades como entero
alter table alumno add edades int not null;

// cambiar el nombre y el tipo
alter table alumno change edades edad smallint not null;


// borrar una columna
alter table alumno drop column edad;

manipular tablas de mysql con la interfaz grafica

create a new schema in the connected server

seleccionar la base de datos
create a new table boton al lado de la base de datos


// crear una tabla
table name : maestros
charse/collation : utfmb4
utfmb4_spanish_ci

// tipo base de datos
engine : innodb


// dato tipo entero
column name : id
datatype : int
pk : yes
nn : yes
ai : yes

// dato tipo varchar
columns name : nombre
datatype : varchar(100)
nn : yes

// dato tipo lista para enumerar
name : grado
datatype : enum('lic','mc','doc')


// dato tipo data con el valor por defecto '0000-00-00'
fecha_ingreso : date
default expression : '0000-00-00'


// nombre de la columna y tipo de dato
nombre : edades
datatype : int


seleccionar la tabla
boton derecho
alter table : edad = smallint
SMALLINT(3) not null;

// borrar lo seleccionado
boton derecho : delete selected

// cambiar de int a smallint
edad SMALLINT(3)

//relaciones entre tablas de mysql
//la relacion esta entre campos comunes entre dos tablas


alumnos     salones             personalLimpieza
id          id                  id
idSalon     idlimpieza          nombre
                                edad

de uno a muchos
de muchos a muchos
de uno a uno


crear una relacion de uno a muchos en mysql

// crear una tabla
create table salon(
    id int not null primary key auto_increment,
    grado int not null,
    grupo varchar(2) not null

);

//borrar una columna
alter table alumno drop column grado;
alter table alumno drop column grupo;

// borrar una columna
alter table alumno drop column idSalon;

// agregar una columna
alter table alumno add column idSalon int not null after id;

//agregar una clave foranea 
alter table alumno add constraint fk_idSalon foreign key idSalon
references salon(id) on delete cascade on update cascade;   

va a  aparecer en  el boton foreing keys
fk_idSalon

// relacion clave foranea y clave primaria
target salon(idSalon -> id)
on update cascade
on delete cascade


//insetar en salon
insert into 'salon' values(1,'A',1),(2,'B',1),(3,'C',1);

//insertar en salon y grupo
insert into 'salon' (grupo,grado) VALUES ('A',1),('B',1),('C',1);

// insetar en la tabla alumno 
insert into 'alumno' (nombre,fecha_ingreso,idSalon) VALUES('JUAN','2020-01-01',1),('TERE','2020-01-01',2);

al borrar una fila en salon con id : 1

se borraran todas las filas de alumno con idSalon = 1 

ver  salon id  para ingresar idSalon de alumno  que corresponde al salon

crear una relacion de uno a muchos en mysql

relacion 1 a muchos
ejemplo

1 salon  -------*  muchos alumnos   : relacion de 1 a muchos

cascade
set null
restrict
no action

alter table alumno drop constraint fk_idSalon;   : borra la clave foranea

boton derecho alter table alumnos  : editar la tabla

foreigns key boton        referenced table
fk_idSalonCascade         'escuela' 'salon'


column     referenced column
idSalon    id


foreign key options

on update cascade
on delete cascade


select * from alumno;   : selecciona toda la tabla
select * from escuela.salon;  


deleted selected : borra lo seleccionado


boton derecho : truncate table : limpia una tabla


foreing key name            referenced table
fk_idSalonCascade     :     'escuela' 'salon'

coliumn       :    referenced column
idSalon            id


// borrar los not nut y los pone como null
// on update on delete set null
// opciones de la clave foranea
// ahora adminte valores nulos
set null

//la foranea puede ir como nulo
nn no seleccionada

// hacer un select y insertar desde abajo
select * 

// foranea opcion
no action

//muchos a muchos relacion


//leer y insertar registros


// mostrar las columnas de la tabla
show colums from alumno

set foreing_key_checks = 1


//actualizar registros en mysql
update alumno set nombre = 'Maria Antineta' where id = '1';

update alumno set nombre = 'Maria Antineta',fecha_ingreso = '2019-01-01' where id = '1';

// agregar una columna
alter table alumno add column nota int not null;

update alumno set nota = nota + 3 where id = 1;

update alumno set nombre=replace(nombre,'uan','uanito');

//eliminar registros en mysql
delete from alumno where id = '1';

//consultar registros en mysql
select idSalon as salon from alumno where idSalon = 3 and nota>=6;

//seleccionar todo y agrupar por salon
select * from alumno group by idSalon;


// contar y agrupar
select idSalon,count(id) as cantidad from alumno group by idSalon;

// seleccionar el maximo y el minimo
select min(notas) as minimanota, max(nota) maximanota from alumno;


// seleccionar hasta el 5
select * from alumno limit 5;

// seleccionar el 6 y 7
select * from alumno limit 5,2;


// ordenar por nota
select * from alumno order by nota desc;


//consultas conbinadas
select * from alumno where (nota = 7 or nota = 8) and idSalon = 1;

// seleccionar numero diferente a 10 y mayor a 5
select * from alumno where nota !=10 and nota <> 5;


// seleccionar los no nulos
select * from alumno where nota is not null;

// seleccionar nota dentro de un rango
select * from alumno  where nota>= 7 and nota <=9


// selecciona nota entre dos valores incluidos ellos
select * from alumno where nota between 7 and 9


// seleccionar entre 2 fechas
select * from alumno where fecha_ingreso between '2019-01-01' and '2020-01-02';

// seleccionar entre 3 alternativas
select * from alumno where idSalon in(2,3,4);

// 2 selects juntos
select * from alumno where idSalon in(select id from salon where grado=2);

// seleccionar el nombre sin mayuscula
select * from alumno where nombre like = 'juan';

// seleccionar palabra que termina con a
select * from alumno where nombre like = '%a';


// seleccionar palabra que no tenga a
select * from alumno where not like = '%a%';

// consultas con inner join left join  y right join en mysql
// se trata de unir columnas entre varias tablas


// juntar dos tablas usando la clave foranea
select * from alumno inner join salon on alumno.idSalon=salon.id;

// seleccionar columnas de 2 tablas
select alumno.nombre,salon.grado inner join salon on alumno.idSalon=salon.id;


// crear otro nombre para las tablas
select alumno.nombre,salon.grado 
from alumno as a
inner join salon as s
on a.idSalon=s.id;

// atrapar los valores nulos a la izquierda
left join

// atrapar los valores nulos a la derecha
right join


//procedimientos almacenados mysql

delimiter //
create procedure alumnos_con_letra(in letra char)
begin
select * 
from alumno
where nombre like concat('%',letra,'%');
end //
delimiter;


// llamar al procedimiento pero no hay alumnos llamado j
call alumnos_con_letra('j');

//borrar un procedimiento
drop procedure alumnos_con_letra;


//procedimiento para contar

delimiter //
create procedure alumnos_con_letra(in letra char)
begin
select count(*) 
from alumno
where nombre like concat('%',letra,'%');
end //
delimiter;


// llamar al procedimiento para contar
call alumnos_con_letra('j');


//procedimiento nuevo 

delimiter //
create procedure alumnos_con_letra(in letra char, out numero int)
begin
select count(*) into numero
from alumno
where nombre like concat('%',letra,'%');
end //
delimiter;


// llamar al procedimiento incorrecto ahora son 2 argumentos
call alumnos_con_letra('j');

// llamar al procedimiento 
// out numero int variable para contar
call alumnos_con_letra('j',@cantidad_j);


// seleccionar el resultado del procedimiento
select @cantidad_j;

// crear un nombre de resultado
select @cantidad_j as alumnos_con_j;

// comentar en mysql
--

//funciones en mysql

delimiter //
create function numero_letras (letra char) returns int
begin
    declare numero int;
    select count(*) into numero from alumno where nombre like concat ('%',letra,'%');
    return numero;
end//
delimiter;


// llamar a la funcion
select numero_letras('j');

// resultado funcion
2

// seleccionar la primera letra de la izquiera
select left(nombre,1) from alumno;









































































































































































































































