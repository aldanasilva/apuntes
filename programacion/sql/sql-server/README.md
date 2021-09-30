# SQL Server


### identity

###### Archivo: 20200829 - IDENTITY.sql

```sql
use db_prueba;
go

create table t_prueba(
 id       int           identity,
 nombre   varchar(80)   not null,
 constraint pk_prueba primary key (id)
);
go

insert into t_prueba (nombre)
values ('Andrés');

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

### View code

```sql
declare @viewcode varchar(max) = (select object_definition(object_id('object_name')))
print(@viewcode)
```

### Query table default constraints

```sql
declare @table varchar(128) = 'my_table'

select t.name as table_name, c.name as column_name, dc.definition as default_value
from sys.default_constraints as dc
 inner join sys.tables as t on (dc.parent_object_id = t.object_id)
 inner join sys.columns as c on (dc.parent_object_id = c.object_id and dc.parent_column_id = c.column_id)
where t.name = @table
```

### Using system tables to query objects

```sql
select s.name as schema_name,
 o.name as object_name,
 o.type, o.type_desc,
 o.create_date, o.modify_date,
 m.definition
from sys.sql_modules as m
 inner join sys.objects as o on (m.object_id = o.object_id)
 inner join sys.schemas as s on (o.schema_id = s.schema_id)

select *
from INFORMATION_SCHEMA.VIEWS

select *
from INFORMATION_SCHEMA.VIEW_TABLE_USAGE

select *
from INFORMATION_SCHEMA.ROUTINES

select *
from INFORMATION_SCHEMA.ROUTINE_COLUMNS
```

### ad hoc distributed queries Server Configuration Option

```sql
sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO
```

###### References:
* https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/ad-hoc-distributed-queries-server-configuration-option?view=sql-server-ver15



