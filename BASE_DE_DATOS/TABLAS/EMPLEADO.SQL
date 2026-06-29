USE HYSTORY_MOTOR_SSMS_BD;
GO

-- ============================================================
-- TABLA: EMPLEADO (Entidad central del módulo de autenticación)
-- ============================================================
CREATE TABLE EMPLEADO (
    id_empleado       INT IDENTITY(1,1)   NOT NULL,
    nombres           NVARCHAR(100)        NOT NULL,
    apellidos         NVARCHAR(100)        NOT NULL,
    cedula            VARCHAR(20)          NOT NULL,
    fecha_nacimiento  DATE                 NULL,
    correo            VARCHAR(150)         NOT NULL,
    rol               VARCHAR(50)          NOT NULL,
    contrasena        NVARCHAR(255)        NOT NULL,  -- Se almacena encriptada (hash)
    intentos_fallidos TINYINT              NOT NULL  CONSTRAINT DF_EMPLEADO_intentos  DEFAULT 0,
    cuenta_bloqueada  BIT                  NOT NULL  CONSTRAINT DF_EMPLEADO_bloqueada DEFAULT 0,

    -- Llave primaria
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (id_empleado),

    -- Restricciones de unicidad
    CONSTRAINT UQ_EMPLEADO_cedula  UNIQUE (cedula),
    CONSTRAINT UQ_EMPLEADO_correo  UNIQUE (correo),

    -- Validaciones
    CONSTRAINT CK_EMPLEADO_intentos CHECK (intentos_fallidos >= 0 AND intentos_fallidos <= 10),
    CONSTRAINT CK_EMPLEADO_correo   CHECK (correo LIKE '%@%.%')
);
GO
USE HYSTORY_MOTOR_SSMS_BD;
GO

SELECT 
    TABLE_NAME AS Tabla,
    TABLE_TYPE AS Tipo
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
