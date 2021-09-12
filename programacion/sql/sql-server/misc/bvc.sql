-- Autor: Andrés Aldana
-- www.github.com/aldanasilva
-- Archivos de origen:
--  - 20181016 - bvc.sql

/*
USE master;
GO

CREATE DATABASE db_bvc;
GO
*/

USE db_bvc;
GO

/*
CREATE TABLE T_Admin_Parametros(
 Id_Admin_Parametros   INT,
 RutaDescargas         VARCHAR(255)   NOT NULL,
 CONSTRAINT pk_Admin_Parametros PRIMARY KEY (Id_Admin_Parametros)
);
GO

INSERT INTO T_Admin_Parametros (Id_Admin_Parametros, RutaDescargas)
VALUES (0, 'C:\Users\Andr�s Aldana\Downloads');
GO

CREATE TABLE T_ArchivosCargados(
 Id_ArchivoCargado   INT,
 FechaDeCarga        DATETIME       NOT NULL   DEFAULT GETDATE(),
 Tabla               VARCHAR(100)   NOT NULL,
 Usuario             VARCHAR(20)    NOT NULL,
 CONSTRAINT pk_ArchivoCargado PRIMARY KEY (Id_ArchivoCargado)
);
GO

CREATE TABLE T_BolsaMillonaria(
 Id_ArchivoCargado   INT           NOT NULL,
 Tipo                VARCHAR(20)   NOT NULL,
 Hora                TIME          NOT NULL,
 Instrumento         VARCHAR(20)   NOT NULL,
 PIndic              FLOAT         NOT NULL,
 DiaAnt              FLOAT         NOT NULL,
 PrecioRef           FLOAT         NOT NULL,
 Cierre              FLOAT         NOT NULL,
 Cant                FLOAT         NOT NULL,
 Vrcn                FLOAT         NOT NULL,
 Cambio              FLOAT         NOT NULL,
 PCompra             FLOAT         NOT NULL,
 PVenta              FLOAT         NOT NULL,
 Prom                FLOAT         NOT NULL,
 [Min]               FLOAT         NOT NULL,
 [Max]               FLOAT         NOT NULL,
 TNegociado          FLOAT         NOT NULL,
 CONSTRAINT pk_BolsaMillonaria PRIMARY KEY (Id_ArchivoCargado)
);
GO
*/

ALTER VIEW C_BolsaMillonaria AS (
 SELECT TOP 20 Hora,
  DiaAnt,
  PrecioRef,
  Cierre,
  PCompra,
  PVenta,
  [Min],
  [Max],
  (([Max] - [Min]) + (PCompra - PVenta)) AS UtilidadMaxima,
  IIF([Max] - [Min] = 0, 0, (Prom - [Min]) / ([Max] - [Min])) AS TendenciaDia,
  IIF([Max] - [Min] = 0, 0, (PVenta - [Min]) / ([Max] - [Min])) AS TendenciaPV,
  ((([Max] - [Min]) + (PCompra - PVenta)) / [Min]) AS D
 FROM T_BolsaMillonaria
 WHERE Id_ArchivoCargado = (
  SELECT MAX(Id_ArchivoCargado)
  FROM T_ArchivosCargados
  WHERE Tabla = 'T_BolsaMillonaria')
  AND PCompra <> 0
  AND PVenta <> 0
  AND [Min] <> 0
  AND [Max] <> 0
 ORDER BY Hora ASC
);
GO

SELECT * FROM C_BolsaMillonaria

