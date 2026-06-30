CREATE TABLE GARANTIA_4 (
    Id INT PRIMARY KEY IDENTITY (1,1),
    Fecha_Inicio DATE NOT NULL,
    Fecha_Vencimiento DATE NOT NULL,
    Estado_Garantia VARCHAR(20) NOT NULL DEFAULT 'VIGENTE',
    Tipo_Garantia VARCHAR(20) NOT NULL,
    Km_Al_Servicio INT NULL,
    Km_Limite_Garantia INT NOT NULL DEFAULT 3000,
    Validacion_Tipo VARCHAR(10) NOT NULL DEFAULT 'DUAL',
    Id_Orden INT NOT NULL,               -- Referencia a la orden de servicio original (Módulo 3)
    Id_Politica INT NOT NULL,
    Id_OT_Reparacion INT NULL,           -- OT generada al aprobar la solicitud (RF-11)
    Fecha_Registro DATETIME NOT NULL DEFAULT GETDATE(),
    -- CORRECCIÓN: Usar Id_Orden en lugar de Id (la PK de ORDEN_SERVICIO es Id_Orden)
    CONSTRAINT FK_Garantia_Orden FOREIGN KEY (Id_Orden) REFERENCES ORDEN_SERVICIO(Id_Orden),
    CONSTRAINT FK_Garantia_Politica FOREIGN KEY (Id_Politica) REFERENCES POLITICA_GARANTIA_4(Id),
    CONSTRAINT FK_Garantia_OTReparacion FOREIGN KEY (Id_OT_Reparacion) REFERENCES ORDEN_SERVICIO(Id_Orden),
    CONSTRAINT CK_EstadoGarantia CHECK (Estado_Garantia IN ('VIGENTE','VENCIDA','SIN_REGISTRO')),
    CONSTRAINT CK_TipoGarantia_Gar CHECK (Tipo_Garantia IN ('MANO_OBRA','REPUESTO','DIAGNOSTICO','MOTOCICLETA')),
    CONSTRAINT CK_ValidacionTipo CHECK (Validacion_Tipo IN ('TIEMPO','KM','DUAL')),
    CONSTRAINT CK_FechasGarantia CHECK (Fecha_Vencimiento > Fecha_Inicio)
);
GO