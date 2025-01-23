-- funções e cláusulas de agrupamento

use company1;

-- quantos employees tem na empresa
select count(*) from employee; 


select count(*) from employee , departament
where dno = dnumber and dname = 'Research';


select dno, count(*) as Number_employee, round(avg(salary), 2) as salary_avg from employee , departament
group by dno;


select pnumber, pname , count(*)
from project, works_on
where pnumber = pno
group by pnumber, pname;


select count(distinct salary) from employee;


select sum(salary) as total_salary, max(salary) as max_salary, min(salary) as min_salary, round(avg(salary), 2) as salary_avg  from employee;

-- group by

select pnumber, pname , count(*)
from project, works_on
where pnumber = pno
group by pnumber, pname;

select pnumber, pname , count(*), round(avg(salary), 2)
from project, works_on, employee
where pnumber = pno and ssn = essn
group by pnumber, pname;

select pnumber, pname , count(*) as number_register, round(avg(salary), 2) as avg_salary
from project, works_on, employee
where pnumber = pno and ssn = essn
group by  pnumber
order by count(*);


-- Cláusula HAVING

select pnumber, pname, count(*)
from project, works_on
where pnumber = pno
group by pnumber , pname
having count(*) > 2;

select dno, count(*)
from employee
where salary > 20000
group by dno
having count(*) >= 2;

select dno as department, count(*) as number_employee
from employee 
where salary > 20000 and dno in (select dno from employee group by dno having count(*)>=2)
group by dno;





