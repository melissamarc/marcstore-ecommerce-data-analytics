-- 11. quais são os 10 produtos mais vendidos?
select p.nome_produto, p.id_produto, sum(i.quantidade) as total_vendido from itens_pedido as i 
join produtos as p
on p.id_produto = i.id_produto
join pedidos
on pedidos.id_pedido = i.id_pedido
where pedidos.status <> 'Cancelado'
group by p.id_produto, p.nome_produto
order by sum(i.quantidade) desc
limit 10;

-- 12. quais são os 10 produtos que geraram maior faturamento?

select p.id_produto, p.nome_produto, sum(i.quantidade * i.preco_unitario) as total_faturado
from produtos as p join itens_pedido as i
on p.id_produto = i.id_produto
join pedidos 
on pedidos.id_pedido = i.id_pedido
where pedidos.status <> 'Cancelado'
group by p.id_produto, p.nome_produto
order by sum(i.quantidade * i.preco_unitario) desc
limit 10;

-- 13. qual categoria possui maior faturamento?
select c.id_categoria, c.nome_categoria, sum(i.quantidade * i.preco_unitario) as total_faturado_categoria
from itens_pedido as i 
join produtos as p on i.id_produto = p.id_produto
join categorias as c on p.id_categoria = c.id_categoria
join pedidos on pedidos.id_pedido = i.id_pedido
where pedidos.status <> 'Cancelado'
group by c.id_categoria, c.nome_categoria
order by total_faturado_categoria desc
limit 1;

-- 14. qual categoria possui maior quantidade de produtos vendidos?
select p.id_categoria, c.nome_categoria, sum(i.quantidade) as total_produto
from itens_pedido as i
join produtos as p on i.id_produto = p.id_produto
join categorias as c on p.id_categoria = c.id_categoria
join pedidos on pedidos.id_pedido = i.id_pedido
where pedidos.status <> 'Cancelado'
group by p.id_categoria, c.nome_categoria
order by total_produto desc limit 1;


-- 15. quais produtos apresentam maior margem de lucro?
select nome_produto, preco, custo, (preco - custo) as lucro_absoluto, 
round((preco - custo) / preco * 100, 2) as margem_percentual
from produtos
order by margem_percentual desc 
limit 5;