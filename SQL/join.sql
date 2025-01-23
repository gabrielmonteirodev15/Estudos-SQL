use company1;
-- join Statement

-- Join
select * from employee, works_on where ssn = essn;

-- Join on -> inner join on
select * from employee join works_on on ssn = essn;

select * from employee join departament on ssn=mgr_ssn;

select fname, lname, address
from (employee join departament on dno = dnumber)
where dname = 'Research';


select dname, dnumber, dept_create_date, dlocation 
from departament join dept_locations  using(dnumber)
order by dlocation; 
/*Usamos using quando temos o atribudo com o mesmo nome nas duas tabelas*/

-----------------------------------------------------------------------------

-- Join com mais de 2 tabelas

--  project, works_on e employee

select concat(fname, ' ', lname), dname, pname, pnumber
from employee inner join works_on on ssn = essn
inner join project on pnumber = pno
inner join departament on departament.dnumber = employee.dno
order by pnumber;


-- Departament, dept_location, employee

-- Achar os departamentos que os employees trabalham
select concat(fname, ' ', lname), dname, dnumber, dlocation 
from departament inner join dept_locations using(dnumber)
inner join employee on dno = dnumber
group by dnumber
order by dnumber;

-- Achar os departamentos que os employees gerenciam
select  concat(fname, ' ', lname), dname, dnumber, dlocation 
from departament inner join dept_locations using(dnumber)
inner join employee on ssn = mgr_ssn
group by dnumber
order by dnumber;


-- outer Join

select * from employee inner join dependent 
on ssn = essn;

select * from employee left join dependent 
on ssn = essn;

select * from employee left outer join dependent 
on ssn = essn;