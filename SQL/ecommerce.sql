create database ecommerce;
use ecommerce;

create table cliente(
	idcliente int auto_increment primary key,
    pname varchar(15),
    minic char(3),
    lname varchar(20),
    cpf char(11) not null,
    endereco varchar(30),
    constraint unique_cpf_cliente unique (cpf)
);

create table produto(
	idproduto int auto_increment primary key,
    pname varchar(15),
    classificacao_kids bool default false,
    categoria enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos') default 'Eletrônico',
    avaliação float,
    size varchar(10)
);

create table cartoes(
	idcliente int,
    idcartao int auto_increment,
    num_cartao varchar(30),
    senha char(4),
	validade char(5),
    primary key(idcartao, idcliente),
    constraint fk_cliente_cartao foreign key (idcliente) references cliente(idcliente)
);
create table pagamentos(
	idpagamento int auto_increment,
    idcliente int,
    tipo enum('Boleto', 'Cartão', 'Pix'),
    primary key(idpagamento, idcliente),
    constraint fk_cliente_pagamento foreign key (idcliente) references cliente(idcliente)
);


create table pedido(
	idpedido int auto_increment primary key,
    idcliente int, 
    status_pedido enum('Processando', 'Cancelado', 'Enviado', 'Entregue') default 'Processando',
    descricao varchar(255),
    frete float default 0,
    idpagamento int,
    constraint fk_cliente_pedido foreign key (idcliente) references cliente(idcliente),
    constraint fk_pagamento_pedido foreign key (idpagamento) references pagamento(idpagamento)
);

create table estoque(
	idestoque int auto_increment primary key,
    locao_estoque varchar(45),
    quantidade int default 0
);

create table fornecedor(
	idfornecedor int auto_increment primary key,
    razao_social varchar(255),
    cnpj char(15),
    contato varchar(11) not null,
    constraint unique_cnpj_fornecedor unique (cnpj)
);


create table vendedor(
	idvendedor int auto_increment primary key,
    razao_social varchar(255),
    nomevendedor varchar(255),
    cnpj char(15),
    cpf char(9),
    localvendedor varchar(255),
	constraint unique_cnpj_vendedor unique(cnpj),
    constraint unique_cpf_vendedor unique(cpf)
);

create table produtoVendedor(
	idvendedor int, 
    idproduto int,
    quantidade int default 1,
    primary key (idvendedor, idproduto),
    constraint fk_produto_vendedor foreign key (idvendedor) references vendedor(idvendedor),
    constraint fk_produto_produto foreign key (idproduto) references produto(idproduto)
);

create table produtopedido(
	 idproduto int ,
     idpedido int,
     quantidade int,
     pestatus enum('Desponível', 'estoque'),
     primary key(idproduto, idpedido),
     constraint fk_produto_pedido foreign key (idproduto) references produto(idproduto),
     constraint fk_pedido_produto foreign key (idpedido) references pedido(idpedido)
);

create table produtoestoque(
	idproduto int, 
    idestoque int,
    localizacao varchar(255) not null,
    primary key (idproduto, idestoque),
    constraint fk_produto_estoque foreign key (idproduto) references produto(idproduto),
    constraint fk_estoque_produto foreign key (idestoque) references estoque(idestoque)
);
create table fornecedorProduto(
	idfornecedor int,
    idproduto int,
    quantidade int not null,
    primary key(idfornecedor, idproduto),
    constraint fk_produto_fornecedor_fornecedor foreign key (idfornecedor) references fornecedor(idfornecedor),
    constraint fk_produto_fornecedor_produto foreign key (idproduto) references produto(idproduto)
);