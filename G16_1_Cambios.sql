ALTER TABLE GR16_MASCOTA ADD COLUMN camada integer;		--  OJO QUE PUEDEN SER NULL
ALTER TABLE GR16_MASCOTA ADD COLUMN id_madre integer;	--OJO QUE PUEDEN SER NULL
ALTER TABLE GR16_MASCOTA ADD COLUMN id_padre integer;	--OJO QUE PUEDN SER NULL
ALTER TABLE GR16_INSUMOS_X_SERVICIO ADD COLUMN precio integer; --OJO QUE PUEDN SER NULL ACLARAR

ALTER TABLE GR16_MASCOTA ADD CONSTRAINT FK_GR16_MASCOTA_MASCOTA
    FOREIGN KEY (id_madre)
    REFERENCES GR16_MASCOTA(id_mascota)
    ON UPDATE cascade
    ON DELETE set null
;

ALTER TABLE GR16_MASCOTA ADD CONSTRAINT FK_GR16_MASCOTA_MASCOTA_2
    FOREIGN KEY (id_padre)
    REFERENCES GR16_MASCOTA(id_mascota)
    ON UPDATE cascade
    ON DELETE set null
;




create table GR16_analisis(                          
                                                     
    id_analisis     serial              NOT NULL,
    id_protocolo    integer				NOT NULL,
    fecha           date                NOT NULL,
    numero          integer             NOT NULL,
    descripcion     varchar(100)        NOT NULL,
    valor_obtenido  integer             NOT NULL,
    constraint pk_GR16_analisis primary key (id_analisis)
)
;

create table GR16_protocolo(                          
                                                     
    id_protocolo     serial         NOT NULL,
    nombre           varchar(100)   NOT NULL,
    unidad_medida    varchar(100)   NOT NULL,
    valor_max        integer        NOT NULL,
    valor_min        integer        NOT NULL, 
    constraint pk_GR16_protocolo primary key (id_protocolo)
)
;

create table GR16_turno(                                  --El veterinario se encarga de asignar los insumos en el turno.
    id_turno        serial          NOT NULL,
    fecha_turno     date            NOT NULL,
    id_personal     int4            NOT NULL,
    hora_inicio     time (24)       NOT NULL,
    hora_fin        time (24)       NOT NULL,
    asistio         boolean         NOT NULL,
    constraint pk_GR16_id_turno primary key (id_turno)
)
;


--FK TURNO

ALTER TABLE GR16_turno ADD CONSTRAINT FK_GR16_personal
    FOREIGN KEY (id_personal)
    REFERENCES GR16_PERSONAL(id_personal)
;


--FK ANALISIS

ALTER TABLE GR16_analisis ADD CONSTRAINT FK_GR16_analisis_protocolo
	FOREIGN KEY (id_protocolo)
	REFERENCES GR16_protocolo(id_protocolo)
;