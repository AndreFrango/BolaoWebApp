--Criação das tabelas e inserção de alguns registros
--DROP TABLE USUARIO;
--DROP TABLE RODADA;
--DROP TABLE JOGO;
--DROP TABLE PALPITE;

CREATE TABLE USUARIO(
    ID_USUARIO INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    NOME VARCHAR(100) NOT NULL,
    DATA_CADASTRO TIMESTAMP NOT NULL,
    LOGIN VARCHAR(30) UNIQUE NOT NULL,
    SENHA VARCHAR(50) NOT NULL,
    PONTUACAO INT
);

INSERT INTO USUARIO VALUES (DEFAULT, 'Admin', CURRENT_TIMESTAMP, 'admin', '1509442', NULL);
INSERT INTO USUARIO VALUES (DEFAULT, 'Carlos', CURRENT_TIMESTAMP, 'Carlos', '1509442', 0);
INSERT INTO USUARIO VALUES (DEFAULT, 'Anthony', CURRENT_TIMESTAMP, 'Anthony', '1509442', 0);
INSERT INTO USUARIO VALUES (DEFAULT, 'Janaína', CURRENT_TIMESTAMP, 'Janaína', '1509442', 0);
INSERT INTO USUARIO VALUES (DEFAULT, 'André', CURRENT_TIMESTAMP, 'André', '1509442', 0);

CREATE TABLE RODADA(
    ID_RODADA INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    DESCRICAO_RODADA VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO RODADA VALUES (DEFAULT, 'Fase de grupos - 1a rodada'); 
INSERT INTO RODADA VALUES (DEFAULT, 'Fase de grupos - 2a rodada'); 
INSERT INTO RODADA VALUES (DEFAULT, 'Fase de grupos - 3a rodada'); 
INSERT INTO RODADA VALUES (DEFAULT, 'Oitavas de final'); 
INSERT INTO RODADA VALUES (DEFAULT, 'Quartas de final'); 
INSERT INTO RODADA VALUES (DEFAULT, 'Semifinal'); 
INSERT INTO RODADA VALUES (DEFAULT, 'Disputa do 3o lugar'); 
INSERT INTO RODADA VALUES (DEFAULT, 'Final'); 

CREATE TABLE JOGO(
    ID_JOGO INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    DATA TIMESTAMP NOT NULL,
    TIME_A VARCHAR(50) NOT NULL,
    PLACAR_TIME_A INT,
    TIME_B VARCHAR(50) NOT NULL,
    PLACAR_TIME_B INT,
    ID_RODADA INT NOT NULL,
    CONSTRAINT FK_RODADA FOREIGN KEY (ID_RODADA) REFERENCES RODADA(ID_RODADA)
    );

INSERT INTO JOGO VALUES(DEFAULT, '2018-06-14 12:00:00', 'Rússia', NULL, 'Arábia Saudita', NULL, 1); --Rússia x Arábia Saudita
INSERT INTO JOGO VALUES(DEFAULT, '2018-06-15 09:00:00', 'Egito', NULL, 'Uruguai', NULL, 1); --Egito x Uruguai

CREATE TABLE PALPITE(
    ID_USUARIO INT NOT NULL,
    ID_JOGO INT NOT NULL,
    PALPITE_TIME_A INT NOT NULL,
    PALPITE_TIME_B INT NOT NULL,
    PRIMARY KEY(ID_USUARIO, ID_JOGO),
    CONSTRAINT FK_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    CONSTRAINT FK_JOGO FOREIGN KEY (ID_JOGO) REFERENCES JOGO(ID_JOGO)
);

INSERT INTO PALPITE VALUES (2, 1, 2, 0); --Usuário Carlos, jogo RUS x ARA, placar 2x0