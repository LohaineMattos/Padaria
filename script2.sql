drop database if exists Oficina;
create database Oficina character set utf8 collate utf8_general_ci;
use Oficina;

create table funcionarios (
    id_funcionario int not null auto_increment primary key,
    nome_funcionario varchar(100) not null,
    especialidade_funcionario varchar(100) not null
);

create table veiculos (
    placa_veiculo varchar(10) not null primary key,
    tipo_veiculo varchar(50),
    modelo_veiculo varchar(100)
);

create table servicos (
    num_servico int not null auto_increment primary key,
    desc_servicos varchar(255),
    preco_servico decimal(10, 2) not null,
    id_funcionario int not null,
    placa_veiculo varchar(10) not null,
    foreign key (id_funcionario) references funcionarios (id_funcionario),
    foreign key (placa_veiculo) references veiculos (placa_veiculo)
);

show tables;

insert into funcionarios (nome_funcionario, especialidade_funcionario) values
('rafael pedigree', 'mecânico'),
('mariana ferraz', 'eletricista'),
('carlos santiego', 'pintor');

insert into veiculos (placa_veiculo, tipo_veiculo, modelo_veiculo) values
('lsn4i42', 'carro', 'fusca'),
('lsn4i59', 'moto', 'titan'),
('lsn4i69', 'caminhão', 'volvo');

insert into servicos (desc_servicos, preco_servico, id_funcionario, placa_veiculo) values
('troca de óleo', 50.00, 1, 'lsn4i42'),
('reparo de elétrica', 120.00, 2, 'lsn4i59'),
('pintura de carro', 300.00, 3, 'lsn4i69');