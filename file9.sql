DROP DATABASE es1;
CREATE DATABASE es1;
USE es1;

CREATE TABLE gruppo(
	 gruppo VARCHAR (255),
     CONSTRAINT PK 
     PRIMARY KEY (gruppo)
     );
     
     INSERT INTO gruppo 
     VALUES ('Mediaset');
     
CREATE TABLE societa (
	societa VARCHAR (255),
    gruppo VARCHAR (255),
    CONSTRAINT PK2
    PRIMARY KEY (societa),
    CONSTRAINT FK
    FOREIGN KEY (gruppo) REFERENCES gruppo(gruppo)
    );
    
    INSERT INTO societa 
     VALUES ('Infinity','Mediaset'),
     ('MediasetPlay', 'Mediaset');
     
    
CREATE TABLE filiale (
		filiale VARCHAR (255),
        societa VARCHAR (255),
        CONSTRAINT PK3
        PRIMARY KEY (filiale),
        CONSTRAINT FK2
        FOREIGN KEY (societa) REFERENCES societa(societa)
        );
        
        INSERT INTO filiale  
     VALUES ('Milano','Infinity'),
     ('Bologna','Infinity'),
     ('Parma', 'MediasetPlay');
     
     

CREATE TABLE stabilimento(
		stabilimento VARCHAR (255),
        societa VARCHAR (255),
        CONSTRAINT PK4
        PRIMARY KEY (stabilimento),
        CONSTRAINT FK3
        FOREIGN KEY (societa) REFERENCES societa(societa)
        );
      
           INSERT INTO stabilimento  
     VALUES ('CityLife', 'Infinity'),
     ('SanSiro', 'MediasetPlay');
     
     
CREATE TABLE articolo(
		articolo VARCHAR (255),
        stabilimento VARCHAR (255),
         CONSTRAINT PK5
        PRIMARY KEY (articolo),
        CONSTRAINT FK4
        FOREIGN KEY (stabilimento) REFERENCES stabilimento(stabilimento)
        );
        
       INSERT INTO articolo  
     VALUES ('Italia1', 'CityLife'),
     ('DAZN', 'SanSiro');
     
     
     SELECT * FROM es1.filiale;
        
        