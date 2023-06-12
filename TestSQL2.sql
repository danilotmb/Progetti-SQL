drop database TestSQL;

create database TestSQL;
use TestSQL;

 CREATE TABLE istituti (
	id_istituto INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	citta VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_istituto)
);

CREATE TABLE titoli_di_studio (
  id_titolo INT NOT NULL AUTO_INCREMENT,
  id_istituto INT NOT NULL,
  data_conseguimento DATE NOT NULL,
  voto 	INT NOT NULL,
  PRIMARY KEY (id_titolo),
  FOREIGN KEY (id_istituto) REFERENCES istituti(id_istituto)
);

CREATE TABLE docenti (
	id_docente INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cognome VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_docente)
);


CREATE TABLE materie (
  id_materia INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  id_docente INT NOT NULL,
  PRIMARY KEY (id_materia),
  FOREIGN KEY (id_docente) REFERENCES docenti(id_docente)
);

CREATE TABLE facolta (
  id_facolta INT(255) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_facolta)
);


CREATE TABLE corsi_di_laurea (
  id_corsolaurea INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  cfu INT NOT NULL,
  id_facolta INT(255) NOT NULL,
  PRIMARY KEY (id_corsolaurea),
  FOREIGN KEY (id_facolta) REFERENCES facolta(id_facolta)
);

CREATE TABLE studenti (
	id_studente INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cognome VARCHAR(255) NOT NULL,
	data_nascita DATE NOT NULL,
	comune_nascita VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	telefono VARCHAR(255) NOT NULL,
	id_corsolaurea INT NOT NULL,
    id_titolo INT NOT NULL,
	PRIMARY KEY (id_studente),
	FOREIGN KEY (id_corsolaurea) REFERENCES corsi_di_laurea(id_corsolaurea),
    FOREIGN KEY (id_titolo) REFERENCES titoli_di_studio(id_titolo)
);

CREATE TABLE esami (
  id_esame INT NOT NULL AUTO_INCREMENT,
  data_svolgimento DATE NOT NULL,
  voto INT NOT NULL,
  cfu INT NOT NULL,
  id_studente INT NOT NULL,
  id_materia INT NOT NULL,
  PRIMARY KEY (id_esame),
  FOREIGN KEY (id_studente) REFERENCES studenti(id_studente),
  FOREIGN KEY (id_materia) REFERENCES materie(id_materia)
);


INSERT INTO facolta (id_facolta, nome)  VALUES (null, 'Ingegneria');
INSERT INTO facolta (id_facolta, nome)  VALUES (null, 'Scienze');
INSERT INTO facolta (id_facolta, nome)  VALUES (null, 'Economia');

INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Ingegneria Civile', 180, 1);
INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Ingegneria Meccanica', 180, 1);
INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Ingegneria Elettronica', 180, 1);

INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Fisica', 180, 2);
INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Matematica', 180, 2);
INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Informatica', 180, 2);

INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Economia Aziendale', 180, 3);
INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Marketing', 180, 3);
INSERT INTO corsi_di_laurea (nome, cfu, id_facolta) VALUES ('Scienze Statistiche', 180, 3);

INSERT INTO istituti (id_istituto, nome, citta, email) VALUES
(null, 'Liceo degli Studi di Roma', 'Roma', 'info@liceoroma.it'),
(null, 'Liceo degli Studi di Milano', 'Milano', 'info@liceomi.it'),
(null, 'Liceo degli Studi di Bari', 'Bari', 'info@liceoba.it'),
(null, 'Liceo degli Studi di Bologna', 'Bologna', 'info@liceobo.it'),
(null, 'Liceo degli Studi di Firenze', 'Firenze', 'info@liceofi.it'),
(null, 'Universita degli Studi di Torino', 'Torino', 'info@unito.it');


