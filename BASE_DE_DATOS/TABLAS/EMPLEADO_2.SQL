USE HYSTORY_MOTOR_SSMS_BD;

CREATE TABLE EMPLEADO_2 (
Id INT PRIMARY KEY IDENTITY (1,1),
Cedula_Empleado int  not null,
Nombre_Empleado varchar (50) unique not null,
Correo_Empleado varchar (50) unique not null,
Rol_Empleado varchar (50) unique not null,
Contraseña_Empleado varchar (50) unique not null,
Fecha_Ingreso date not null
);
GO