--PARTE 2 
--1)
a)
Tipo: GENERAL 

CREATE ASSERTION ASSERTION_GR16_SERVIVIO_CK_FECHAS
CHECK( NOT EXISTS (
	SELECT *
	FROM GR16_SERVICIO_REALIZADO SR JOIN GR16_MASCOTA M ON ( SR.id_mascota = M.id_mascota)
	WHERE SR.fecha_serv < M.fecha_nacimiento
	)); 

CREATE FUNCTION FN_GR16_SERVICIO_CK_FECHAS()
RETURNS TRIGGER AS $$
BEGIN
	IF EXISTS( SELECT SR.id_servicio_realiz
		    FROM GR16_SERVICIO_REALIZADO SR INNER JOIN GR16_MASCOTA M ON ( SR.id_mascota = M.id_mascota)
		    WHERE SR.id_servicio_realiz = NEW.id_servicio_realiz
			  AND SR.fecha_serv < M.fecha_nacimiento
			) 
		THEN
		RAISE EXCEPTION 'Operacion invalida. La fecha de nacimiento de la mascota no puede ser mayor a la fecha del servicio. %', new.id_servicio_realiz;
	END IF; 
RETURN NEW;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR16_SERVICIO_CK_FECHAS
AFTER INSERT OR UPDATE ON GR16_SERVICIO_REALIZADO
FOR EACH ROW EXECUTE PROCEDURE FN_GR16_SERVICIO_CK_FECHAS();

-- SENTENCIAS

INSERT INTO GR16_SERVICIO_REALIZADO VALUES(
1,
'01/11/1998',
1,
4,
3,
4
);

UPDATE GR16_SERVICIO_REALIZADO SET fecha_serv = '06/05/1998'
WHERE id_servicio_realiz = 1;


b)
Tipo: tupla

ALTER TABLE GR16_PERSONA
ADD CONSTRAINT CK_GR16_PERSONA_contacto				--- esta bien ?? Probada. Funciona.
CHECK (telefono is not NULL OR celular is not NULL)

INSERT INTO GR16_PERSONA VALUES(
3,
'B',
'Juan',
'Diaz',
'Las Heras',
1345,
1,
'Tandil',
'Tandil',
);

INSERT INTO GR16_PERSONA VALUES(
3,
'B',
'Juan',
'Diaz',
'Las Heras',
1345,
1,
'Tandil',
'Tandil',
'02494443534',
);

INSERT INTO GR16_PERSONA VALUES(
3,
'B',
'Juan',
'Diaz',
'Las Heras',
1345,
1,
'Tandil',
'Tandil',
 null,
'2494785423'
);

--PROBAMOS LOS TRES CASOS DE INSERT


UPDATE GR16_PERSONA SET telefono = null
WHERE id_persona = 3;


UPDATE GR16_PERSONA SET celular = null
WHERE id_persona = 3;

c)

Tipo: general 

CREATE ASSERTION ASSERTION_GR16_AUXILIARES_X_PESO
CHECK( NOT EXISTS (
	SELECT SR.id_servicio_realiz
 	FROM  GR16_AUXILIARES_X_SERVICIO AXS INNER JOIN GR16_SERVICIO_REALIZADO SR ON (SR.id_servicio_realiz = AXS.id_servicio_realiz)
 										 INNER JOIN GR16_MASCOTA M ON ( SR.id_mascota = M.id_mascota)
	WHERE (M.peso_actual > 40) 
	GROUP BY SR.id_servicio_realiz
	HAVING COUNT (SR.id_servicio_realiz) < 2));

CREATE FUNCTION FN_GR16_AUXILIARES_X_PESO()
RETURNS TRIGGER AS $$
BEGIN
	IF EXISTS(
			SELECT SR.id_servicio_realiz
 			FROM  GR16_AUXILIARES_X_SERVICIO AXS INNER JOIN GR16_SERVICIO_REALIZADO SR ON (SR.id_servicio_realiz = AXS.id_servicio_realiz)
 										 INNER JOIN GR16_MASCOTA M ON ( SR.id_mascota = M.id_mascota)
	WHERE (M.peso_actual > 40) 
	GROUP BY SR.id_servicio_realiz
	HAVING COUNT (SR.id_servicio_realiz) < 2))
	THEN
				RAISE EXCEPTION 'Operacion invalida. Si a una mascota se le desea realizar un servicio y esta pesa mas de 40kg, se le deben asignar al menos dos auxiliares.'
	END IF; 
RETURN statement;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR16_AUXILIARES_X_PESO
AFTER INSERT OR UPDATE ON GR16_SERVICIO_REALIZADO
FOR EACH STATEMENT EXECUTE PROCEDURE FN_GR16_AUXILIARES_X_PESO()

d)
TIPO: general

