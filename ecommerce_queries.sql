-- número de vendas no período
select count(*) from pedido;
	-- 5

-- quantidade de itens vendidos
select sum(quantidade) quantidade_vendida from produtopedido;
	-- 14

-- Busque os itens, a quantidade e o valor total por item
select p.pNome produto, sum(pp.quantidade) quantidade, sum(p.valor * pp.quantidade) valor from produtopedido pp
	inner join produto p
    	on p.idProduto = pp.idProduto
   	group by p.pNome;
	-- computador = 1 valor 8500, cama box = 8 valor 32000, Tenis casual = 5 valor 2275

-- Total da receita até o momento
select sum(pp.quantidade * p.valor) total_receita from produtopedido pp
	inner join produto p
    	on p.idProduto = pp.idProduto;
    -- R$42.775

-- Quais produtos e suas quantidades estão armazenado em cada cidade
select e.endereco, p.pNome, pe.quantidadeEstoque from produtoestoque pe
	inner join estoque e
	on pe.idEstoque = e.idEstoque
    	inner join produto p
    	on pe.idProduto = p.idProduto
    	order by quantidadeEstoque desc;

-- Quantidade total de cada produto em estoque
select p.pNome produto, sum(pe.quantidadeEstoque) quantidade from produtoestoque pe
	inner join produto p
    	on pe.idProduto = p.idProduto
    	group by p.pNome
    	order by quantidade desc;
    
-- Nossa lista de clientes contêm mais PJ ou PF?

select Tipo, count(id) Quantidade
from (
	select idCliente id, pNome identificacao,
		case
			when cpf != '' then "Pessoa Física"
		end as "Tipo"
    from clientepf
    UNION ALL
    select idCliente, razaoSocial,
    case
		when cnpj != '' then "Pessoa Jurídica"
        end as "Tipo"
    from clientepj
    ) clientes
    group by Tipo;
		-- PF = 6, PJ = 4
        
-- Qual é a forma que mais recebemos pagamento
select pg.tipoPagamento forma_pagamento, count(p.idPedido) quantidade from pedido p
	inner join pagamento pg
    on p.idPagamento = pg.idPagamento
    group by forma_pagamento;
		-- Cartão = 2, Dois Cartões = 1, Pix = 1, Boleto = 1
        
-- Quais e quantos produtos nossos fornecedores nos disponibilizaram
select f.razaoSocial Fornecedor, p.pNome Produto, pf.quantidade from produtofornecedor pf
	inner join fornecedor f
    on pf.idFornecedor = f.idFornecedor
    inner join produto p
    on pf.idProduto = p.idProduto
    order by pf.quantidade desc;

-- Quanto temos de dinheiro imobilizado em nosso estoque?
select sum(p.valor * pe.quantidadeEstoque) valor_total_imobilizado from produtoestoque pe
	inner join estoque e
	on pe.idEstoque = e.idEstoque
    inner join produto p
    on pe.idProduto = p.idProduto
		-- R$2.501.750
        

    
