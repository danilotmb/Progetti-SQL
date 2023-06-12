#seleziona tutte le righe, duplicati compresi 
select distinct REGION_ID from countries;

#conta tutti gli ID distinti delle regioni distinti
select count(distinct(REGION_ID)) from countries;

#conta tutti gli ID delle regioni
select count(REGION_ID) from countries;

select count(COUNTRY_NAME) from countries;

alter table countries
add constraint unique (COUNTRY_NAME);

select * from countries 
where COUNTRY_NAME like 'B%';



#####################

select * from regions;

insert into regions values (5, 'Australia');

#####################

select * from employees;

#selezionare dipendenti con piu di 25 anni di impiego 
#selezionare il numero di dipendenti per un certo JOB ID 
#selezionare quale dipartimento richiede piu risorse economiche 

select * from employees
where HIRE_DATE > '1987-08-01';


select * from employees
where DEPARTMENT_ID = '50';


select avg(SALARY) from employees; 

select * from employees 
where SALARY between 500 and 4000;


select * from employees 
where (SALARY > 4000) and (SALARY < 6000);


select count(*) from employees 
where (SALARY > 4000) and (SALARY < 6000);

select avg(SALARY) from employees
where  JOB_ID = 'SH_CLERK';


select avg(SALARY) from employees
where MANAGER_ID = 100 or MANAGER_ID = 103 or MANAGER_ID = 108;

select MANAGER_ID, avg(SALARY) from employees
group by MANAGER_ID;

select DEPARTMENT_ID ,sum(SALARY > 5000) from employees 
group by DEPARTMENT_ID;

#select DEPARTMENT_ID ,count(SALARY > 5000) from employees 
#group by DEPARTMENT_ID;

select DEPARTMENT_ID ,count(*) from employees 
where (SALARY > 5000) group by DEPARTMENT_ID;


select DEPARTMENT_ID, count(distinct(MANAGER_ID)) ,
sum(COMMISSION_PCT > 0 )
from employees
group by DEPARTMENT_ID
order by DEPARTMENT_ID asc;


 #############
 
select * from jobs;







