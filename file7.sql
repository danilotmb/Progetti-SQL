drop database if exists es26;
create database if not exists es26;
use es26;

create table if not exists Cliente (

	CF char(16),
    nome varchar (255) not null,
    cognome varchar (255),
    indirizzo varchar (255),
    
    primary key(CF)
    );
    
insert into Cliente values 
("BTTMRC", "Mirco", null, null),
("BRLMCH", "Michele", "Barillani" , null);

create table Ordine (
	ID int auto_increment,
    CF_cliente char (16) not null,
    giorno datetime default current_timestamp(),
    #settimana int,
    #anno int,
    #check (settimana > 0 and settimana < 53 and anno > 1970),
    
    primary key (ID),
    constraint fk_ordine_cliente
    foreign key (CF_cliente) references Cliente(CF)
    
    );
    
    
    insert into Ordine (CF_cliente) values
    ("BTTMRC"),
    ("BRLMCH");
    
    
    insert into Ordine values 
    (null, "BRLMCH", default);
    
    
    select * from Ordine;
    
    
    
    create table Materiale (
    
		nome varchar(50),
        
        primary key (nome)        
        );
        
        
        insert into Materiale values
        ("Zinco"),
        ("Pvc"),
        ("Legno"),
        ("Rame"),
        ("Piombo");

        
 create table LineaOrdine (
		materiale varchar(50),
        ordine int,
        quantita int not null,
        
        primary key (materiale, ordine),
        
        constraint fk_linea_ordine
        foreign key (ordine) references Ordine(ID),
        
        constraint fk_linea_materiale
        foreign key (materiale) references Materiale(nome),
        
        check ( quantita > 0 )
        );
        
        
        insert into LineaOrdine values 
        ("Piombo", 1, 2),
        ("Zinco", 1, 1);
        
        
create table Magazzino (
		nome varchar (50),
		azienda varchar (255),
        citta varchar (255),
		indirizzo varchar (255),
        
        primary key (nome),
        unique (citta, indirizzo, azienda)
        
        
        );
        
        
        
	insert into Magazzino values
    ("Ariosto","Ferrara", "via Provinciale 25", "Amazon"),
    ("Dallara","Bologna", "via Provinciale 25", "Amazon"),
    ("Estense","Ferrara", "via Dei Matti 72", "PayPal"),
    ("SPAL","Ferrara", "via Provinciale 25", "Ebay");
    
    
    
create table Scorte (

		magazzino varchar (50),
        quantita int,
        materiale varchar (50),
        prezzo decimal(6, 2),
        
        constraint fk_magazzino
        foreign key (magazzino) references Magazzino(nome),

        primary key (magazzino, materiale , prezzo)
        
        );
    
		 
         insert into Scorte values ("Estense", 2,"Zinco", 500.43);
         
         
         
 create table Fornitura (
 
		magazzino_scorta varchar (50),
        materiale_scorta varchar (50),
        prezzo_scorta decimal (6,2),
        
        materiale_linea varchar (255),
        ordine_linea int,
        
        
        constraint fk_fornitura_magazzino
        foreign key ( magazzino_scorta, materiale_scorta, prezzo_scorta)
        references Scorte(magazzino, materiale, prezzo),
        
        constraint fk_fornitura_linea
        foreign key ( materiale_linea, ordine_linea)
        references LineaOrdine (materiale, ordine),
        
        primary key (magazzino_scorta, materiale_scorta, prezzo_scorta, materiale_linea)
        );
        
        
        insert into Fornitura values 
        ("Estense", "Zinco", 500.43, "Piombo", 1);
        
        select * from Fornitura;
        
        
        