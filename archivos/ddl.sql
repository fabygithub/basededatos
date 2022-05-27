
create schema awakelab;
use awakelab;

create table estudiante (
	id int unsigned not null auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    last_update timestamp not null default current_timestamp,
    primary key(id)
);

create table facilitador (
	id int unsigned not null auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    last_update timestamp not null default current_timestamp,
    primary key(id)
);


create table curso (
	id int unsigned not null auto_increment,
    nombre varchar(100) not null,
    last_update timestamp not null default current_timestamp,
    primary key(id)
    );

drop table matricula;
create table matricula (
	id_estudiante int unsigned not null,
    id_curso int unsigned not null,
    fecha date,
    last_update timestamp not null default current_timestamp,
    primary key (id_estudiante, id_curso),
    constraint matriculados_fk foreign key (id_estudiante) references estudiante(id) on delete restrict,
    constraint curso_con_matriculados_fk foreign key (id_curso) references curso(id) on delete restrict
);
 

alter table estudiante 
	modify column nombre varchar(100),
    modify column apellido varchar(100);
    
alter table estudiante
	add column fechaNacimiento date,
    add column direccion varchar(100);
    
    
alter table estudiante
	drop column fechaNacimiento;

 
insert into facilitador (nombre, apellido)
values ('Puedo escribir los versos mas tristes esta nocche, escribir por ejemplo "la noche esta estrellada, y tiritan, azules, lo astros a lo lejos', 
	'el viento de la noche gira en cielo y canta. Puedo escribir los versos más tristes esta noche. Ya la quise, y a veces ella también me quiso. En las noches como ésta la tuve entre mis brazos. La besé tantas veces bajo el cielo infinito');
   
select * from matricula where id_curso = 5;
select * from matricula where id_estudiante = 10 and id_curso = 5;



describe estudiante;


