DROP DATABASE IF EXISTS Jose_Eduardo_Vado_Robles;
CREATE DATABASE Jose_Eduardo_Vado_Robles;
USE Jose_Eduardo_Vado_Robles;

CREATE TABLE Personal(
idPersonal 		INT 				PRIMARY KEY NOT NULL AUTO_INCREMENT,
apePaterno 		VARCHAR (50) 	NOT NULL,
apeMaterno 		VARCHAR (50) 	NOT NULL,
nombre 			VARCHAR (50) 	NOT NULL,
direccion 		VARCHAR (100) 	NOT NULL,
fechaDeIngreso DATE  			DEFAULT CURRENT_DATE()
);

INSERT INTO Personal (apePaterno,apeMaterno,nombre,direccion,fechaDeIngreso) VALUES 
	('Vado','Robles','Eduardo','Rio Coachapa 15', CURRENT_DATE()),
	('Juarez','Garcia','Pablo','Senda Ana Echeverria 91', CURRENT_DATE()),
	('Diaz','Mori','Jose','Parque Laura 18 Esc. 462', CURRENT_DATE());

CREATE TABLE Registro(
idRegistro 	INT 	PRIMARY KEY NOT NULL AUTO_INCREMENT,
esInterno 	BOOL 	NOT NULL,
idPersonal 	INT 	NOT NULL,
CONSTRAINT FOREIGN KEY (idPersonal) REFERENCES Personal(idPersonal) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Registro (esInterno,idPersonal) VALUES 
	(1,1),(1,2),(0,3);

CREATE TABLE Nota(
idNota 		INT 				PRIMARY KEY NOT NULL AUTO_INCREMENT,
fechaNota 	DATE 				DEFAULT CURRENT_DATE(),
nota 			VARCHAR(500) 	NOT NULL,
idRegistro 	INT 				NOT NULL,
CONSTRAINT FOREIGN KEY (idRegistro) REFERENCES Registro(idRegistro) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Nota (fechaNota,nota,idRegistro) VALUES 
	(CURRENT_DATE(),'Esta es una nota',1);

CREATE TABLE Comentario(
idComentario 		INT 				PRIMARY KEY NOT NULL AUTO_INCREMENT,
fechaComentario 	DATETIME 		DEFAULT NOW(),
comentario 			VARCHAR(200) 	NOT NULL,
padreID 				INT 				DEFAULT NULL,
idRegistro 			INT 				NOT NULL,
CONSTRAINT FOREIGN KEY (idRegistro) REFERENCES Registro(idRegistro) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Comentario (fechaComentario,comentario,idRegistro) VALUES 
	(NOW(), 'Esto es un comentario',3);

CREATE TABLE NotaComentario(
idNotaComentario 	INT 	PRIMARY KEY NOT NULL AUTO_INCREMENT,
idNota 				INT 	NOT NULL,
idComentario 		INT 	NOT NULL,
CONSTRAINT FOREIGN KEY (idNota) REFERENCES Nota(idNota) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (idComentario) REFERENCES Comentario(idComentario) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO NotaComentario(idNota,idComentario) VALUES
	(1,1);








