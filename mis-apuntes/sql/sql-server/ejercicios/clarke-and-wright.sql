-- Autor: Andrés Aldana
-- www.github.com/aldanasilva
-- Fecha de creación: 2019-08-15
-- Archivos de origen:
--  - 20190815 - Ruteo en SQL.sql

use master;
go

if (select count(*) from sys.databases where name = 'Industrial') > 0
begin
 drop database Industrial
end
go

CREATE DATABASE Industrial;
GO

USE Industrial;
GO

CREATE TABLE T_Distancia (
 Origen         VARCHAR(10),
 Destino        VARCHAR(10),
 Distancia      FLOAT)
GO

CREATE TABLE T_Ahorro (
 Origen       VARCHAR(10),
 Destino      VARCHAR(10),
 OToOrigen    FLOAT,
 OrigenToO    FLOAT,
 OToDestino   FLOAT,
 DestinoToO   FLOAT,
 Distancia    FLOAT,
 Ahorro       FLOAT)
GO

CREATE TABLE T_Ruteo (
 Orden       INT,
 Origen      VARCHAR(10),
 Destino     VARCHAR(10),
 Distancia   FLOAT)
GO

create table T_Localizacion (
 Id_Localizacion      int,
 CodLocalizacion      varchar(10)    not null,
 NombreLocalizacion   varchar(255)   not null,
 Direccion            varchar(255)   not null,
 Latitud              float,
 Longitud             float,
 Origen               bit,
 Destino              bit
);
go

insert into T_Localizacion (Id_Localizacion, CodLocalizacion, NombreLocalizacion, Direccion, Latitud, Longitud, Origen, Destino)
values (1, 'O1', 'Bodega 1', '', '4.70211685005472', '-74.0542471284203', 1, 0),
 (2, 'O2', 'Bodega 2', '', '4.61060719204043', '-74.0893487239419', 1, 0),
 (3, 'O3', 'Bodega 3', '', '4.66000891333983', '-74.1368058266797', 1, 0),
 (4, 'D1', 'éxito suba', '', '4.74835', '-74.09737', 0, 1),
 (5, 'D2', 'éxito colina', '', '4.73412', '-74.06428', 0, 1),
 (6, 'D3', 'éxito granada hills', '', '4.72705', '-74.037339', 0, 1),
 (7, 'D4', 'éxito san rafel', '', '4.72239', '-74.06208', 0, 1),
 (8, 'D5', 'éxito tecnology', '', '4.71683', '-74.04416', 0, 1),
 (9, 'D6', 'éxito quirigua', '', '4.70833', '-74.10453', 0, 1),
 (10, 'D7', 'éxito exprees la carolina', '', '4.7043', '-74.04212', 0, 1),
 (11, 'D8', 'éxito unicentro', '', '4.702238', '-74.041608', 0, 1),
 (12, 'D9', 'éxito zarzamora', '', '4.697761', '-74.109096', 0, 1),
 (13, 'D10', 'éxito pasadena', '', '4.69462', '-74.06182', 0, 1),
 (14, 'D11', 'éxito floresta', '', '4.68853', '-74.07344', 0, 1),
 (15, 'D12', 'éxito fontibon', '', '4.67122', '-74.153', 0, 1),
 (16, 'D13', 'éxito exprees 85', '', '4.66695', '-74.0499', 0, 1),
 (17, 'D14', 'éxito modelia', '', '4.6652', '-74.12033', 0, 1),
 (18, 'D15', 'éxito quirinal', '', '4.65423', '-74.08692', 0, 1),
 (19, 'D16', 'éxito exprees 56', '', '4.64267', '-74.06225', 0, 1),
 (20, 'D17', 'éxito tintal', '', '4.64262', '-74.15598', 0, 1),
 (21, 'D18', 'éxito 51', '', '4.63895', '-74.06776', 0, 1),
 (22, 'D19', 'éxito nuevo kenedy', '', '4.62343', '-74.15415', 0, 1),
 (23, 'D20', 'éxito ciudad de roma', '', '4.61406', '-74.17501', 0, 1),
 (24, 'D21', 'éxito colseguros', '', '4.60497', '-74.074269', 0, 1),
 (25, 'D22', 'éxito centro', '', '4.6012', '-74.07719', 0, 1),
 (26, 'D23', 'cuidad monte', '', '4.59828', '-74.10988', 0, 1),
 (27, 'D24', 'éxito restrepo', '', '4.58818', '-74.1', 0, 1),
 (28, 'D25', 'éxito centenario', '', '4.5865', '-74.11119', 0, 1),
 (29, 'D26', 'éxito jardin', '', '4.58231', '-74.09696', 0, 1),
 (30, 'D27', 'cc tunal', '', '4.578183', '-74.130145', 0, 1),
 (31, 'D28', 'éxito 20 de julio', '', '4.57237', '-74.09157', 0, 1);
