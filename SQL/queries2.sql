-- Expressões e alias

use company1;


select fname , lname, salary, salary * 0.011  from employee;
select fname , lname, salary, salary * 0.011 as inss from employee;
select fname , lname, salary, round(salary * 0.011, 2) as inss from employee;

-- definir um aumento de salários para os gerentes que trabalham no projeto associado ao produtoX


select concat(fname, lname) as complete_name, salary, round(salary *1.1, 2) as increased_salary 
from employee as e, works_on as w, project as p
where (e.ssn = w.essn and w.pno = p.pnumber and p.pname = 'productX');


-- Expressões e concatenação de strings

-- recuperando gerentes que trabalham em stafford

select dname as departament , concat(fname, ' ', lname) as complete_name
from departament as d, dept_locations as l, employee as e
where d.dnumber = l.dnumber and dlocation = 'Stafford' and mgr_ssn = e.ssn;


-- recuperando gerentes, departamentos e seus nomes

select dname as departament , concat(fname, ' ', lname) as complete_name, dlocation
from departament as d, dept_locations as l, employee as e
where d.dnumber = l.dnumber  and mgr_ssn = e.ssn;


-- recuperando gerentes, departamentos e seus nomes

desc project;
select pnumber, d.dnumber, lname, address, bdate 
from departament as d, project as p, employee as e
where d.dnumber = p.dnumber and p.plocation = 'Stafford' and mgr_ssn = e.ssn;


-- Like e between

select concat(fname, ' ', lname) as complete_name, dname as departament_name  
from employee, departament 
where (dno = dnumber and address like '%houston%'); /*Significa que pode ter caracteres antes e depois*/

select concat(fname, ' ', lname) as complete_name,  address
from employee
where (address like '%houston%');


select fname , lname from employee
where (salary between 30000 and 40000);


-- Operadores logicos

select bdate, address from employee
where fname = 'John' and lname = 'Smith';

select * from departament where dname = 'research' or dname = 'headquarters';

select concat(fname, ' ',lname) as complete_name from employee, departament where dname = 'research' and dnumber=dno;


-- subqueries 
select distinct pnumber from project 
where pnumber in 
	(
    select distinct pno from works_on, employee
    where (essn = ssn and lname = 'smith')
    )
or 
	(
     select pnumber from project as p, departament d, employee 
	where mgr_ssn = ssn and lname = 'smith' and p.dnumber = d.dnumber
    );
select distinct * from works_on
where (pno, hours) in (select pno, hours from works_on where essn = 123456789);
    
-- Cláusulas com exists  e unique
-- Quais employees possuem dependentes?

select distinct fname, lname, d.dependent_name from employee as e, dependent as d
where exists 
(
select * from dependent as d
where e.ssn = d.essn and relationship = 'daughter'
);


select distinct fname, lname  from employee as e
where exists 
(
select * from departament
where ssn = mgr_ssn
);


select distinct fname, lname from employee as e, departament as d
where
(
select * from dependent as d
where e.ssn = d.mgr_ssn 
)  
and exists 
(
select * from dependent as d
where e.ssn = d.essn
);

select fname, lname from employee 
where (select count(*) from dependent where ssn = essn) >= 2;

select distinct essn, pno from works_on where pno in (1,2,3);


