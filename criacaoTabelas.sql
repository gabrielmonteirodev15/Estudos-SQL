create schema if not exists company1;
use company1;

create table employee(
	fname varchar(15) not null ,
    minit char,
    lname varchar(15) not null,
    ssn char(9) not null,
    bdate date,
    address varchar(30),
    sex char,
    salary decimal(10, 2),
    super_ssn char(9),
    dno int not null,
   constraint chk_salary_employee check (salary > 2000.0),
   constraint pk_employee primary key (ssn)
);

create table departament(
	dname varchar(15) not null,
    dnumber int not null,
    mgr_ssn char(9),
    mgr_start_date date,
    dept_create_date date,
    constraint chk_date_dept check (dept_create_date <= mgr_start_date),
	constraint pk_dept primary key (dnumber), 
	constraint unique_name_dept	unique (dname),
    foreign key (mgr_ssn) references employee(ssn)
);

create table dept_locations(
	dnumber int not null, 
    dlocation varchar(15) not null,
	constraint	pk_dept_locations primary key (dnumber, dlocation),
	constraint	fk_dept_locations foreign key (dnumber) references departament(dnumber)
);

create table project(
	pname varchar(15) not null,
    pnumber int not null,
    plocation varchar(15),
    dnumber int not null,
	constraint pk_projeto_number primary key (pnumber),
    constraint  unique_project unique(pname),
	constraint fk_project	foreign key (dnumber) references departament(dnumber) 
); 

create table works_on(
	essn char(9) not null,
    pno int not null,
    hours decimal(3,1) not null,
	primary key (essn, pno),
	constraint fk_essn	foreign key (essn) references employee(ssn),
    constraint fk_pno foreign key (pno) references project(pnumber)
);


create table dependent(
	essn char(9) not null,
    dependent_name varchar(15) not null,
    sex char,
    bdate date,
    relationship varchar(8),
    primary key (essn, dependent_name),
	constraint fk_dependent	foreign key (essn) references employee(ssn)
);

desc employee;

desc departament;

show tables;

alter table employee
	add constraint fk_employee foreign key  (super_ssn) references employee(ssn)
    on delete set null
    on update cascade;

-- Modificar uma constraint : drop e add;
alter table departament drop constraint departament_ibfk_1;

alter table departament
	add constraint fk_dept foreign key(mgr_ssn) references employee(ssn)
    on update cascade;
    
-- dept_locations
alter table dept_locations drop constraint fk_dept_locations;

alter table dept_locations
	add constraint fk_dept_locations  foreign key(dnumber) references departament(dnumber)
    on delete cascade
    on update cascade;
    

    
select * from information_schema.table_constraints
where constraint_schema = 'company1';