-- 01. quantos clientes existem cadastrados? 
USE marcstore;
SELECT COUNT(*) FROM clientes;
-- A tabela clientes possui 300 registros, ou seja, existem 300 clientes cadastrados.

-- 02. quantos produtos existem disponiveis? 
DESCRIBE produtos;
SELECT COUNT(*) FROM produtos
WHERE estoque > 0;
-- A tabela produtos possui 50 registros com estoque disponível, ou seja, existem 50 produtos disponíveis.


-- 03. quantos pedidos foram realizados?
DESCRIBE pedidos;
SELECT COUNT(*) FROM pedidos;
-- A tabela pedidos possui 1.500 registros, ou seja, foram realizados 1.500 pedidos.

-- 04. qual foi o faturamento total da empresa? 
-- '11.146.206.31'
DESCRIBE pedidos; 
select sum(i.quantidade * i.preco_unitario) as faturamento_pedido
from itens_pedido as i join pedidos as p
on i.id_pedido = p.id_pedido and p.status <> 'Cancelado';
-- A tabela itens_pedido possui 1.500 registros, porém apenas 1358 pedidos não cancelados, e o faturamento total da empresa foi de R$ 11.146.206,31.

-- 05. qual o ticket médio dos pedidos? '8.015,33'
SELECT SUM(quantidade * preco_unitario) / COUNT(DISTINCT id_pedido) AS ticket_medio
FROM itens_pedido;
-- O ticket médio dos pedidos foi de R$ 8.015,33.
