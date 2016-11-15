
--TUPLAS PERSONA



INSERT INTO GR16_PERSONA VALUES(
1,
'A',
'Franco',
'Dachele',
'Calle desconocida',
18,
72,
'alto',
'Bariloche',
'48151622',
'22615184'
);

INSERT INTO GR16_PERSONA VALUES(
2,
'A',
'Joaquin',
'Cachiti',
'Rawson',
123,
1,
'Tandil',
'Tandil',
'02494436754',
'2494632897'
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
'2494785423'
);

INSERT INTO GR16_PERSONA VALUES(
4,
'A',
'Julieta',
'Rurew',
'Uriburu',
555,
1,
'Tandil',
'Tandil',
'0249444745',
'2494784556'
);

INSERT INTO GR16_PERSONA VALUES(
5,
'A',
'Franchesca',
'Ariztobulo',
'Francia',
555,
1,
'Tandil',
'Tandil',
'022215888',
'123587444'
);


--TUPLAS CLIENTE

INSERT INTO GR16_CLIENTE VALUES(
    1,
    'A'
);


INSERT INTO GR16_CLIENTE VALUES(
    2,
    'A'
);


INSERT INTO GR16_CLIENTE VALUES(
    3,
    'A'
);


INSERT INTO GR16_CLIENTE VALUES(
    4,
    'A'
);

INSERT INTO GR16_CLIENTE VALUES(
    5,
    'A'
);

--TUPLAS BOX

INSERT INTO GR16_BOX VALUES(
    1,
    'Chicos'
);

INSERT INTO GR16_BOX VALUES(
    2,
    'Medianos'
);

INSERT INTO GR16_BOX VALUES(
    3,
    'Grandes'
);

INSERT INTO GR16_BOX VALUES(
    4,
    'Cirugias'
);

INSERT INTO GR16_BOX VALUES(
    5,
    'Lavadero'
);


--TUPLAS SERVICIO

INSERT INTO GR16_SERVICIO VALUES(
    1,
    100,
    'Chequeo'
);

INSERT INTO GR16_SERVICIO VALUES(
    2,
    500,
    'Vacunacion'
);

INSERT INTO GR16_SERVICIO VALUES(
    3,
    2000,
    'Cirugia'
);

INSERT INTO GR16_SERVICIO VALUES(
    4,
    300,
    'Lavado'
);

INSERT INTO GR16_SERVICIO VALUES(
    5,
    1000,
    'Chequeo completo'
);


--TUPLAS DISTRIBUIDOR

INSERT INTO GR16_DISTRIBUIDOR VALUES(
    1,
    'Vacunas',
    '222121212'
);

INSERT INTO GR16_DISTRIBUIDOR VALUES(
    2,
    'Materiales basicos',
    '0243559614'
);

INSERT INTO GR16_DISTRIBUIDOR VALUES(
    3,
    'Elementos Quirurgicos',
    '001515152'
);

INSERT INTO GR16_DISTRIBUIDOR VALUES(
    4,
    'Juguetes',
    '84265732'
);

INSERT INTO GR16_DISTRIBUIDOR VALUES(
    5,
    'Perfumeria',
    '122363648'
);


--TUPLAS MASCOTA 


INSERT INTO GR16_MASCOTA VALUES(
7,
'Mapepe',
'F',
'Perro',
'Doberman',
28,
'1/5/2010',
1,
1
);



INSERT INTO GR16_MASCOTA VALUES(
8,
'Papepe',
'M',
'Perro',
'Doberman',
40,
'1/8/2011',
1,
2
);

INSERT INTO GR16_MASCOTA VALUES(
1,
'Africa',
'F',
'Perro',
'Perro',
15,
'1/5/2014',
1,
98
);



INSERT INTO GR16_MASCOTA VALUES(
2,
'Toto',
'M',
'Perro',
'Doberman',
45,
'8/22/2014',
2,
1
);