go

INSERT INTO T_Distancia (Origen, Destino, Distancia)
VALUES ('D15', 'O2', '7.307'),
 ('D16', 'O2', '7.137'),
 ('D18', 'O2', '6.044'),
 ('D21', 'O2', '2.904'),
 ('D22', 'O2', '3.357'),
 ('D23', 'O2', '3.549'),
 ('D24', 'O2', '3.04'),
 ('D25', 'O2', '4.68'),
 ('D26', 'O2', '4.125'),
 ('D27', 'O2', '7.466'),
 ('D28', 'O2', '5.732'),
 ('O2', 'D15', '7.938'),
 ('D16', 'D15', '4.796'),
 ('D18', 'D15', '4.204'),
 ('D21', 'D15', '8.263'),
 ('D22', 'D15', '8.323'),
 ('D23', 'D15', '10.296'),
 ('D24', 'D15', '11.049'),
 ('D25', 'D15', '11.427'),
 ('D26', 'D15', '11.829'),
 ('D27', 'D15', '14.213'),
 ('D28', 'D15', '13.436'),
 ('O2', 'D16', '7.24'),
 ('D15', 'D16', '3.956'),
 ('D18', 'D16', '2.369'),
 ('D21', 'D16', '5.763'),
 ('D22', 'D16', '5.606'),
 ('D23', 'D16', '9.598'),
 ('D24', 'D16', '10.351'),
 ('D25', 'D16', '10.729'),
 ('D26', 'D16', '8.906'),
 ('D27', 'D16', '13.515'),
 ('D28', 'D16', '9.455'),
 ('O2', 'D18', '5.721'),
 ('D15', 'D18', '4.361'),
 ('D16', 'D18', '1.916'),
 ('D21', 'D18', '5.173'),
 ('D22', 'D18', '5.136'),
 ('D23', 'D18', '8.079'),
 ('D24', 'D18', '8.833'),
 ('D25', 'D18', '9.21'),
 ('D26', 'D18', '9.612'),
 ('D27', 'D18', '11.996'),
 ('D28', 'D18', '11.22'),
 ('O2', 'D21', '4.51'),
 ('D15', 'D21', '7.627'),
 ('D16', 'D21', '4.991'),
 ('D18', 'D21', '4.861'),
 ('D22', 'D21', '0.64'),
 ('D23', 'D21', '5.625'),
 ('D24', 'D21', '4.434'),
 ('D25', 'D21', '5.695'),
 ('D26', 'D21', '4.163'),
 ('D27', 'D21', '8.811'),
 ('D28', 'D21', '4.488'),
 ('O2', 'D22', '3.87'),
 ('D15', 'D22', '10.252'),
 ('D16', 'D22', '6.768'),
 ('D18', 'D22', '8.988'),
 ('D21', 'D22', '2.367'),
 ('D23', 'D22', '4.986'),
 ('D24', 'D22', '3.794'),
 ('D25', 'D22', '5.055'),
 ('D26', 'D22', '3.524'),
 ('D27', 'D22', '8.171'),
 ('D28', 'D22', '3.848'),
 ('O2', 'D23', '3.258'),
 ('D15', 'D23', '8.792'),
 ('D16', 'D23', '8.623'),
 ('D18', 'D23', '7.529'),
 ('D21', 'D23', '5.511'),
 ('D22', 'D23', '5.89'),
 ('D24', 'D23', '2.074'),
 ('D25', 'D23', '2.451'),
 ('D26', 'D23', '3.636'),
 ('D27', 'D23', '5.742'),
 ('D28', 'D23', '4.634'),
 ('O2', 'D24', '3.798'),
 ('D15', 'D24', '10.18'),
 ('D16', 'D24', '10.01'),
 ('D18', 'D24', '8.917'),
 ('D21', 'D24', '4.202'),
 ('D22', 'D24', '4.655'),
 ('D23', 'D24', '2.327'),
 ('D25', 'D24', '1.669'),
 ('D26', 'D24', '1.096'),
 ('D27', 'D24', '4.083'),
 ('D28', 'D24', '2.583'),
 ('O2', 'D25', '3.973'),
 ('D15', 'D25', '10.354'),
 ('D16', 'D25', '10.185'),
 ('D18', 'D25', '9.091'),
 ('D21', 'D25', '5.707'),
 ('D22', 'D25', '6.159'),
 ('D23', 'D25', '2.356'),
 ('D24', 'D25', '1.832'),
 ('D26', 'D25', '2.19'),
 ('D27', 'D25', '3.133'),
 ('D28', 'D25', '2.997'),
 ('O2', 'D26', '4.945'),
 ('D15', 'D26', '11.326'),
 ('D16', 'D26', '8.737'),
 ('D18', 'D26', '7.752'),
 ('D21', 'D26', '4.335'),
 ('D22', 'D26', '4.788'),
 ('D23', 'D26', '3.762'),
 ('D24', 'D26', '1.565'),
 ('D25', 'D26', '2.823'),
 ('D27', 'D26', '4.889'),
 ('D28', 'D26', '1.631'),
 ('O2', 'D27', '6.745'),
 ('D15', 'D27', '12.279'),
 ('D16', 'D27', '12.109'),
 ('D18', 'D27', '11.016'),
 ('D21', 'D27', '8.097'),
 ('D22', 'D27', '8.549'),
 ('D23', 'D27', '4.368'),
 ('D24', 'D27', '4.038'),
 ('D25', 'D27', '2.887'),
 ('D26', 'D27', '4.562'),
 ('D28', 'D27', '5.203'),
 ('O2', 'D28', '6.081'),
 ('D15', 'D28', '12.463'),
 ('D16', 'D28', '9.005'),
 ('D18', 'D28', '9.127'),
 ('D21', 'D28', '4.603'),
 ('D22', 'D28', '5.056'),
 ('D23', 'D28', '4.563'),
 ('D24', 'D28', '2.738'),
 ('D25', 'D28', '3.123'),
 ('D26', 'D28', '1.596'),
 ('D27', 'D28', '5.7')
