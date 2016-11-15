SELECT I.*,SR.fecha_serv,COUNT(*)
FROM GR16_INSUMO I INNER JOIN GR16_INSUMOS_X_SERVICIO IXR ON (I.id_insumo = IXS.id_insumo)
INNER JOIN GR16_SERVICIO_REALIZADO SR ON (I.id_servicio_realiz = SR.id_servicio_realiz)
GROUP BY I.id_insumo,I.precio,I.costo,SR.fecha_serv




SELECT P.*,A.fechadevolucion,COUNT(A.fechadevolucion)
FROM PELICULAS P INNER JOIN ALQUILERES A ON (P.idpelicula = A.idpelicula)
GROUP BY P.idpelicula,A.fechadevolucion


