-- Creación de la base de datos
CREATE DATABASE Votaciones
GO
-- Selección de la base de datos
USE Votaciones
go
-- Creación de la tabla Usuarios
DROP TABLE Usuarios
CREATE TABLE Usuarios (
    EMAIL VARCHAR(50) UNIQUE NOT NULL,
	CLAVE VARCHAR(30) NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL ,
	INDYAVOTO VARCHAR(1) DEFAULT 'N',
	IDTipodeUsuario INT NOT NULL,
    FOREIGN KEY (IDTipodeUsuario) REFERENCES TipodeUsuario(IDTipodeUsuario),
	CONSTRAINT CHK_INDYAVOTO CHECK (INDYAVOTO IN ('N', 'S'))
)
-- Creación de la tabla Candidatos
drop table Candidatos
CREATE TABLE Candidatos (
    IdCandidato INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    PartidoPolitico NVARCHAR(50) NOT NULL,
    Plataforma NVARCHAR(200) NOT NULL,
    Foto VARBINARY(MAX) NULL

)
-- Creación de la tabla Votos
drop table Votos
CREATE TABLE Votos (
    IdVoto INT PRIMARY KEY IDENTITY(1,1),
    IdCandidato INT NOT NULL,
    FechaVoto DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (IdCandidato) REFERENCES Candidatos(IdCandidato)
)

-- Creación de la tabla tipo de usuario
drop table TipodeUsuario
CREATE TABLE TipodeUsuario (
    IDTipodeUsuario INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(50) NOT NULL
    )
	drop table TiposDeVotos

-- Creación de la tabla TiposDeVotos
CREATE TABLE TiposDeVotos (
    IDTipoVoto INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(50) NOT NULL,
    
)


INSERT INTO Usuarios(EMAIL,CLAVE,NOMBRE) VALUES('lucia@gmail.com','1020','Lucia Gomez'),('diegoa@gmail.com','555', 'Diego Alvarado'),('sofialo@gmail.com', '321','Sofia Lopez'),('pedroh@gmail,com','444','Pedro Hernandez') 
SELECT * FROM Usuarios

SELECT EMAIL, CLAVE, NOMBRE FROM Usuarios WHERE EMAIL=' ' AND CLAVE=' '


--SELECT distinct
--IMPLEMENTAR VALIDACIONES POR TIPO DE USUARIO