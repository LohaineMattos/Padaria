drop database if exists padaria;
create database padaria character set utf8 collate utf8_general_ci;
use padaria;

create table clientes (
    id_cliente int not null auto_increment primary key,
    nome varchar(100) not null,
    telefone varchar(11) not null,
    email varchar(100),
    nascimento date,
    idade varchar(100)
);

create table produtos (
    codigo_produto int not null primary key,
    nome_produto varchar(100) not null,
    preco_produto float not null,
    quant_estoque int not null
);

create table pedidos (
    id_pedido int not null auto_increment primary key,
    codigo_pedido int not null,
    val_final float,
    data_pedido date not null,
    id_cliente int not null,
    foreign key (id_cliente) references clientes(id_cliente)
);

-- tabela pedido_produtos (relacionamento muitos-para-muitos entre pedidos e produtos)
create table pedido_produtos (
    id_pedido int not null,
    codigo_produto int not null,
    quantidade int not null,
    primary key (id_pedido, codigo_produto),
    foreign key (id_pedido) references pedidos(id_pedido),
    foreign key (codigo_produto) references produtos(codigo_produto)
);

show tables;

insert into clientes (id_cliente, nome, telefone, email, nascimento, idade) values
(1, 'Alberto Aguira Ávila', '1913914552', 'alberto@aguira.com', '1980-05-10', '44 anos');
(2, 'Antonio da Silva', '1956739954', 'antonio@silva.com', '1999-23-11', '25 anos');
(3, 'Carla Mattos', '1945687532', 'carla@mattos.com', '2000-05-07', '24 anos');

insert into produtos (codigo_produto, nome_produto, preco_produto, quant_estoque) values
(101, 'pão francês', 0.50, 100),
(102, 'croissant', 1.20, 50),
(103, 'baguete', 1.00, 30);

insert into pedidos (id_pedido, codigo_pedido, val_final, data_pedido, id_cliente) values
(1, 1001, 5.00, '2024-09-01', 1),
(2, 1002, 3.40, '2024-09-02', 1);


insert into pedido_produtos (id_pedido, codigo_produto, quantidade) values
(1, 101, 6),  
(1, 102, 2),  
(2, 103, 3);  


update produtos set quant_estoque = 94 where codigo_produto = 101;  
update produtos set quant_estoque = 48 where codigo_produto = 102;  
update produtos set quant_estoque = 27 where codigo_produto = 103;  

update pedidos set val_final = 5.40 where id_pedido = 1;  

show tables;