GO

CREATE PROCEDURE procCyW(
 @O VARCHAR(10))
AS

 BEGIN TRANSACTION Tran1
  
  SET NOCOUNT ON

  DELETE FROM T_Ahorro
  DELETE FROM T_Ruteo

  INSERT INTO T_Ahorro (Origen, Destino, OToOrigen, OrigenToO, OToDestino, DestinoToO, Distancia, Ahorro)
  SELECT t1.Origen,
   t1.Destino,
   t3.Distancia AS OToOrigen,
   t5.Distancia AS OrigenToO,
   t7.Distancia AS OToDestino,
   t9.Distancia AS DestinoToO,
   t1.Distancia,
   (t5.Distancia + t7.Distancia - t1.Distancia) AS Ahorro
  FROM T_Distancia AS t1
   INNER JOIN (
    SELECT t2.*
    FROM T_Distancia AS t2
    WHERE t2.Origen = @O) AS t3 ON (t1.Origen = t3.Destino)
   INNER JOIN (
    SELECT t4.*
    FROM T_Distancia AS t4
    WHERE t4.Destino = @O) AS t5 ON (t1.Origen = t5.Origen)
   INNER JOIN (
    SELECT t6.*
    FROM T_Distancia AS t6
    WHERE t6.Origen = @O) AS t7 ON (t1.Destino = t7.Destino)
   INNER JOIN (
    SELECT t8.*
    FROM T_Distancia AS t8
    WHERE t8.Destino = @O) AS t9 ON (t1.Destino = t9.Origen)
  WHERE t1.Origen <> @O AND t1.Destino <> @O
  
  DECLARE @Origen VARCHAR(10)
  DECLARE @Destino VARCHAR(10)
  DECLARE @Iteracion INT = 1
  DECLARE @NIteraciones INT
  DECLARE @Verificar INT
  DECLARE @O2 VARCHAR(10)
  DECLARE @O3 VARCHAR(10)

  SELECT @NIteraciones = COUNT(Origen) - 1
  FROM T_Distancia
  WHERE Origen = @O

  WHILE @Iteracion <= @NIteraciones
  BEGIN
   SELECT TOP 1 @Origen = Origen,
    @Destino = Destino
   FROM T_Ahorro
   WHERE Ahorro = (
    SELECT MAX(Ahorro)
    FROM T_Ahorro)
   ORDER BY Origen ASC, Destino ASC
   
   SET @O3 = @Destino
   SET @Verificar = 1
   
   --Se valida que la ruta escogida no cierre el ciclo
   WHILE @Verificar <= @Iteracion
   BEGIN
    SELECT @O2 = Destino
	FROM T_Ruteo
	WHERE Origen = @O3
	
	SET @O3 = @O2
	
	SET @Verificar = @Verificar + 1
   END

   IF @O2 = @Origen
   BEGIN
    DELETE FROM T_Ahorro
	WHERE Origen = @Origen
	 AND Destino = @Destino
   END
   ELSE
   BEGIN

    INSERT INTO T_Ruteo (Origen, Destino, Distancia)
    SELECT Origen,
	 Destino,
	 Distancia
	FROM T_Distancia
	WHERE Origen = @Origen
	 AND Destino = @Destino
   
    DELETE FROM T_Ahorro
    WHERE Origen = @Origen
     OR Destino = @Destino
     OR (Origen = @Destino AND Destino = @Origen)

    SET @Iteracion = @Iteracion + 1
   END
  END

  INSERT INTO T_Ruteo (Origen, Destino, Distancia)
  SELECT Origen, Destino, Distancia
  FROM T_Distancia
  WHERE (Origen = @O
   AND Destino = (
    SELECT Destino
	FROM T_Ahorro))
   OR (Origen = (
    SELECT Origen
	FROM T_Ahorro)
	AND Destino = @O)
  
  SET @Iteracion = 1
  SET @NIteraciones = @NIteraciones + 2
  SET @O3 = @O

  WHILE @Iteracion <= @NIteraciones
  BEGIN
   UPDATE T_Ruteo
   SET Orden = @Iteracion
   WHERE Origen = @O3

   SELECT @O3 = Destino
   FROM T_Ruteo
   WHERE Origen = @O3

   SET @Iteracion = @Iteracion + 1
  END

 COMMIT TRANSACTION Tran1

 SELECT *
 FROM T_Ruteo
 ORDER BY Orden ASC

 DECLARE @Total FLOAT
 SELECT @Total = SUM(Distancia) FROM T_Ruteo

 SET NOCOUNT OFF

 PRINT CONCAT('La distancia total recorrida es ', @Total, ', En Excel se logr� 39.267 usando colonia de hormigas y luego intercambio por pares')
;
GO

EXEC procCyW 'O2'

--https://maps.googleapis.com/maps/api/distancematrix/xml?origins=4.70211685005472,-74.0542471284203&destinations=4.73412,-74.06428&key=AIzaSyCJvlBN0aVG0r85NWGdLHJ_aThi4ZDrHAs&mode=

--select *
--from T_Distancia

select *
from T_Localizacion


