drop database ddl;
create database ddl;

use ddl;

create table prova (
				ID int primary key,
                nome varchar (10) not null,
                cognome varchar (10),
				eta int not null,
                check (eta > 18)
                );
                
			insert into prova values 
            (1, 'ciao', null, 27),
            (2, 'ciao', null, 20),
            (3, 'pippo', null, 19);
            
            select * from prova;
            
            
    
			