INSERT INTO titoli_di_studio (id_titolo, id_istituto, data_conseguimento, voto)
VALUES (null, '1', '2017-6-22', '85');
INSERT INTO titoli_di_studio (id_titolo, id_istituto, data_conseguimento, voto)
VALUES (null, '2', '2018-7-22', '100');
INSERT INTO titoli_di_studio (id_titolo, id_istituto, data_conseguimento, voto)
VALUES (null, '3', '2018-7-30', '98');
INSERT INTO titoli_di_studio (id_titolo, id_istituto, data_conseguimento, voto)
VALUES (null, '4', '2018-8-22', '100');
INSERT INTO titoli_di_studio (id_titolo, id_istituto, data_conseguimento, voto)
VALUES (null, '5', '2020-6-12', '70');
INSERT INTO titoli_di_studio (id_titolo, id_istituto, data_conseguimento, voto)
VALUES (null, '6', '2020-6-12', '110');



INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Mario', 'Rossi', '1998-05-03', 'Roma', 'mario.rossi@universita.it', '3331234567', 1, 1);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Luca', 'Bianchi', '2000-08-07', 'Milano', 'luca.bianchi@universita.it', '3221236567', 2, 3);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Chiara', 'Belli', '1997-10-12', 'Bari', 'chiara.belli@universita.it', '3334444567', 3, 4);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Gianni', 'Botti', '1998-11-03', 'Firenze', 'gianni.botti@universita.it', '3551234567', 1, 2);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Lucia', 'Verdi', '2001-09-03', 'Bologna', 'lucia.verdi@universita.it', '3331908667', 2, 5);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Danilo', 'Gallinari', '1999-12-03', 'Bologna', 'danilo.gallinari@universita.it', '325741133', 1, 6);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Paolo', 'Toni', '2000-09-23', 'Firenze', 'paolo.toni@universita.it', '3561908667', 3, 2);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Riccardo', 'Biondi', '1997-04-05', 'Milano', 'riccardo.biondi@universita.it', '3367318667', 2, 5);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Davide', 'Lenon', '1996-10-03', 'Bari', 'davide.lenon@universita.it', '3097528667', 3, 2);
INSERT INTO studenti (id_studente, nome, cognome, data_nascita, comune_nascita, email, telefono, id_corsolaurea, id_titolo) 
VALUES (null, 'Andrea', 'Boldi', '1998-09-03', 'Bologna', 'andrea.boldi@universita.it', '3338888667', 2, 1);


INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'John', 'Bho', 'john.bho@universita.it');
INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'Rossana', 'Neri', 'rossana.neri@universita.it');
INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'Matteo', 'Coppi', 'matteo.coppi@universita.it');
INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'Leonardo', 'Da Vinci', 'leonardo.davinci@universita.it');
INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'Lucia', 'Casetta', 'lucia.casetta@universita.it');
INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'Diletta', 'Leotta', 'diletta.leotta@universita.it');
INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'Cristiano', 'Malgioglio', 'cristiano.malgioglio@universita.it');
INSERT INTO docenti (id_docente, nome, cognome, email) 
VALUES 
	(null, 'Lionel', 'Messi', 'lionel.messi@universita.it');
    
    

INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Analisi Matematica', 1);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Meccanica Applicata Alle Macchine', 1);
    
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Social Media Marketing', 2);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Marketing Aziendale', 2);
    
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Statistica', 3);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Demografia', 3);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Fisica', 4);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Chimica', 4);
    
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Finanza', 5);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Bilancio Aziendale', 5);

INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Database', 6);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Java', 6);
    
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Scienze Delle Costruzioni', 7);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Tecnologia Dei Materiali', 7);
    
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Biologia', 8);
INSERT INTO materie (id_materia, nome, id_docente)
VALUES
	(null, 'Anatomia', 8);


INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia, esami.cfu)
VALUES
    (null,'2022-01-10', 25, 1, 1,12),
    (null, '2022-02-10', 28, 1, 2,10),
    (null,'2022-03-10', 30, 1, 7,9),
    (null,'2022-04-10', 24, 1, 7,8);
    
INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 2, 1,12),
    (null, '2022-02-10', 28, 2, 2,10),
    (null,'2022-03-10', 30, 2, 3,9),
    (null,'2022-04-10', 24, 2, 4,8);

INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 3, 1,12),
    (null, '2022-02-10', 28, 3, 2,10),
    (null,'2022-03-10', 30, 3, 3,9),
    (null,'2022-04-10', 24, 3, 4,8);
    
INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 4, 1,10),
    (null, '2022-02-10', 28, 4, 2,12),
    (null,'2022-03-10', 30, 4, 3,9),
    (null,'2022-04-10', 24, 4, 4,8);
    
INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 5, 1,10),
    (null, '2022-02-10', 28, 5, 2,9),
    (null,'2022-03-10', 30, 5, 3,12),
    (null,'2022-04-10', 24, 5, 4,8);
    
INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 6, 1,12),
    (null, '2022-02-10', 28, 6, 2,10),
    (null,'2022-03-10', 30, 6, 3,9),
    (null,'2022-04-10', 24, 6, 4,8);
    
INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 7, 1,12),
    (null, '2022-02-10', 28, 7, 2,10),
    (null,'2022-03-10', 30, 7, 3,9),
    (null,'2022-04-10', 24, 7, 4,8);

INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 8, 1,12),
    (null, '2022-02-10', 28, 8, 2,10),
    (null,'2022-03-10', 30, 8, 3,8),
    (null,'2022-04-10', 24, 8, 4, 9);
    
INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 9, 1,12),
    (null, '2022-02-10', 28, 9, 2,10),
    (null,'2022-03-10', 30, 9, 3,8),
    (null,'2022-04-10', 24, 9, 4,9);
    
INSERT INTO esami (id_esame, data_svolgimento, voto, id_studente, id_materia,esami.cfu)
VALUES
    (null,'2022-01-10', 25, 10, 1,12),
    (null, '2022-02-10', 28, 10, 2, 10),
    (null,'2022-03-10', 30, 10, 3,8),
    (null,'2022-04-10', 24, 10, 4,9);
    
#3.1
SELECT studenti.nome, studenti.cognome
FROM studenti 
JOIN corsi_di_laurea ON studenti.id_corsolaurea = corsi_di_laurea.id_corsolaurea
ORDER BY corsi_di_laurea.nome ASC;

#3.2
SELECT DISTINCT studenti.nome, studenti.cognome, esami.data_svolgimento, esami.voto
FROM studenti
JOIN titoli_di_studio ON studenti.id_titolo = titoli_di_studio.id_titolo
JOIN esami ON esami.id_studente = studenti.id_studente
WHERE esami.data_svolgimento BETWEEN '2022-01-01' AND '2022-12-31';

#3.3
SELECT s.nome, s.cognome, e.voto , e.data_svolgimento
FROM studenti s
JOIN esami e ON s.id_studente = e.id_studente
JOIN materie i ON e.id_materia = i.id_materia
WHERE i.id_docente = 1 AND YEAR(e.data_svolgimento) = 2022
ORDER BY s.cognome, s.nome;

#3.4
SELECT DISTINCT s.email 
FROM studenti s 
JOIN esami e ON s.id_studente = e.id_studente 
JOIN docenti d ON e.id_materia = d.id_docente 
WHERE d.id_docente = 2;

#3.5
SELECT s.nome, s.cognome, COUNT(DISTINCT e.id_esame) AS num_esami_superati, AVG(e.voto) AS media_voti
FROM studenti AS s
LEFT JOIN esami AS e ON s.id_studente = e.id_studente
WHERE e.voto >= 18
GROUP BY s.id_studente
ORDER BY s.cognome ASC;

#3.6
SELECT s.nome, s.cognome, cl.nome AS 'corsi di laurea', cl.cfu AS 'CFU totali', 
SUM(e.cfu) AS 'CFU superati', (cl.cfu - SUM(e.cfu)) AS 'CFU rimanenti'
FROM studenti s
JOIN titoli_di_studio t ON s.id_titolo = t.id_titolo
JOIN istituti i ON t.id_istituto = i.id_istituto
JOIN corsi_di_laurea cl ON s.id_corsolaurea = cl.id_corsolaurea
JOIN esami e ON s.id_studente = e.id_studente
JOIN materie m ON e.id_materia = m.id_materia
WHERE e.voto >= 18
GROUP BY s.id_studente
ORDER BY cl.nome ASC;


#3.7
SELECT nome, cognome
FROM studenti
WHERE id_titolo IN (
    SELECT id_titolo
    FROM titoli_di_studio
    WHERE voto > 80 AND id_titolo = 1
)
ORDER BY cognome DESC;









    

    
    


	

 
 