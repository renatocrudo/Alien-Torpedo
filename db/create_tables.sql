/*
Project: Alien-Torpedo
Description: create tables
Author: Renato Crudo
Date: 08/08/2017
*/

use dbAlien;

Go
-- Usuario
Create Table Usuario
(
	Cd_usuario		int identity(1,1)
	,Nm_email		varchar(80)	
	,Nm_usuario		varchar(80)
	,Nm_senha		varchar(20)
	,Dv_ativo		bit
	,Dt_inclusao	datetime
	Constraint pk_cd_usuario primary key(Cd_usuario)
)

go
-- Grupo
Create Table Grupo
(
	Cd_grupo		smallint
	,Nm_grupo		varchar(60)
	,Dt_inclusao	datetime
	Constraint pk_cd_grupo primary key(Cd_grupo)
)
go

-- Grupo_usuario
Create Table Grupo_usuario
(
	Cd_usuario	int
	,Cd_grupo	smallint
	Constraint pk_cd_usuario_grupo primary key(Cd_usuario, Cd_grupo)
	,Constraint fk_cd_usuario foreign key(Cd_usuario) references Usuario
	,Constraint fk_cd_grupo foreign key(Cd_grupo) references Grupo 
)
go

--Evento
Create table Evento
(
	Cd_evento	int
	,Nm_evento	varchar(60)
)

go 

Create Table Grupo_evento
(
	Cd_grupo		int
	,Cd_evento		int
	,Nm_descricao	varchar(80)
	,Dt_evento		date	
)