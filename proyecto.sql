/* ********************************************************************************************************************* */
CREATE TABLE db_daluca.usuario
(
	tipo_usuario 		char(1) 	not null, 
	cedula 		BigInt 		not null,
	nombre 		varchar(70) not null,
	apellido	varchar(70) not null,
	ID_usuario		varchar(70) 	,
	
	fecha_nacimiento	date	,
	primary key (ID_usuario)
);

CREATE TABLE db_daluca.usuario_tiene_telefono
(
	ID_usuario varchar(70) not null references db_daluca.usuario(ID_usuario) on delete cascade on update cascade,
	telefono BigInt not null,
	primary key(ID_usuario,telefono)
);
/* ********************************************************************************************************************* */
CREATE TABLE db_daluca.solicitud_ticket
(
	numero_solicitud 	integer		not null,
	descripcion varchar(500) not null,
	fecha_cierre date not null,
	estatus varchar(70) not null, /*dominio:*/
	tipo_incidente varchar(70) not null, /*dominio: */
	prioridad varchar(70) not null, /*dominio: */
	descripcion_solucion varchar(500) not null, 
	tiempo_requerido time not null,
	primary key(numero_solicitud)
	foreign key (cedula) references usuario(cedula)
);
/* ********************************************************************************************************************* */
CREATE TABLE db_daluca.departamento
(
	ID_departamento 			varchar(70) 		not null,
	nombre_dpto  varchar(70) not null,
	descripcion  varchar(500) not null,

	
	primary key (ID_departamento)
);
/* ********************************************************************************************************************* */
CREATE TABLE db_daluca.usuario_genera_solicitud
(
	ID_usuario 			BigInt 		not null  references db_daluca.usuario(ID_usuario) on delete cascade on update cascade,
	numero_solicitud 			integer 		not null references db_daluca.solicitud_ticket(numero_solicitud) on delete cascade on update cascade,
	fecha_inicio 			date 		not null,

	
	primary key (ID_usuario,numero_solicitud)
);
/* ********************************************************************************************************************* */
CREATE TABLE db_daluca.departamento_atiende_solicitud
(
	ID_departamento varchar(70) not null references db_daluca.departamento(ID_departamento) on delete cascade on update cascade,
	numero_solicitud integer not null references db_daluca.solicitud_ticket(numero_solicitud) on delete cascade on update cascade,
	primary key (ID_departamento,numero_solicitud)
);
/* ********************************************************************************************************************* */
CREATE TABLE db_daluca.usuario_pertenece_departamento
(
	ID_departamento varchar(70) not null references db_daluca.departamento(ID_departamento) on delete cascade on update cascade,
	ID_usuario 			BigInt 		not null  references db_daluca.usuario(ID_usuario) on delete cascade on update cascade,	
	primary key(ID_usuario,ID_departamento)
);
/* ********************************************************************************************************************* */
