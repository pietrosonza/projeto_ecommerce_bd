-- criação do banco de dados para o cenário de ecommerce
create database ecommerce;
use ecommerce;
drop database ecommerce;

-- criando a tabela Cliente
create table cliente(
	idCliente int auto_increment primary key,
    	endereco varchar(60) not null,
    	contato varchar(45) not null
    );

-- Criando a tabela clientepf
create table clientePF(
	idCliente_pf int auto_increment primary key,
    	idCliente int not null,
    	pNome varchar(20) not null,
    	mNome varchar(3) not null,
    	fNome varchar(20) not null,
    	cpf char (11) not null,
    	nascimento date not null,
    	sexo char (1) not null,
    	dataCadastro date not null,
    	constraint pf_cpf_unique unique (CPF, idCliente),
    	constraint fk_pf_cliente_geral foreign key(idCliente) references cliente(idCliente));

-- Criando a tabela clientepj
create table clientePJ(
	idCliente_pj int auto_increment primary key,
	idCliente int not null,
	razaoSocial varchar(45) not null,
	nomeFantasia varchar(45),
	cnpj varchar(20) not null,
	ramo varchar(25),
	porte enum('p','m','g'),
	constraint pj_cnpj_unique unique (cnpj, idCliente),
 	constraint fk_pj_cliente_geral_pj foreign key (idCliente) references cliente(idCliente));

-- criando a tabela Produto
create table produto(
	idProduto int auto_increment primary key,
        pNome varchar(40) not null,
        categoria enum('Eletronico', 'Vestuario', 'Esportes', 'Móveis') not null,
        marca varchar(20),
        valor float not null,
        avaliacao float default 0
);

-- criando tabela de pagamento para referenciar aos pedidos
create table pagamento(
        idPagamento int auto_increment primary key,
        tipoPagamento enum('Cartão', 'Dois Cartões', 'Pix', 'Boleto', 'Dinheiro') not null

);

-- criando a tabela Pedido
create table pedido(
	idPedido int auto_increment primary key,
        idCliente int,
        idPagamento int,
        statusPedido enum('Processando', 'Em andamento', 'Enviado') default 'Processando',
        frete float default 10,
        constraint fk_pedido_Cliente foreign key (idPedido) references cliente(idCliente),
        constraint fk_pedido_Pagamento foreign key (idPagamento) references pagamento (idPagamento)
        
);

-- criando a tabela estoque
create table estoque (
	idEstoque int auto_increment primary key,
        endereco varchar(60) not null
);

-- criando a tabela fornecedor
create table fornecedor (
	idFornecedor int auto_increment primary key,
	cnpj char(18) not null,
        razaoSocial varchar(45) not null,
        nomeFantasia varchar(45),
        endereco varchar(60) not null,
        contato char(14) not null,
        constraint cnpj_unique_fornecedor unique(cnpj)
);

-- criando tabela de produto_estoque - gerada através de uma relação n:m
create table produtoEstoque (
	idEstoque int,
        idProduto int,
        quantidadeEstoque int not null,
        constraint pk_produtoEstoque primary key (idEstoque, idProduto),
        constraint fk_produtoEstoque_Estoque foreign key (idEstoque) references estoque(idEstoque),
        constraint fk_produtoEstoque_produto foreign key (idProduto) references produto(idProduto)
);

-- criando tabela de produto_pedido - gerada através de uma relação n:m
create table produtoPedido (
	idPedido int,
        idProduto int,
        quantidade int default 1,
        statusProduto enum('disponivel','esgotado') default 'disponivel',
        constraint pk_produtoPedito primary key(idPedido, idProduto),
        constraint fk_produtoPedido_Pedido foreign key(idPedido) references pedido(idPedido),
        constraint fk_produtoPedido_Produto foreign key(idProduto) references produto(idProduto)
);

-- criando tabela de produto_fornecedor - gerada através de uma relação n:m
create table produtoFornecedor(
	idFornecedor int,
    	idProduto int,
    	quantidade int not null,
    	constraint pk_prudutoFornecedor primary key (idFornecedor, idProduto),
    	constraint fk_produtoFornecedor_Fornecedor foreign key (idFornecedor) references fornecedor(idFornecedor),
    	constraint fk_produtoFornecedor_Produto foreign key (idProduto) references produto(idProduto)
);

create table entrega(
	idEntrega int auto_increment primary key,
	idPedido int,
	statusEntrega enum('Em transporte', 'Entregue'),
	constraint pk_entrega_pedido foreign key (idPedido) references pedido(idPedido));
