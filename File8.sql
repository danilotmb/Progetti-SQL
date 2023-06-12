USE cfi2023;

CREATE TABLE artista(
		nome VARCHAR(255),
        stile VARCHAR(255),
        anno YEAR,
        PRIMARY KEY(nome)
        
);

ALTER TABLE artista 
MODIFY COLUMN anno int ;

INSERT INTO artista
 VALUES ('leonardo', 'rinascimento', 1527);

INSERT INTO artista
 VALUES ('van gogh', 'cubismo', 1800),
 ('cezanne', 'impressionismo',1750),
 ('monet', 'impressionismo', 1780);
 
 SELECT * FROM cfi2023.artista;
 
 DROP TABLE quadro;
 CREATE TABLE quadro(
	nome VARCHAR(255),
    artista VARCHAR(255),
    CONSTRAINT PK 
    PRIMARY KEY (nome),
    CONSTRAINT FK_artista 
    FOREIGN KEY (artista) REFERENCES artista(nome)
 );
 
 
 INSERT INTO quadro
 VALUES ('girasoli', 'van gogh'),
 ('caput mundi', 'leonardo');
 
 INSERT INTO artista
 VALUES ('picasso', 'cubismo', 1900);
  INSERT INTO quadro
 VALUES ('guernica', 'picasso');
 
 
 
 SELECT * FROM quadro;
 
 
 
 ALTER TABLE quadro
 DROP FOREIGN KEY FK_artista;
 
 
  INSERT INTO quadro
 VALUES ('cerchio', 'giotto');
 
   INSERT INTO artista
 VALUES ( 'giotto', 'cerchi', 1600);

 ALTER TABLE quadro
 ADD CONSTRAINT FK_artista
 FOREIGN KEY (artista) REFERENCES artista(nome);
