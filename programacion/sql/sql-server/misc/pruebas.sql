-- Autor: Andrés Aldana
-- www.github.com/aldanasilva
-- Archivos de origen:
--  - Pruebas SQL Server.sql

-- Archivo: Pruebas SQL Server.sql

--create database db_prueba;
--go

use db_prueba;
go
/*
create table t_encabezado (
 id_encabezado     int        identity(1, 1),
 fechaDeCreacion   datetime   not null,
 consecutivo       char(8)    not null   unique,
 constraint pk_encabezado primary key (id_encabezado)
);
go

create table t_detalle (
 id_detalle      int   identity(1, 1),
 id_encabezado   int   not null,
 constraint pk_detalle primary key (id_detalle)
);
go

alter table t_detalle add constraint fk_detalle_encabezado foreign key (id_encabezado) references t_encabezado(id_encabezado);
go
*/

/*
When SET XACT_ABORT is ON, if a Transact-SQL statement raises a
run-time error, the entire transaction is terminated and rolled back.

When SET XACT_ABORT is OFF, in some cases only the Transact-SQL
statement that raised the error is rolled back and the transaction
continues processing.

set xact_abort off;
*/


dbcc useroptions
--READ COMMITTED

set transaction isolation level read uncommitted



begin transaction tr_003

select *
from t_encabezado
where id_encabezado = 3

insert into t_encabezado (fechaDeCreacion, consecutivo)
output inserted.id_encabezado
values (getdate(), 'ec-00003')

insert into t_detalle (id_encabezado)
output inserted.id_detalle
values (3)

insert into t_detalle (id_encabezado)
output inserted.id_detalle
values (3)





rollback transaction tr_003


select *
from t_encabezado
with (nolock)

select *
from t_encabezado
with (tablock)

select *
from t_encabezado
with (readuncommitted)

select *
from t_encabezado
with (readcommitted)


-- Archivo: 
