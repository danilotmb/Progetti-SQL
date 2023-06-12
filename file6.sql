DROP DATABASE es16;
CREATE DATABASE es16;

USE es16;

create table autorita(
			nome varchar (255),
            sede varchar (255),
            pubblico bool,
            
            primary key (nome)
            
					);
            
            insert into autorita values
            ('ER Salute', 'Bologna', true),
            ('Digos', 'Roma', true),
            ('Agenzia Delle Entrate', 'Ferrara', true),
            ('ENI', 'Fossombrone', false),
            ('Poste Italiane', 'Roma', true);
            
            
create table appalto (
				 ID int,
                 nome varchar(255),
                 autorita varchar (255),
                 
                 
                 primary key (ID),
                 constraint fk_appalto_autorita
                 foreign key (autorita) references autorita(nome)
                 
                 );
                 
                 insert into appalto(ID, autorita, nome) values
            ('1','ER Salute', 'Macchina Radiografia'),
            ('2','Digos', 'Cani'),
            ('3','Agenzia Delle Entrate', 'Sito Web'),
            ('4','ENI', 'Trivelle'),
            ('5','ENI', 'Strategia di Mercato');
            
            
create table fornitore (
                 nome varchar(255),
						
                 primary key (nome)
             
                 );
                 
                 insert into fornitore values
            ('Simens'),
			('Shimadzu'),
            ('Canile'),
            ('Pets&Co'),
            ('Matteo Cotti'),
            ('Deloitte'),
            ('Mirko Botti'),
            ('Azienda Pubblicitaria');
            
            
create table registrazione (
					fornitore varchar (255),
                    autorita varchar (255),
                    
                    constraint fk_registrazione_fornitore
                    foreign key (fornitore) references fornitore(nome),
                    
                    constraint fk_registrazione_autorita
                    foreign key (autorita) references autorita(nome),
                    
                    primary key (fornitore, autorita)
                    );
                    
                    
		insert into registrazione values
        ('Simens', 'ER Salute'),
        ('Deloitte', 'Agenzia Delle Entrate');
        
create table gruppo (
					nome varchar (255),
                    supergruppo varchar (255),
                    
                    primary key (nome)
                    );
                    
                    insert into gruppo values 
                    ('medico', 'salute'),
                    ('informatico', 'computer');
                    
        
create table lineaordine(
				numero_progressivo int,
                appalto int,
                gruppo varchar (255),
                 
				constraint fk_registrazione_appalto
				foreign key (appalto) references appalto(ID),
                
                constraint fk_linea_gruppo
				foreign key (gruppo) references gruppo(nome),
                
                primary key (numero_progressivo, appalto)
                
                );
                
                
		insert into lineaordine values
        (1,1, 'medico'),
        (2,1, 'medico'),
        (3,1, 'medico'),
        (1,2, 'informatico'),
        (2,2, 'informatico');
        
        
create table offerta (
                fornitore varchar (255),
                numero_progressivo_linea int,
                appalto int,
				giorno date,
			
                constraint fk_offerta_linea
				foreign key (fornitore) references fornitore(nome),
                constraint fk_offerta_appalto
				foreign key (numero_progressivo_linea, appalto)
                references lineaordine(numero_progressivo, appalto),
                
                primary key ( fornitore, numero_progressivo_linea, appalto)
                
                );
                
                insert into offerta values 
                ('Simens', 1,1, '2022-12-30');
			
                
create table offertavalida(
				fornitore varchar (255),
                numero_progressivo_linea int,
                appalto int,
				giorno date,
			
                constraint fk_offerta_fornitore_2
				foreign key (fornitore) references registrazione(fornitore),
                constraint fk_offerta_linea_2
				foreign key (numero_progressivo_linea, appalto)
                references lineaordine(numero_progressivo, appalto),
                
                primary key ( fornitore, numero_progressivo_linea, appalto)
                );
        
        insert into offertavalida values 
        ('Simens', 1, 1, '2022-12-30');
        
       
            