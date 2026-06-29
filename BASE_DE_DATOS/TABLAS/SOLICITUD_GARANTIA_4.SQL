  CREATE TABLE SOLICITUD_GARANTIA_4 (
    Id INT PRIMARY KEY IDENTITY (1,1),
    Fecha_Solicitud DATETIME NOT NULL DEFAULT GETDATE(),
    Descripcion_Problema VARCHAR(MAX) NOT NULL,
    Estado_Solicitud VARCHAR(20) NOT NULL DEFAULT 'PENDIENTE',
    Razon_Rechazo VARCHAR(MAX) NULL,
    Fecha_Resolucion DATETIME NULL,
    Id_Garantia INT NOT NULL,
    Id_Empleado INT NOT NULL,
    CONSTRAINT FK_Solicitud_Garantia FOREIGN KEY (Id_Garantia) REFERENCES GARANTIA_4(Id),
    CONSTRAINT FK_Solicitud_Empleado FOREIGN KEY (Id_Empleado) REFERENCES EMPLEADO(Id),   -- EMPLEADO tiene PK Id
    CONSTRAINT CK_EstadoSolicitud CHECK (Estado_Solicitud IN ('PENDIENTE','EN_REVISION','APROBADA','RECHAZADA','EJECUTADA')),
    CONSTRAINT CK_RazonRechazoObligatoria CHECK (
        (Estado_Solicitud = 'RECHAZADA' AND Razon_Rechazo IS NOT NULL)
        OR (Estado_Solicitud <> 'RECHAZADA')
    )
);
GO