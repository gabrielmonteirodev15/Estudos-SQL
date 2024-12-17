-- inserção de dados no bd company

use company1;

show tables;

select * from employee;
insert into employee values ( 'Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, null, 5),
       ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 333445555, 4);
       
       
insert into dependent values (999887777, 'Alice', 'F', '1986-04-05', 'daughter'),
							(999887777, 'Smith jr', 'M', '1996-12-06', 'son'),
                            (333445555,  'joy', 'M', '1994-02-06', 'son' ),
                            (123456789,  'Maria', 'F', '1992-10-22', 'daughter');
                            
                            
insert into departament values('Research', 5,'333445555', '1988-05-22', '1986-05-22'),
								('Administratio', 4, '999887777', '1995-01-01', '1994-01-01'),
                                ('Headquarters', 1, '123456789', '1981-06-19', '1980-06-19');

insert into  dept_locations values (1, 'Houston'),
									(4, 'Stafford'),
                                    (5, 'Bellaire'),
                                   (5, 'Sugarland'),
                                   (5, 'Houston');
                                   
insert into project values ('productX', 1, 'Bellaire', 5),
							('productY', 2, 'Sugarland', 5),
                            ('productZ', 3, 'Houston', 5),
                            ('Computerization', 10, 'Stafford', 4),
                            ('Reorganization', 20, 'Houston', 1),
                            ('Newbenefits', 30, 'Stafford', 4);
                            
insert into works_on values(999887777, 1, 32.5),
							(333445555, 10, 12),
                            (123456789, 20, 2.5);
   
