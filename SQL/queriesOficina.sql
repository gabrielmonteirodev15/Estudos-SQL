-- Queries sql
use oficina;

-- recupere dos o cliente da oficina
select *  from cliente;

-- recupere os mecanicos que trabalham que sao responsaveis pelas as equipes, recuperar o id da equipe e a area
select m.nome , e.idequipe, e.area from mecanicos as m , equipe as e 
where e.idresponsavel = m.idmecanicos;

-- recupere os valores de inss dos mecanicos com base dos salarios
select nome, salario, (salario * 1.1) as inss from mecanicos;

-- recupere as ordem de serviço e ordene pela a data de entrega
select * from ordem_servico
order by dataEntrega;


-- verifique se há mais de dois carros sendo trabalhado pela a equipe com id 2
select count(*) as carros from carro
where idequipe = 2
having count(*) > 2;

-- recupere os carros que cada equipe está responsavel
select e.idequipe as id_equipe, e.area, c.idcarro, c.placa, c.modelo from equipe as e join carro as c
where c.idequipe = e.idequipe
group by e.idequipe;