CREATE ASSERTION ASSERTION_GR16_SERVICIO_REALIZADO
CHECK( NOT EXISTS(
	SELECT * 
	FROM GR16_SERVICIO_REALIZADO SR JOIN GR16_INSUMOS_X_SERVICIO I ON (SR.id_servicio_realiz = I.id_servicio_realiz) 
							   JOIN GR16_SERVICIO_BOX SB ON (SR.id_servicio = SB.id_servicio) 
							   JOIN GR16_SERVICIO S ON (SB.id_servicio = S.id_servicio)
	GROUP BY I.id_servicio_realiz
	HAVING (SUM (I.precio) < S.precio)
	))

CREATE FUNCTION FN_GR16_INSUMOS_X_SERVICIO()
RETURNS TRIGGER AS $$
BEGIN 
	IF EXISTS( 
				SELECT I.id_servicio_realiz, S.id_servicio
				FROM GR16_SERVICIO_REALIZADO SR JOIN GR16_INSUMOS_X_SERVICIO I ON (SR.id_servicio_realiz = I.id_servicio_realiz) 
							   JOIN GR16_SERVICIO_BOX SB ON (SR.id_servicio = SB.id_servicio) 
							   JOIN GR16_SERVICIO S ON (SB.id_servicio = S.id_servicio)
				GROUP BY I.id_servicio_realiz, S.id_servicio
				HAVING (SUM (I.precio) > S.precio)
				
		) THEN
	RAISE EXCEPTION 'Operacion invalida. El costo de un servicio debe ser mayor o igual al costo de los insumos utilizados. ID Servicio realizado : %', 
	new.id_servicio_realiz;
END IF;
RETURN NEW; 
END;  $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR16_INSUMO_CHECK_PRECIOS
AFTER INSERT OR UPDATE ON GR16_INSUMOS_X_SERVICIO
FOR EACH ROW EXECUTE PROCEDURE FN_GR16_INSUMOS_X_SERVICIO();




e)

TIPO: GENERAL

CREATE ASSERTION ASSERTION_GR16_
CHECK( NOT EXISTS(	SELECT id_personal
					FROM GR16_PERSONAL P INNER JOIN GR16_PASANTE PA ON (P.id_personal = PA.id_personal)
					WHERE P.tipo_personal = 'V' OR P.tipo_personal = 'A'
					UNION
					SELECT id_personal
					FROM GR16_PERSONAL P INNER JOIN GR16_AUXILIAR A ON (P.id_personal = A.id_auxiliar)
					WHERE P.tipo_personal = 'V' OR P.tipo_personal = 'P'
					UNION
					SELECT id_personal
					FROM GR16_PERSONAL P INNER JOIN GR16_VETERINARIO V ON (P.id_personal = V.id_veterinario)
					WHERE P.tipo_personal = 'P' OR P.tipo_personal = 'A'
))				--PREGUNTAR 




CREATE FUNCTION FN_GR16_SERVICIO_REALIZADO()
RETURNS TRIGGER AS $$
BEGIN 
	IF EXISTS( 
				SELECT new.id_personal -- VEEEEEEEEEEEER ESTE NEW
					FROM GR16_PERSONAL P INNER JOIN GR16_PASANTE PA ON (P.id_personal = PA.id_personal)
					WHERE P.tipo_personal = 'V' OR P.tipo_personal = 'A'
					
					SELECT id_personal
					FROM GR16_PERSONAL P INNER JOIN GR16_AUXILIAR A ON (P.id_personal = A.id_auxiliar)
					WHERE P.tipo_personal = 'V' OR P.tipo_personal = 'P'
					
					SELECT id_personal
					FROM GR16_PERSONAL P INNER JOIN GR16_VETERINARIO V ON (P.id_personal = V.id_veterinario)
					WHERE P.tipo_personal = 'P' OR P.tipo_personal = 'A'
				
		) THEN
	RAISE EXCEPTION 'Operacion invalida. Error de tipo : %', 
	new.id_personal; -- VER ESTE NEWWWWWWWWWWWWWWW
END IF;
RETURN NEW; 
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR16_TIPO_EN_PASANTE
BEFORE INSERT OR UPDATE ON GR16_PASANTE 
FOR EACH ROW EXECUTE PROCEDURE FN_GR16_CONTROL_TIPO();

CREATE TRIGGER TR_GR16_TIPO_EN_AUXILIAR
BEFORE INSERT OR UPDATE ON GR16_AUXILIAR 
FOR EACH ROW EXECUTE PROCEDURE FN_GR16_CONTROL_TIPO();

CREATE TRIGGER TR_GR16_TIPO_EN_VETERINARIO
BEFORE INSERT OR UPDATE ON GR16_VETERINARIO 
FOR EACH ROW EXECUTE PROCEDURE FN_GR16_CONTROL_TIPO();










-- VISTAS 

CREATE VIEW GR16_PERSONAL_VETERINARIO
AS SELECT  P.*,V.* 
FROM GR16_PERSONAL P INNER JOIN GR16_VETERINARIO V ON (P.id_personal = V.id_veterinario)
WHERE P.tipo_personal ='V';

CREATE VIEW GR16_PERSONAL_PASANTE
AS SELECT  P.*
FROM GR16_PERSONAL P INNER JOIN GR16_PASANTE PA ON (P.id_personal = PA.id_personal)
WHERE P.tipo_personal ='P';


