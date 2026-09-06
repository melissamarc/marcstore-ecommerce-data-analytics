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

-- 04. qual foi o faturamento total da empresa? '12.023.003,55'
DESCRIBE pedidos; 
SELECT SUM(quantidade * preco_unitario) AS faturamento_total FROM itens_pedido;
-- A tabela itens_pedido possui 1.500 registros, e o faturamento total da empresa foi de R$ 12.023.003,55.

-- 05. qual o ticket médio dos pedidos? '8.015,33'
SELECT SUM(quantidade * preco_unitario) / COUNT(DISTINCT id_pedido) AS ticket_medio
FROM itens_pedido;
-- O ticket médio dos pedidos foi de R$ 8.015,33.
