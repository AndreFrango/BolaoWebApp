--Criação das tabelas e inserção de alguns registros
-- DROP TABLE PALPITE;
-- DROP TABLE JOGO;
-- DROP TABLE RODADA;
-- DROP TABLE USUARIO;
-- DROP TABLE TIME;

--select * from palpite

CREATE TABLE USUARIO(
    ID_USUARIO INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    NOME VARCHAR(100) NOT NULL,
    DATA_CADASTRO TIMESTAMP NOT NULL,
    LOGIN VARCHAR(30) UNIQUE NOT NULL,
    SENHA INT NOT NULL,
    PONTUACAO INT NOT NULL,
    ROLE VARCHAR(15) NOT NULL
);

INSERT INTO USUARIO VALUES (DEFAULT, 'Admin', CURRENT_TIMESTAMP, 'admin', 1509442, 0, 'admin');
INSERT INTO USUARIO VALUES (DEFAULT, 'Carlos', CURRENT_TIMESTAMP, 'Carlos', 1509442, 0, 'torcedor');
INSERT INTO USUARIO VALUES (DEFAULT, 'Janaína', CURRENT_TIMESTAMP, 'Janaína', 1509442, 0, 'torcedor');
INSERT INTO USUARIO VALUES (DEFAULT, 'André', CURRENT_TIMESTAMP, 'André', 1509442, 0, 'torcedor');

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

INSERT INTO JOGO VALUES(DEFAULT, '2018-06-14 12:00:00', 'Rússia', 5, 'Arábia Saudita', 0, 1); --Rússia 5 x 0 Arábia Saudita
INSERT INTO JOGO VALUES(DEFAULT, '2018-06-15 09:00:00', 'Egito', 0, 'Uruguai', 1, 1); --Egito 0 x 1 Uruguai
INSERT INTO JOGO VALUES(DEFAULT, '2018-06-30 15:00:00', 'Uruguai', -1, 'Portugal', -1, 4); --Oitavas de final, placar não definido (inserir como -1)

CREATE TABLE PALPITE(
    ID_USUARIO INT NOT NULL,
    ID_JOGO INT NOT NULL,
    PALPITE_TIME_A INT NOT NULL,
    PALPITE_TIME_B INT NOT NULL,
    PONTOS INT NOT NULL,
    PRIMARY KEY(ID_USUARIO, ID_JOGO),
    CONSTRAINT FK_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    CONSTRAINT FK_JOGO FOREIGN KEY (ID_JOGO) REFERENCES JOGO(ID_JOGO)
);

delete from palpite;
INSERT INTO PALPITE VALUES (2, 1, 2, 0, 15); --Usuário Carlos, jogo RUS x ARA, placar 2x0, 15 pontos

CREATE TABLE TIME(
NOME_TIME VARCHAR(30) NOT NULL PRIMARY KEY,
PATH_IMAGEM VARCHAR(50) NOT NULL
);

INSERT INTO TIME VALUES ('Alemanha', 'img/alemanha.png');
INSERT INTO TIME VALUES ('Arábia Saudita', 'img/arabia-saudita.png');
INSERT INTO TIME VALUES ('Argentina', 'img/argentina.png');
INSERT INTO TIME VALUES ('Austrália', 'img/australia.png');
INSERT INTO TIME VALUES ('Bélgica', 'img/belgica.png');
INSERT INTO TIME VALUES ('Brasil', 'img/brasil.png');
INSERT INTO TIME VALUES ('Colômbia', 'img/colombia.png');
INSERT INTO TIME VALUES ('Coréia do Sul', 'img/coreia-sul.png');
INSERT INTO TIME VALUES ('Costa Rica', 'img/costa-rica.png');
INSERT INTO TIME VALUES ('Croácia', 'img/croacia.png');
INSERT INTO TIME VALUES ('Dinamarca', 'img/dinamarca.png');
INSERT INTO TIME VALUES ('Egito', 'img/egito.png');
INSERT INTO TIME VALUES ('Espanha', 'img/espanha.png');
INSERT INTO TIME VALUES ('França', 'img/franca.png');
INSERT INTO TIME VALUES ('Inglaterra', 'img/inglaterra.png');
INSERT INTO TIME VALUES ('Irã', 'img/irã.png');
INSERT INTO TIME VALUES ('Islândia', 'img/islandia.png');
INSERT INTO TIME VALUES ('Japão', 'img/japao.png');
INSERT INTO TIME VALUES ('Marrocos', 'img/marrocos.png');
INSERT INTO TIME VALUES ('México', 'img/mexico.png'); --TODO Baixar imagem da bandeira do México
INSERT INTO TIME VALUES ('Nigéria', 'img/nigeria.png');
INSERT INTO TIME VALUES ('Panamá', 'img/panamá.png');
INSERT INTO TIME VALUES ('Peru', 'img/peru.png');
INSERT INTO TIME VALUES ('Polônia', 'img/polonia.png');
INSERT INTO TIME VALUES ('Portugal', 'img/portugal.png');
INSERT INTO TIME VALUES ('Rússia', 'img/russia.png');
INSERT INTO TIME VALUES ('Senegal', 'img/senegal.png');
INSERT INTO TIME VALUES ('Sérvia', 'img/servia.png');
INSERT INTO TIME VALUES ('Suécia', 'img/suecia.png');
INSERT INTO TIME VALUES ('Suiça', 'img/suiça.png');
INSERT INTO TIME VALUES ('Tunísia', 'img/tunisia.png');
INSERT INTO TIME VALUES ('Uruguai', 'img/uruguai.png');


--ALTER TABLE USUARIO ADD COLUMN ROLE VARCHAR(15) NOT NULL