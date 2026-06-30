  CREATE TABLE GARANTIA_REPUESTO_4 (
    Id_Garantia INT NOT NULL,
    Id_Repuesto INT NOT NULL,
    CONSTRAINT PK_GarantiaRepuesto PRIMARY KEY (Id_Garantia, Id_Repuesto),
    CONSTRAINT FK_GarRep_Garantia FOREIGN KEY (Id_Garantia) REFERENCES GARANTIA_4(Id),
    CONSTRAINT FK_GarRep_Repuesto FOREIGN KEY (Id_Repuesto) REFERENCES REPUESTO(Id_Repuesto)   -- REPUESTO tiene PK Id_Repuesto
);
GO