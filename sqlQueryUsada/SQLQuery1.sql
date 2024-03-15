create database vendas

use vendas


create table categorias(
categoriaId integer not null identity primary key,
descricao varchar (30) null
)

insert into categorias (descricao) values ('Alimentação')
insert into categorias (descricao) values ('Bazar'), ('Brinquedo'), ('Higiene')
insert into categorias (descricao) values ('Tablets'), ('Notebook'), ('Celular')

 
select categoriaId, descricao From categorias


select categoriaId, descricao from categorias where categoriaId between 1 and 3


update categorias set descricao = 'Bazar' where categoriaId =2
Select * from categorias 


dbcc checkident ('Categorias', reseed, 0);

create dataBase dbvendasTESTE


Select * from categorias 
order by categoriaId desc


select * into #TEMP01
from categorias

select * from #TEMP01
INSERT INTO #TEMP01 (descricao) values ('teste temp')


select * into ##TEMPglob
from categorias

insert into ##TEMPglob (descricao) values ('Teste temp glocal'), ('teste2 teste teste teste')

select*from ##TEMPglob


Create table #TESTEE (
campo1 int not null identity primary key,
campo2 varchar(30) null
)



create table clientes(
clienteId int IDENTITY(1,1) NOT NULL,
nome varchar(60) null,
endereco varchar (60) null,
cidade varchar (50) null,
estado varchar (2) null,

cep varchar (10) null,
telefone varchar (14) null,
email varchar (100) null,
dataNascimento datetime null
PRIMARY KEY (clienteId),
)

select clienteId, nome, endereco, cidade, bairro, estado, cep, telefone, email, datanascimento from clientes



CREATE TABLE produtos(
produtoId int IDENTITY(1,1) NOT NULL,
nome varchar (60) NULL,
descricao varchar(255) null,
valor decimal(18,5) default 0.00000 null,
quantidade decimal (18,5) default 0.00000 null,
categoriaId int null,
PRIMARY KEY (produtoId),
CONSTRAINT FK_ProdutosCategorias
FOREIGN KEY (categoriaId) references categorias(categoriaId)
)

SELECT p.produtoId,
p.nome,
p.valor,
p.quantidade,
p.categoriaId,
c.descricao As DescricaoCategoria
From produtos as p
left join categorias as c on c.categoriaId = p.categoriaId





IF OBJECT_ID ('vendas') is null
begin
Create table vendas (
vendaId int identity(1,1) not null,
clienteId int not null,
dataVenda datetime default getdate(),
totalVenda decimal(18,5) default 0.00000,

primary key (vendaId),
constraint FK_VendasCliente FOREIGN KEY (clienteId)
references clientes (clienteId)
)
end


IF OBJECT_ID ('vendasItens') is null
begin
Create table vendasItens (
vendaId int not null,
produtoId int not null,
valorUnitario decimal (18,5) default 0.00000,
quantidade decimal (18,5) default 0.00000,
primary key (vendaId,produtoId),
constraint FK_VendasItensProdutos foreign key (produtoId)
references produtos (produtoId)
)
end



SELECT clienteId,
nome
From clientes

delete from vendasItens
delete from vendas
dbcc checkident('vendas', reseed, 0)


select * from vendasItens

if Object_id('usuarios') is null
begin
  Create table usuarios(
  usuarioId int identity(1,1) not null,
  nome varchar(50) not null,
  senha varchar(40) not null,

  primary key (usuarioId)
  )
End;

drop table usuarios


CREATE TABLE acaoAcesso (
      acaoAcessoId int identity (1,1) not null,
	  descricao varchar(100) not null,
      chave varchar(60) not null, 
      Primary Key (acaoAcessoId) 
      ) 

	  drop table acaoAcesso

  CREATE TABLE usuariosAcaoAcesso (  
   usuarioId int NOT NULL,
   acaoAcessoid int NOT NULL,
   ativo bit not null default 1,
   PRIMARY KEY (usuarioId, acaoAcessoId),
   CONSTRAINT FK_UsuarioAcaoAcessoUsuario 
  FOREIGN KEY (usuarioId) references usuarios (usuarioId), 
 CONSTRAINT FK_UsuarioAcaoAcessoAcaoAcesso 
 FOREIGN KEY (acaoAcessoId) 
 references acaoAcesso(acaoAcessoId), 
 ) 

drop table usuariosAcaoAcesso


SELECT ua.usuarioId,
       ua.acaoAcessoId,
       a.descricao,
       ua.ativo
From usuariosAcaoAcesso AS ua
  Inner JOIN acaoAcesso AS a ON a.acaoAcessoId = ua.acaoAcessoId
WHERE ua.usuarioId=2


  SELECT usuarioId
  FROM usuariosAcaoAcesso 
  WHERE usuarioId=2
  AND acaoAcessoId=(SELECT TOP 1 acaoAcessoId FROM acaoAcesso WHERE chave='frmSelecionarData')
  AND ativo=1

drop table categorias

SELECT CONVERT (VARCHAR, vendas.clienteId)+'-'+clientes.nome AS label, SUM(vendas.totalVenda)AS Value
FROM vendas
Inner Join clientes ON clientes.clienteId = vendas.clienteId
WHERE vendas.dataVenda BETWEEN CONVERT(DATE, GETDATE()-7) and CONVERT(DATE, GETDATE())
GROUP BY Vendas.clienteId, clientes.Nome

SELECT TOP 10 CONVERT (VARCHAR, vi.ProdutoId)+'-'+p.nome AS Label, SUM(vi.totalProduto) AS Value
FROM vendasItens as vi
 INNER JOIN produtos AS P ON p.produtoId = vi.produtoId
 GROUP BY vi.produtoId, p.nome

 SELECT vendas.DataVenda AS Label, SUM(vendas.totalVenda) as Value
 from Vendas
 WHERE vendas.datavenda BETWEEN CONVERT(DATE, GETDATE()-7) and CONVERT(DATE, GETDATE())
 GROUP BY vendas.dataVenda