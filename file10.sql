DROP DATABASE es6;
CREATE DATABASE es6;
USE es6;

CREATE TABLE fornitore 
	(
		fornitore VARCHAR (255),
        CONSTRAINT PK 
        PRIMARY KEY (fornitore)
     );
     
     
     INSERT INTO fornitore 
	 VALUES ('Amazon'),
			('Ebay'),
			('AliExpress');
	

    CREATE TABLE cliente (
			cliente VARCHAR (255),
            saldo int,
            
            PRIMARY KEY (cliente)
            
            );
  
            
           INSERT INTO cliente 
     VALUES ('Mario',800),
			('Paolo',3000),
			('Anna',1200),
			('Andrea',9000); 
     
     SELECT * FROM cliente;
    
CREATE TABLE ordini
	(
			fornitore VARCHAR (255),
			cliente VARCHAR (255),
            codice int,
            giorno date,
            
            CONSTRAINT FK_ORDINE_FORNITORE
            FOREIGN KEY (fornitore) REFERENCES fornitore(fornitore),
            
            CONSTRAINT FK_ORDINE_CLIENTE
            FOREIGN KEY (cliente) REFERENCES cliente(cliente),
            
            PRIMARY KEY (codice),
            
            UNIQUE (cliente, giorno)
    );
    
    INSERT INTO ordini 
     VALUES ('Amazon','Paolo',14563,'2022-01-22' ),
			('Ebay','Mario',6539,'2020-11-15' ),
			('Amazon','Anna',84472,'2021-09-07' ),
			('AliExpress','Andrea',23535,'2022-07-31' );
            
            SELECT * FROM ordini;
            
CREATE TABLE prodotto (
		prodotto VARCHAR (255),
        fornitore VARCHAR (255),
			CONSTRAINT PK4
			PRIMARY KEY (prodotto),
            CONSTRAINT FK3
			FOREIGN KEY (fornitore) REFERENCES fornitore(fornitore)
            );
     
			INSERT INTO prodotto
            VALUES ('iPhone', 'Amazon'),
				   ('Cover','AliExpress'),
                   ('Vaporiera','Ebay'),
                   ('Borraccia Termica','Amazon');
                   
	 SELECT * FROM prodotto;
     
     
CREATE TABLE certificato(
					nome_prodotto VARCHAR (255),
                    nome_fornitore VARCHAR (255),
                    anno int, 
                    
                    CONSTRAINT FK_CERTIFICATO_PRODOTTO
                    FOREIGN KEY (nome_prodotto) REFERENCES prodotto(prodotto),
                    
                    CONSTRAINT FK_CERTIFICATO_FORNITORE_2
                    FOREIGN KEY (nome_fornitore) REFERENCES fornitore(fornitore),
                    
                    PRIMARY KEY (nome_prodotto, nome_fornitore, anno)
                    
                    
                    
                    
                    );
                    
				INSERT INTO certificato VALUES 
				   ('iPhone', 'Ebay', 2010),
				   ('Cover','Ebay', 2016),
                   ('Vaporiera','AliExpress', 2019),
                   ('Borraccia Termica','Amazon', 2020);
                   
				SELECT * FROM certificato;
     

     

		

     
    