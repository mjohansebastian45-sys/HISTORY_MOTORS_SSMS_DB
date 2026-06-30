 USE HYSTORY_MOTOR_SSMS_BD;
GO

-- ============================================================
-- TABLA: EVENTO_AUDITORIA (Log de eventos del sistema)
-- ============================================================
CREATE TABLE EVENTO_AUDITORIA (
    id_evento    INT IDENTITY(1,1)  NOT NULL,
    id_empleado  INT                NOT NULL,
    tipo_evento  VARCHAR(100)       NOT NULL,
    descripcion  NVARCHAR(500)      NULL,
    fecha_hora   DATETIME2          NOT NULL  CONSTRAINT DF_EVENTO_fecha DEFAULT GETDATE(),

    -- Llave primaria
    CONSTRAINT PK_EVENTO_AUDITORIA PRIMARY KEY (id_evento),

    -- Llave foránea hacia EMPLEADO
    CONSTRAINT FK_EVENTO_EMPLEADO FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO (id_empleado)
        ON DELETE NO ACTION  -- Auditoría NO se elimina si se borra el empleado
        ON UPDATE CASCADE,

    -- Tipos de evento permitidos
    CONSTRAINT CK_EVENTO_tipo CHECK (tipo_evento IN (
        'LOGIN_EXITOSO',
        'LOGIN_FALLIDO',
        'CUENTA_BLOQUEADA',
        'RECUPERACION_SOLICITADA',
        'CONTRASENA_CAMBIADA',
        'SESION_CERRADA',
        'CUENTA_DESBLOQUEADA'
    ))
);
GO
