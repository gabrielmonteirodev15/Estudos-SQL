-- cláusula de ordenação 

use company1;

select * from employee order by fname, lname;

-- nome do departamento nome do gerente 
select distinct d.dname, concat(e.fname," " , e.lname) as manager, address 
from employee as e, departament as d, works_on as w, project as p
where (d.dnumber = e.dno and e.ssn = d.mgr_ssn  and w.pno = p.pnumber )
order by d.dname, e.fname;


-- recupero todoos os empregados e seus projetos em andamento
select distinct d.dname as department, concat(e.fname," " , e.lname) as employee, e.ssn, p.pname as project_name 
from departament as d , employee as e, works_on as w, project as p
where d.dnumber = e.dno and e.ssn = w.essn and w.pno = p.pnumber
order by  d.dname, e.fname;

