# SQL

Archivo: 20170708 - SQL.docx
```
Modificar una tabla

ALTER TABLE table_name
ADD CONSTRAINT constraint_name PRIMARY KEY (field_name)
ADD CONSTRAINT constraint_name FOREIGN KEY (field_name) REFERENCES table_name(field_name)
ADD CONSTRAINT constraint_name UNIQUE (field_name)
ADD field_name datatype
DROP COLUMN field_name
ALTER COLUMN field_name datatype;

```
