--
-- TABLE: AUXILIAR
--

CREATE TABLE GR16_AUXILIAR(
    id_auxiliar    int4    NOT NULL,
    CONSTRAINT PK_GR16_auxiliar PRIMARY KEY (id_auxiliar)
)
;



--
-- TABLE: AUXILIARES_X_SERVICIO
--

CREATE TABLE GR16_AUXILIARES_X_SERVICIO(
    id_auxiliar           int4    NOT NULL,
    id_servicio_realiz    int4    NOT NULL,
    CONSTRAINT PK_GR16_auxiliares_x_servicio PRIMARY KEY (id_auxiliar, id_servicio_realiz)
)
;



--
-- TABLE: BOX
--

CREATE TABLE GR16_BOX(
    id_box    int4           NOT NULL,
    nombre    varchar(30)    NOT NULL,
    CONSTRAINT PK_GR16_BOX PRIMARY KEY (id_box)
)
;



--
-- TABLE: CLIENTE
--

CREATE TABLE GR16_CLIENTE(
    id_persona      int4       NOT NULL,
    preferencial    char(1)    NOT NULL,
    CONSTRAINT PK_GR16_CLIENTE PRIMARY KEY (id_persona)
)
;



--
-- TABLE: DISTRIBUIDOR
--

CREATE TABLE GR16_DISTRIBUIDOR(
    id_distribuidor    int4           NOT NULL,
    razon_social       varchar(50)    NOT NULL,
    telefono           varchar(12)    NOT NULL,
    CONSTRAINT PK_GR16_DISTRIBUIDOR PRIMARY KEY (id_distribuidor)
)
;



--
-- TABLE: INSUMO
--

CREATE TABLE GR16_INSUMO(
    id_insumo    int4             NOT NULL,
    precio       numeric(6, 2)    NOT NULL,
    costo        numeric(6, 2)    NOT NULL,
    CONSTRAINT PK_GR16_INSUMO PRIMARY KEY (id_insumo)
)
;



--
-- TABLE: Insumo_Distribuidor
--

CREATE TABLE GR16_Insumo_Distribuidor(
    id_distribuidor        int4              NOT NULL,
    id_insumo              int4              NOT NULL,
    fecha_actualizacion    timestamp         NOT NULL,
    costo                  numeric(12, 3)    NOT NULL,
    CONSTRAINT PK_GR16_INSUMO_DISTRIBUIDOR PRIMARY KEY (id_distribuidor, id_insumo)
)
;



--
-- TABLE: INSUMOS_X_SERVICIO
--

CREATE TABLE GR16_INSUMOS_X_SERVICIO(
    id_servicio_realiz    int4    NOT NULL,
    id_insumo             int4    NOT NULL,
    CONSTRAINT PK_GR16_INSUMOS_X_SERVICIO PRIMARY KEY (id_servicio_realiz, id_insumo)
)
;



--
-- TABLE: MASCOTA
--

CREATE TABLE GR16_MASCOTA(
    id_mascota         int4             NOT NULL,
    nombre             varchar(30)      NOT NULL,
    sexo               char(1)          NOT NULL,
    especie            varchar(15)      NOT NULL,
    raza               varchar(20)      NOT NULL,
    peso_actual        numeric(4, 2)    NOT NULL,
    fecha_nacimiento    date             NOT NULL,
    id_persona         int4             NOT NULL,
    CONSTRAINT PK_GR16_MASCOTA PRIMARY KEY (id_mascota)
)
;



--
-- TABLE: PASANTE
--

CREATE TABLE GR16_PASANTE(
    id_personal    int4    NOT NULL,
    CONSTRAINT PK_GR16_PASANTE PRIMARY KEY (id_personal)
)
;



--
-- TABLE: PERSONA
--