CREATE VIEW GR16_PERSONAL_AUXILIAR
AS SELECT  P.*, A.*
FROM GR16_PERSONAL P INNER JOIN GR16_AUXILIAR A ON (P.id_personal = A.id_auxiliar)
WHERE P.tipo_personal ='A';

CREATE FUNCTION FN_GR16_INSERTAR_VET_PERSONAL()
RETURNS TRIGGER AS $$
BEGIN
	IF (TG_OP='INSERT') THEN
		IF(new.tipo_personal <> 'V') THEN
			RAISE EXCEPTION 'El tipo del personal que desea agregar debe ser V. ID PERSONAL : %',new.id_personal;
		ELSE 
			INSERT INTO GR16_PERSONAL VALUES (new.id_personal, new.tipo_personal, new.cuil, new.DNI);
			INSERT INTO GR16_VETERINARIO VALUES (new.id_veterinario, new.id_personalizado, new.matricula);
		END IF;
	ELSIF (TG_OP='UPDATE') THEN
		IF(new.tipo_personal <> 'V') THEN
			RAISE EXCEPTION 'El tipo del personal que desea agregar debe ser V. ID PERSONAL : %',new.id_personal;
		ELSE 
		UPDATE GR16_PERSONAL SET id_personal=new.id_personal ,tipo_personal=new.tipo_personal, cuil=new.cuil, dni=new.dni
    	WHERE id_personal=NEW.id_personal;
    	UPDATE GR16_VETERINARIO SET id_veterinario=new.id_veterinario, personalizado=new.personalizado, matricula=new.matricula
    	WHERE id_veterinario=NEW.id_veterinario;
  END IF;
  END IF;
RETURN NEW; 
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR16_PVETE
INSTEAD OF INSERT OR UPDATE ON GR16_PERSONAL_VETERINARIO
FOR EACH ROW 
EXECUTE PROCEDURE FN_GR16_INSERTAR_VET_PERSONAL()

CREATE FUNCTION FN_GR16_INSERTAR_PA_PERSONAL
RETURN TRIGGER AS $$
BEGIN
	IF (TG_OP='INSERT') THEN
		IF(new.tipo_personal <> 'P') THEN
			RAISE EXCEPTION 'El tipo del personal que desea agregar debe ser P. ID PERSONAL : %',new.id_personal;
		ELSE 
		INSERT INTO GR16_PERSONAL VALUES (new.id_personal, new.tipo_personal, new.cuil, new.DNI)
		INSERT INTO GR16_PASANATE VALUES (new.id_pasante)
	ELSIF (TG_OP='UPDATE') THEN
		IF(new.tipo_personal <> 'P') THEN
			RAISE EXCEPTION 'El tipo del personal que desea agregar debe ser P. ID PERSONAL : %',new.id_personal;
		ELSE 
		UPDATE GR16_PERSONAL SET id_personal=new.id_personal ,tipo_personal=new.tipo_personal, cuil=new.cuil, dni=new.dni
    	WHERE id_personal=NEW.id_personal
    	UPDATE GR16_PASANTE SET id_pasante=new.id_pasante
    	WHERE id_pasante=NEW.id_pasante;
    	
END IF;
END IF;
RETURN NEW; 
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR16_PA_PERSONAL
INSTEAD OF INSERT OR UPDATE ON GR16_PERSONAL_PASANTE
FOR EACH ROW 
EXECUTE PROCEDURE FN_GR16_INSERTAR_PA_PERSONAL()



CREATE FUNCTION FN_GR16_INSERTAR_AUXILIAR_PERSONAL
RETURN TRIGGER AS $$
BEGIN
	IF (TG_OP='INSERT') THEN
		IF(new.tipo_personal <> 'A') THEN
			RAISE EXCEPTION 'El tipo del personal que desea agregar debe ser A. ID PERSONAL : %',new.id_personal;
		ELSE 
		INSERT INTO GR16_PERSONAL VALUES (new.id_personal, new.tipo_personal, new.cuil, new.DNI)
		INSERT INTO GR16_AUXILIAR VALUES (new.id_pasante)
	ELSIF (TG_OP='UPDATE') THEN
		IF(new.tipo_personal <> 'A') THEN
			RAISE EXCEPTION 'El tipo del personal que desea agregar debe ser A. ID PERSONAL : %',new.id_personal;
		ELSE 
		UPDATE GR16_PERSONAL SET id_personal=new.id_personal ,tipo_personal=new.tipo_personal, cuil=new.cuil, dni=new.dni
    	WHERE id_personal=NEW.id_personal;
    	UPDATE GR16_AUXILIAR SET id_auxiliar=new.id_auxiliar
    	WHERE id_auxiliar=NEW.id_auxiliar;
   END IF;
   END IF;
RETURN NEW; 
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR16_A_PERSONAL
INSTEAD OF INSERT OR UPDATE ON GR16_PERSONAL_AUXILIAR
FOR EACH ROW 
EXECUTE PROCEDURE FN_GR16_INSERTAR_AUXILIAR_PERSONAL()