--B)

a)CHEQUEAR.

CREATE VIEW GR16_Mascotas_Mayor_Servicios 
AS SELECT M.* 
FROM GR16_MASCOTA M INNER JOIN GR16_SERVICIO_REALIZADO SR ON (M.id_mascota = SR.id_mascota)
GROUP BY M.id_mascota
HAVING COUNT(*) IN (
SELECT MAX(cuenta)
FROM(
SELECT M2.id_mascota, COUNT(M2.id_mascota) as cuenta
FROM GR16_MASCOTA M2 INNER JOIN GR16_SERVICIO_REALIZADO SR ON (M2.id_mascota = SR.id_mascota)
GROUP BY M2.id_mascota
)masc) 




b) Chequeada. Funciona. Falta chequear si es actualizable, y como responde si se le hace un insert. 

CREATE VIEW GR16_Insumos_poco_utiles
AS SELECT i.id_insumo, i.precio, i.costo, COUNT (ixs.id_insumo)
FROM GR16_INSUMOS_X_SERVICIO IXS JOIN GR16_INSUMO i ON (i.id_insumo = ixs.id_insumo)
GROUP BY i.id_insumo, i.precio, i.costo
HAVING COUNT (IXS.id_insumo) < 2; 

c) 


CREATE VIEW GR16_Auxiliar_Servicios_completos 
AS SELECT P.*
FROM GR16_PERSONAL P INNER JOIN GR16_VETERINARIO V ON (P.id_personal = V.id_veterinario)
INNER JOIN GR16_AUXILIAR A ON (v.id_veterinario = A.id_auxiliar)
INNER JOIN GR16_AUXILIARES_X_SERVICIO AXR ON (A.id_auxiliar = AXR.id_auxiliar)
--INNER JOIN SERVICIO_REALIZADO SR ON (AXR.id_servicio_realiz = SR.id_servicio_realiz)
WHERE NOT EXISTS ((	SELECT SR2.id_servicio_realiz
					FROM GR16_SERVICIO_REALIZADO SR2
					WHERE SR2.id_servicio_realiz = AXR.id_servicio_realiz 
					AND (current_date - justify_days(interval '45 days')< SR2.fecha_serv)
					except
					(SELECT id_servicio_realiz
					FROM GR16_SERVICIO_REALIZADO)
				))

--WHERE (current_date - justify_days(interval '45 days')< SR.fecha_serv)

--WHERE EXTRACT( month from(SR.fechar_serv)) - EXTRACT( month from(actual_date))	--Aca hay que jugar con las fechas


d)


CREATE VIEW GR16_Distribuidor_economico AS
SELECT I.*, D.* 
FROM GR16_INSUMO I JOIN GR16_INSUMO_DISTRIBUIDOR id ON (i.id_insumo=id.id_insumo)
			  JOIN GR16_DISTRIBUIDOR d ON (id.id_distribuidor = d.id_distribuidor)
			  WHERE i.costo = ( SELECT MIN (i.costo)
								FROM GR16_INSUMO
							  )