CREATE TABLE GR16_PERSONA(
    id_persona      int4           NOT NULL,
    tipo_persona    char(1)        NOT NULL,
    nombre          varchar(30)    NOT NULL,
    apellido        varchar(30)    NOT NULL,
    calle           varchar(20)    NOT NULL,
    puerta          int4           NOT NULL,
    piso            int4,
    departamento    varchar(10),
    ciudad          varchar(30)    NOT NULL,
    telefono        varchar(12),
    celular         varchar(12),
    CONSTRAINT PK_GR16_PERSONA PRIMARY KEY (id_persona)
)
;



--
-- TABLE: PERSONAL
--

CREATE TABLE GR16_PERSONAL(
    id_personal      int4              NOT NULL,
    tipo_personal    char(1)           NOT NULL,
    CUIL           numeric(23, 0)    NOT NULL,
    DNI            int4              NOT NULL,
    CONSTRAINT PK_GR16_PERSONAL PRIMARY KEY (id_personal)
)
;



--
-- TABLE: SERVICIO
--

CREATE TABLE GR16_SERVICIO(
    id_servicio    int4             NOT NULL,
    precio         numeric(6, 2)    NOT NULL,
    descripcion    varchar(30)      NOT NULL,
    CONSTRAINT PK_GR16_SERVICIO PRIMARY KEY (id_servicio)
)
;



--
-- TABLE: SERVICIO_BOX
--

CREATE TABLE GR16_SERVICIO_BOX(
    id_box         int4    NOT NULL,
    id_servicio    int4    NOT NULL,
    CONSTRAINT PK_GR16_SERVICIO_BOX PRIMARY KEY (id_box, id_servicio)
)
;



--
-- TABLE: SERVICIO_REALIZADO
--

CREATE TABLE GR16_SERVICIO_REALIZADO(
    id_servicio_realiz    int4    NOT NULL,
    fecha_serv            date    NOT NULL,
    id_personal           int4    NOT NULL,
    id_box                int4    NOT NULL,
    id_mascota            int4    NOT NULL,
    id_servicio           int4    NOT NULL,
    CONSTRAINT PK_GR16_SERVICIO_REALIZADO PRIMARY KEY (id_servicio_realiz)
)
;



--
-- TABLE: VETERINARIO
--

CREATE TABLE GR16_VETERINARIO(
    id_veterinario    int4       NOT NULL,
    personalizado     char(1)    NOT NULL,
    matricula         int4       NOT NULL,
    CONSTRAINT PK_GR16_VETERINARIO PRIMARY KEY (id_veterinario)
)
;



--
-- TABLE: AUXILIAR
--

ALTER TABLE GR16_AUXILIAR ADD CONSTRAINT FK_GR16_AUXILIAR_GR16_PERSONAL
    FOREIGN KEY (id_auxiliar)
    REFERENCES GR16_PERSONAL(id_personal)
;


--
-- TABLE: AUXILIARES_X_SERVICIO
--

ALTER TABLE GR16_AUXILIARES_X_SERVICIO ADD CONSTRAINT FK_GR16_AUXILIARES_X_SERVICIO_GR16_AUXILIAR
    FOREIGN KEY (id_auxiliar)
    REFERENCES GR16_AUXILIAR(id_auxiliar)
;

ALTER TABLE GR16_AUXILIARES_X_SERVICIO ADD CONSTRAINT FK_GR16_AUXILIARES_X_SERVICIO_GR16_SERVICIO_REALIZADO
    FOREIGN KEY (id_servicio_realiz)
    REFERENCES GR16_SERVICIO_REALIZADO(id_servicio_realiz)
;


--
-- TABLE: CLIENTE
--

ALTER TABLE GR16_CLIENTE ADD CONSTRAINT FK_GR16_CLIENTE_GR16_PERSONA
    FOREIGN KEY (id_persona)
    REFERENCES GR16_PERSONA(id_persona)
;


--
-- TABLE: Insumo_Distribuidor
--

