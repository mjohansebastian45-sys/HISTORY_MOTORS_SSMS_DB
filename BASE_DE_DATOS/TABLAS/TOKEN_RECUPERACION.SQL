USE HYSTORY_MOTOR_SSMS_BD;
GO

-- ============================================================
-- TABLA: TOKEN_RECUPERACION (Tokens para recuperar contraseña)
-- ============================================================
CREATE TABLE TOKEN_RECUPERACION (
    id_token        INT IDENTITY(1,1)  NOT NULL,
    id_empleado     INT                NOT NULL,
    codigo_token    VARCHAR(255)       NOT NULL,
    fecha_expiracion DATETIME2         NOT NULL,
    usado           BIT                NOT NULL  CONSTRAINT DF_TOKEN_usado DEFAULT 0,

    -- Llave primaria
    CONSTRAINT PK_TOKEN_RECUPERACION PRIMARY KEY (id_token),

    -- El token debe ser único (no puede repetirse)
    CONSTRAINT UQ_TOKEN_codigo UNIQUE (codigo_token),

    -- Llave foránea hacia EMPLEADO
    CONSTRAINT FK_TOKEN_EMPLEADO FOREIGN KEY (id_empleado)
        REFERENCES EMPLEADO (id_empleado)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- El token no puede expirar en el pasado al crearse
    CONSTRAINT CK_TOKEN_expiracion CHECK (fecha_expiracion > GETDATE() OR usado = 1)
);
GO

USE HYSTORY_MOTOR_SSMS_BD;
GO

SELECT TABLE_NAME AS Tabla
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;