INSERT INTO GR16_MASCOTA VALUES(
3,
'Roquefeller',
'M',
'Gato',
'Tigre de Bengala',
75,
'7/9/2013',
3,
1
);

INSERT INTO GR16_MASCOTA VALUES(
4,
'Nevado',
'M',
'Perro',
'Pastor Australiano',
35,
'4/6/2010',
4,
1
);

INSERT INTO GR16_MASCOTA VALUES(
5,
'Ventisca del Sur',
'F',
'Perro',
'Chihuahua',
15,
'1/1/2000',
5,
1
);

INSERT INTO GR16_MASCOTA VALUES(
6,
'Pepe',
'M',
'Perro',
'Doberman',
34,
'6/6/2014',
1,
1,
6,
7
);

--TUPLAS INSUMO

INSERT INTO GR16_INSUMO VALUES(
1,
20.00,
13.00
);

INSERT INTO GR16_INSUMO VALUES(
2,
14.00,
9.00
);

INSERT INTO GR16_INSUMO VALUES(
3,
135.00,
78.00
);

INSERT INTO GR16_INSUMO VALUES(
4,
40.00,
18.00
);

INSERT INTO GR16_INSUMO VALUES(
5,
123.00,
49.00
);

--TUPLAS INSUMO_DISTRIBUIDOR

INSERT INTO GR16_INSUMO_DISTRIBUIDOR VALUES(
    1,
    1,
    current_date,
    100
);

INSERT INTO GR16_INSUMO_DISTRIBUIDOR VALUES(
    2,
    2,
    current_date,
    20
);

INSERT INTO GR16_INSUMO_DISTRIBUIDOR VALUES(
    3,
    3,
    current_date,
    80
);

INSERT INTO GR16_INSUMO_DISTRIBUIDOR VALUES(
    4,
    4,
    current_date,
    120
);

INSERT INTO GR16_INSUMO_DISTRIBUIDOR VALUES(
    5,
    5,
    current_date,
    150
);


--Tuplas Personal

INSERT INTO GR16_PERSONAL VALUES(
1,
'P',
23171112229,
17111222);

INSERT INTO GR16_PERSONAL VALUES(
2,
'A',
23351234569,
35123456);

INSERT INTO GR16_PERSONAL VALUES(
3,
'A',
23181920329,
18192032);


INSERT INTO GR16_PERSONAL VALUES(
4,
'V',
23263314889,
26331488);


INSERT INTO GR16_PERSONAL VALUES(
5,
'V',
23298846649,
29884664);

--Tuplas Veterinario No agrego mas veterinarios para que existan dos pasantes.(Hay 5 personal)

INSERT INTO GR16_VETERINARIO VALUES(
4,
'B',
22331);

INSERT INTO GR16_VETERINARIO VALUES(
5,
'C',
19882);

--Tuplas Pasante . Lo mismo que veterinario.

INSERT INTO GR16_PASANTE VALUES(
1);

--Tuplas auxiliar

INSERT INTO GR16_AUXILIAR VALUES(
2);

INSERT INTO GR16_AUXILIAR VALUES(
3);

--Tuplas Servicio Box

INSERT INTO GR16_SERVICIO_BOX VALUES(
1,
1);

INSERT INTO GR16_SERVICIO_BOX VALUES(
2,
2);

INSERT INTO GR16_SERVICIO_BOX VALUES(
3,
3);

INSERT INTO GR16_SERVICIO_BOX VALUES(
4,
4);

INSERT INTO GR16_SERVICIO_BOX VALUES(
5,
5);

--Tuplas Servicio_realizado

INSERT INTO GR16_SERVICIO_REALIZADO VALUES(
1,
'01/11/2015',
1,
4,
3,
4
);

INSERT INTO GR16_SERVICIO_REALIZADO VALUES(
2,
'01/11/2015',
1,
1,
1,
1
);

