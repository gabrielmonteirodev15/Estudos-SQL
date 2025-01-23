-- Esquema para o modela da oficina

create database oficina;

use oficina;

-- Tabela clientes
create table cliente(
	cpf varchar(11) not null,
    nome varchar(30) not null,
    telefone varchar(9) not null,
    primary key (cpf, nome),
    constraint unique_cpf unique (cpf)
);

-- tabela esquipe
create table equipe(
	idequipe int auto_increment primary key,
    area varchar(20) default 'Conserto geral',
    idresponsavel int,
    constraint responsavel_equipe foreign key (idresponsavel) references mecanicos(idmecanicos)
);

-- Tabela mecanicos
create table mecanicos(
	idmecanicos int auto_increment primary key,
    nome varchar(45),
    endereco varchar(50),
    especialidade varchar(20),
    idequipe int,
    constraint equipe_mecanico foreign key (idequipe) references equipe(idequipe)
);

-- Tabelas carro
create table carro(
	cpfCliente varchar(11) not null,
    idcarro int auto_increment primary key,
    modelo varchar(45),
    placa varchar(7),
    ano char(4),
    idequipe int,
    constraint carro_cliente foreign key (cpfCliente) references cliente(cpf),
    constraint carro_equipe foreign key (idequipe) references equipe(idequipe)
);

-- Tabelas ordem de serviço

create table ordem_servico(
	idnum int auto_increment primary key,
    dataEmissao date,
    valor float default 0,
    statusServico enum('Em andamento', 'Finalizado') default 'Em andamento',
    dataEntrega date,
    idcarro int,
    idequipe int,
    constraint os_carro foreign key (idcarro) references carro(idcarro),
    constraint os_carro_equipe foreign key (idequipe) references carro(idequipe)
);

-- tabela mao de obra
create table mao_de_obra(
	idMdo int auto_increment primary key,
	tipoServico varchar(45),
    valor float default 0
);

-- table valor do serviço 
create table valor_servico(
	idMdo int,
    idOs int,
    constraint mao_de_obra foreign key (idMdo) references mao_de_obra(idMdo),
    constraint ordem_de_serviço foreign key (idOs) references ordem_servico(idnum)
);

-- tabela peças
create table pecas(
	idpeca int auto_increment primary key,
    nomePeca varchar(30),
    valor float default 0
);

-- tabela valor da peças 
create table valor_pecas(
	idpeca int, 
    idOs int,
    constraint peça foreign key (idpeca) references pecas(idpeca),
    constraint ordem_de_serviço_pecas foreign key (idOs) references ordem_servico(idnum)
);