ALTER TABLE GR16_Insumo_Distribuidor ADD CONSTRAINT FK_GR16_Insumo_Distribuidor_GR16_DISTRIBUIDOR
    FOREIGN KEY (id_distribuidor)
    REFERENCES GR16_DISTRIBUIDOR(id_distribuidor)
;

ALTER TABLE GR16_Insumo_Distribuidor ADD CONSTRAINT FK_GR16_Insumo_Distribuidor_GRP16_INSUMO
    FOREIGN KEY (id_insumo)
    REFERENCES GR16_INSUMO(id_insumo)
;


--
-- TABLE: INSUMOS_X_SERVICIO
--

ALTER TABLE GR16_INSUMOS_X_SERVICIO ADD CONSTRAINT FK_GR16_INSUMOS_X_SERVICIO_GR16_INSUMO
    FOREIGN KEY (id_insumo)
    REFERENCES GR16_INSUMO(id_insumo)
;

ALTER TABLE GR16_INSUMOS_X_SERVICIO ADD CONSTRAINT FK_GR16_INSUMOS_X_SERVICIO_GR16_SERVICIO_REALIZADO
    FOREIGN KEY (id_servicio_realiz)
    REFERENCES GR16_SERVICIO_REALIZADO(id_servicio_realiz)
;


--
-- TABLE: MASCOTA
--

ALTER TABLE GR16_MASCOTA ADD CONSTRAINT FK_GR16_MASCOTA_GR16_CLIENTE
    FOREIGN KEY (id_persona)
    REFERENCES GR16_CLIENTE(id_persona)
;


--
-- TABLE: PASANTE
--

ALTER TABLE GR16_PASANTE ADD CONSTRAINT FK_GR16_PASANTE_GR16_PERSONAL
    FOREIGN KEY (id_personal)
    REFERENCES GR16_PERSONAL(id_personal)
;


--
-- TABLE: PERSONAL
--

ALTER TABLE GR16_PERSONAL ADD CONSTRAINT FK_GR16_PERSONAL_GR16_PERSONA
    FOREIGN KEY (id_personal)
    REFERENCES GR16_PERSONA(id_persona)
;


--
-- TABLE: SERVICIO_BOX
--

ALTER TABLE GR16_SERVICIO_BOX ADD CONSTRAINT FK_GR16_SERVICIO_BOX_GR16_BOX
    FOREIGN KEY (id_box)
    REFERENCES GR16_BOX(id_box)
;

ALTER TABLE GR16_SERVICIO_BOX ADD CONSTRAINT FK_GR16_SERVICIO_BOX_SERVICIO
    FOREIGN KEY (id_servicio)
    REFERENCES GR16_SERVICIO(id_servicio)
;


--
-- TABLE: SERVICIO_REALIZADO
--

ALTER TABLE GR16_SERVICIO_REALIZADO ADD CONSTRAINT FK_GR16_SERVICIO_REALIZADO_GR16_PASANTE
    FOREIGN KEY (id_personal)
    REFERENCES GR16_PASANTE(id_personal)
;

ALTER TABLE GR16_SERVICIO_REALIZADO ADD CONSTRAINT FK_GR16_SERVICIO_REALIZADO_MASCOTA
    FOREIGN KEY (id_mascota)
    REFERENCES GR16_MASCOTA(id_mascota)
;

ALTER TABLE GR16_SERVICIO_REALIZADO ADD CONSTRAINT FK_GR16_SERVICIO_REALIZADO_SERVICIO_BOX
    FOREIGN KEY (id_box, id_servicio)
    REFERENCES GR16_SERVICIO_BOX(id_box, id_servicio)
;


--
-- TABLE: VETERINARIO
--

ALTER TABLE GR16_VETERINARIO ADD CONSTRAINT FK_GR16_VETERINARIO_GR16_PERSONAL
    FOREIGN KEY (id_veterinario)
    REFERENCES GR16_PERSONAL(id_personal)
;