INSERT INTO GR16_SERVICIO_REALIZADO VALUES(
3,
'02/01/2015',
1,
3,
5,
3
);

INSERT INTO GR16_SERVICIO_REALIZADO VALUES(
4,
'01/11/2015',
1,
1,
3,
1
);

INSERT INTO GR16_SERVICIO_REALIZADO VALUES(
5,
'01/11/2015',
1,
4,
3,
4
);

--Tuplas auxiliares por servicio

INSERT INTO GR16_AUXILIARES_X_SERVICIO VALUES(
2,
5
);

INSERT INTO GR16_AUXILIARES_X_SERVICIO VALUES(
2,
4
);

INSERT INTO GR16_AUXILIARES_X_SERVICIO VALUES(
2,
3
);

INSERT INTO GR16_AUXILIARES_X_SERVICIO VALUES(
3,
2
);

INSERT INTO GR16_AUXILIARES_X_SERVICIO VALUES(
3,
1
);

--Tuplas INSUMOS_X_SERVICIO

INSERT INTO GR16_INSUMOS_X_SERVICIO VALUES(
1,
1,
10
);


INSERT INTO GR16_INSUMOS_X_SERVICIO VALUES(
2,
1,
100
);


INSERT INTO GR16_INSUMOS_X_SERVICIO VALUES(
3,
2,
80
);


INSERT INTO GR16_INSUMOS_X_SERVICIO VALUES(
4,
5,
140
);

INSERT INTO GR16_INSUMOS_X_SERVICIO VALUES( 
5,
4,
220
);


--Tuplas PROTOCOLO

INSERT INTO GR16_PROTOCOLO VALUES(
	1,
  'Sustancias grasas',
  110,
  140,
  50
);
  
  
INSERT INTO GR16_PROTOCOLO VALUES(
	2,
  'Proteinas',
  22,
  150,
  1
);

INSERT INTO GR16_PROTOCOLO VALUES(
	3,
  'Calcio',
  'mg',
  300,
  180
);

INSERT INTO GR16_PROTOCOLO VALUES(
	4,
  'Globulos blancos',
  'millones/ml',
  90,
  46
);

INSERT INTO GR16_PROTOCOLO VALUES(
	5,
  'Globulos rojos',
  'millones/ml',
  200,
  140
);

--Tuplas GR16_ANALISIS


INSERT INTO GR16_ANALISIS VALUES(
1,
1,
current_date,
1,
'Sangre',
100
);

INSERT INTO GR16_ANALISIS VALUES(
2,
3,
current_date,
5,
'Intestinos',
100
);


INSERT INTO GR16_ANALISIS VALUES(
3,
2,
current_date,
4,
'Rabia',
100
);


INSERT INTO GR16_ANALISIS VALUES(
4,
1,
current_date,
1,
'Deficiencia de dachilis',
100
);


INSERT INTO GR16_ANALISIS VALUES(
5,
4,
current_date,
8,
'Huesos',
50);


INSERT INTO GR16_ANALISIS VALUES(
6,
5,
current_date,
2,
'Cerebro',
150
);


INSERT INTO GR16_ANALISIS VALUES(
7,
3,
current_date,
8,
'Alzheimer',
100
);


--Tuplas GR16_TURNO

INSERT INTO GR16_TURNO VALUES(
1,
'11/24/2015',
1,
'0:00:00',
'8:00:00',
false
);

INSERT INTO GR16_TURNO VALUES(
2,
'01/24/2014',
4,
'8:00:00',
'16:00:00',
true
);

INSERT INTO GR16_TURNO VALUES(
3,
'03/27/2015',
1,
'8:00:00',
'16:00:00',
true
);

INSERT INTO GR16_TURNO VALUES(
4,
'05/22/2016',
3,
'16:00:00',
'24:00:00',
false
);

INSERT INTO GR16_TURNO VALUES(
5,
'06/05/2016',
2,
'16:00:00',
'24:00:00',
false
);

