-- Persistência dos dados

-- Inserindo dados clientPF
insert into clientePF (idCliente, pNome, mNome, fNome, cpf, nascimento, sexo, dataCadastro)
	values
    (1, 'Pietro', 'P', 'Sonza', '15487484714', '1998-08-17', 'M', '2023-01-08'),
    (2, 'Sandro', 'P', 'Sonza', '12345678910', '1996-07-06', 'M', '2023-01-08'),
    (3, 'Merieli', 'M', 'Padilha', '12345678911', '1997-05-08', 'F', '2023-01-01'),
    (4, 'Sandro', 'A', 'Sonza', '12345678912', '1995-09-23', 'M', '2022-12-18'),
    (5, 'Celito', 'Z', 'Sonza', '12345678913', '1950-02-24', 'M', '2022-10-17'),
    (6, 'Jane', 'A', 'Sonza', '12345678914', '1954-03-31', 'F', '2022-08-15');

   
-- Inserindo dados clientePJ
insert into clientePJ (idCliente, razaoSocial, nomeFantasia, cnpj, ramo, porte)
	values
    (7, 'Loja Game', null, '12123456000148', 'Eletrônicos', 'M'),
    (8, 'Loja Casa', null, '12345678990148', 'Móveis', 'G'),
    (9, 'Loja Roupa', null, '1234567891012', 'Vestuario', 'M'),
    (10, 'Loja Futebol', null, '14874987000148', 'Esportes', 'P');


-- Inserindo dados cliente
insert into cliente (endereco, contato)
	values
    ('Av Mauro ramos, 1250, Florianopolis', '+51999804349'),
    ('Av Madre Bevenuta, 1000, Florianopolis', '+4833418474'),
    ('Av Mauro Ramos, 1250, Florianopolis', '+48999994847'),
    ('Av Beira Mar, 1000, Florianopolis', '+48998414874'),
    ('Rua Erico Verissimo, 310, Jaguari', '+55997848147'),
    ('Rua David Cortiana, 311, Jaguari', '+55998148748'),
    ('Av Madre Bevenuta, 123, Florianopolis', '+4832416487'),
    ('Rua Rafael Bandeira, 1355, FLorianopolis', '+4832418748'),
    ('Rua 7 de Setembro, 1478, Jaguari', '+32551487'),
    ('Rua Jose Bonifacio, 12, Jaguari', '+32554847');

-- Inserindo dados produto
insert into produto (pNome, categoria, marca, valor, avaliacao)
	values
    ('Computador', 'Eletronico', 'Dell', 8500, 4.9),
    ('Cama box', 'Móveis', 'Ortobom', 4000, 5),
    ('Tênis casual', 'Vestuario', 'Vans', 455, 4.7),
    ('Bicleta', 'Esportes', 'Specialized', 12000, 4.8);

-- Inserindo dados pagamento
insert into pagamento (tipoPagamento)
	values
    ('Cartão'),
    ('Dois Cartões'),
    ('Pix'),
    ('Boleto'),
    ('Dinheiro');

-- Inserindo dados pedido
insert into pedido (idCliente, idPagamento, statusPedido, frete)
	values
    (1, 1, 'Enviado', 120),
    (8, 3, default, 80),
    (4, 2, default, 65),
    (7, 4, 'Em andamento', 45),
    (1, 1, default, 55);
    
-- Inserindo dados produtopedido
insert into produtopedido (idPedido, idProduto, quantidade, statusProduto)
	values
    (1, 1, 1, default),
    (2, 2, 5, default),
    (3, 2, 1, default),
    (4, 2, 2, default),
    (5, 3, 5, default);

-- Inserindo dados entrega
insert into entrega (idPedido, statusEntrega)
	values
    (1, 'Entregue'),
    (2, null),
    (3, null),
    (4, null),
    (5, null);
  
-- Inserindo dados estoque
insert into estoque (endereco)
	values
    ('Av Mauro Ramos, Florianopolis'),
    ('Rua 7 de Setembro, Jaguari'),
    ('Rua Trompovski, Florianopolis');

-- Inserindo dados produtoestoque
insert into produtoestoque (idEstoque, idProduto, quantidadeEstoque)
	values
    (1, 1, 35),
    (1, 2, 15),
    (1, 3, 150),
    (2, 1, 10),
    (2, 2, 25),
    (2, 3, 200),
    (3, 4, 150);

-- Inserindo dados fornecedor
insert into fornecedor (cnpj, razaoSocial, nomeFantasia, endereco, contato)
	values
    ('12345678000190', 'Kabum', 'Kabum E-sports', 'Av Brasil, São Paulo', '+1132488718'),
    ('12345678000191', 'Casas Bahia', null, 'Av Salgado Filho, Rio de Janeiro', '+2148748744'),
    ('12345678000192', 'Vans', 'Vans do Brasil', 'Rua XV de Novembro, São Paulo', +'+1132483243'),
    ('12345678000194', 'World Bike', null, 'Rua Bocaiuva, Florianópolis', '+4832414878');
    
-- Inserindo dados produtofornecedor
insert into produtofornecedor (idFornecedor, idProduto, quantidade)
	values
    (1, 1, 350),
    (2, 2, 250),
    (3, 3, 1000),
    (4, 4, 200);







    
