CREATE TABLE POLITICA_GARANTIA_4 (
Id INT PRIMARY KEY IDENTITY (1,1),
Tipo_Garantia varchar (20) not null,
Dias_Vigencia int not null,
Km_Limite int not null default 3000,
Descripcion_Politica varchar (255) not null,
Activo bit not null default 1,
CONSTRAINT CK_TipoGarantia_Politica CHECK (Tipo_Garantia IN ('MANO_OBRA','REPUESTO','DIAGNOSTICO','MOTOCICLETA')),
CONSTRAINT CK_DiasVigencia_Politica CHECK (Dias_Vigencia > 0),
CONSTRAINT CK_KmLimite_Politica CHECK (Km_Limite > 0)
);