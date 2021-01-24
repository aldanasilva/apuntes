-- Autor: Andrés Aldana
-- www.github.com/aldanasilva
-- Archivos de origen:
--  - 20171217 - Ingeniería - CDH.txt
-- Estado: En proceso

SELECT t1.Id_Distancia,
 t1.Distancia,
 0.03 AS tij,
 1/t1.Distancia AS nij,
 1 AS alpha,
 2 AS beta,
 (tij^alpha)*(nij^beta) AS tijaxnijb,
 t3.Probabilidad
FROM T_Distancias AS t1
 INNER JOIN (
 SELECT t2.Id_LocalizacionOrigen,
  SUM((0.03^1)*((1/t2.Distancia)^2)) AS Probabilidad
 FROM T_Distancias AS t2
 GROUP BY t2.Id_LocalizacionOrigen
 ORDER BY t2.Id_LocalizacionOrigen ASC) AS t3 ON t1.Id_LocalizacionOrigen = t3.Id_LocalizacionOrigen
ORDER BY t1.Id_LocalizacionOrigen ASC, t3.Probabilidad DESC;

SELECT FIRST(t2.Id_Distancia) AS Id_Distancia,
 FIRST(t2.Id_LocalizacionOrigen) AS Id_LocalizacionOrigen,
 FIRST(t2.Distancia) AS Distancia,
 FIRST(t2.tijaxnijb) AS tijaxnijb
FROM (
 SELECT 1 AS asd,
  t1.Id_Distancia,
  t1.Id_LocalizacionOrigen,
  t1.Distancia,
  (0.03^1)*(1/t1.Distancia^2) AS tijaxnijb
 FROM T_Distancias AS t1
 ORDER BY t1.Id_LocalizacionOrigen ASC, (0.03^1)*(1/t1.Distancia^2) DESC) AS t2
GROUP BY t2.Id_LocalizacionOrigen
ORDER BY t2.tijaxnijb DESC;




