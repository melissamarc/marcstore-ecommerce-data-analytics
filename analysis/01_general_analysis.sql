-- 01. quantos clientes existem cadastrados? 
USE marcstore;
SELECT COUNT(*) FROM clientes;

-- 02. quantos produtos existem disponiveis? 
DESCRIBE produtos;
SELECT COUNT(*) FROM produtos
WHERE estoque > 0;


-- 03. quantos pedidos foram realizados?
DESCRIBE pedidos;
SELECT COUNT(*) FROM pedidos;

-- 04. qual foi o faturamento total da empresa? 

DESCRIBE pedidos; 
select sum(i.quantidade * i.preco_unitario) as faturamento_pedido
from itens_pedido as i join pedidos as p
on i.id_pedido = p.id_pedido and p.status <> 'Cancelado';

-- 05. qual o ticket médio dos pedidos? 
SELECT SUM(quantidade * preco_unitario) / COUNT(DISTINCT id_pedido) AS ticket_medio
FROM itens_pedido;

