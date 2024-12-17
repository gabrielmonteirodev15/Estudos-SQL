-- Trabalhando com querries 

select * from employee;

-- Gerente e seu departamento
select ssn , fname, dname from employee as e, departament as d where (e.ssn = d.mgr_ssn);

-- Recuperando dependentes dos empregados
select  relationship , fname, dependent_name from employee , dependent where Essn = ssn;

select bdate, address from employee where fname = 'John'and minit = 'B';

-- Recuperando departamento especifico
select * from departament where dname = 'Research';

select fname, lname, address from employee, departament 
	where dname = 'Research' and dnumber = dno;
    
    
select * from project;

select pname, essn,fname, hours  from project , works_on, employee where pnumber = pno and essn = ssn;

-- Retira a ambiguidade através do alias 
select dname as Departament_name, l.dlocation as location
from  departament as d, dept_locations as l 
where d.dnumber = l.dnumber;

select concat(fname, ' ', lname) as employee from employee;
