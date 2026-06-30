USE HYSTORY_MOTOR_SSMS_BD;
GO

-- ============================================================
-- TABLA: SESION (Registro de sesiones activas/cerradas)
-- ============================================================
CREATE TABLE SESION (
    id_sesion        INT IDENTITY(1,1)  NOT NULL,
    id_empleado      INT                NOT NULL,
    fecha_hora_inicio DATETIME2         NOT NULL  CONSTRAINT DF_SESION_inicio DEFAULT GETDATE(),
    fecha_hora_fin    DATETIME2         NULL,
    direccion_ip      VARCHAR(45)       NOT NULL,  -- IPv4 o IPv6

    -- Llave primaria
    CONSTRAINT PK_SESION PRIMARY KEY (id_sesion),

    -- Llave foránea hacia EMPLEADO
    CONSTRAINT FK_SESION_EMPLEADO FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO (id_empleado)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- Validación de fechas
    CONSTRAINT CK_SESION_fechas CHECK (fecha_hora_fin IS NULL OR fecha_hora_fin >= fecha_hora_inicio)
);
GO

USE HYSTORY_MOTOR_SSMS_BD;
GO

SELECT TABLE_NAME AS Tabla
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;