SELECT P.*,SR.fecha_serv,COUNT(SR.fecha_serv) as Pasante
FROM GR16_PERSONAL P INNER JOIN GR16_PASANTE PA ON (P.id_personal = PA.id_personal)
				INNER JOIN GR16_SERVICIO_REALIZADO (PA.id_personal = SR.id_personal)
GROUP BY P.id_personal ,SR.fecha_serv
UNION
SELECT P2.*, SR2.fecha_serv,COUNT(SR2.fecha_serv) as Veterinario
FROM GR16_PERSONAL P2 INNER JOIN GR16_AUXILIAR A ON (P2.id_personal = A.id_auxiliar)
				 INNER JOIN GR16_AUXILIARES_X_SERVICIO AXS ON (AXS.id_auxiliar = A.id_auxiliar)
				 INNER JOIN GR16_SERVICIO_REALIZADO SR2 ON (SR2.id_servicio_realiz= AXS.id_servicio_realiz)

GROUP BY P2.id_personal, SR2.fecha_serv