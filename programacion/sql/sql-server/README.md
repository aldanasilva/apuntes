# SQL Server


### identity

###### Archivo: 20200829 - IDENTITY.sql

```
use db_prueba;
go

create table t_prueba(
 id       int           identity,
 nombre   varchar(80)   not null,
 constraint pk_prueba primary key (id)
);
go

insert into t_prueba (nombre)
values ('Andr�s');

set identity_insert t_prueba on;

insert into t_prueba (id, nombre)
values (3, 'Carlos');

set identity_insert t_prueba off;

insert into t_prueba (nombre)
values ('Juliana');

select *
from t_prueba

--drop table t_prueba
```











