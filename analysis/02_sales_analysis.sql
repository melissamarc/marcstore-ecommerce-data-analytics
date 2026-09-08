-- 06. qual foi o faturamento de cada mes?

select month(p.data_pedido), sum(i.quantidade * i.preco_unitario) as total_pedido
from pedidos as p join itens_pedido as i
on i.id_pedido = p.id_pedido 
where p.status <> 'Cancelado'
group by month(p.data_pedido)
order by month(p.data_pedido);

-- mes 1, 735.375.13
-- mes 2, 1.032.332,70
-- mes 3, 926.195,34
-- mes 4, 921.816,11
-- mes 5, 1.012.223,63
-- mes 6, 953.882,78
-- mes 7, 782.076,57
-- mes 8, 1.022.484,76
-- mes 9, 1.156.629,13
-- mes 10, 1.054.561,86
-- mes 11, 911.004,54
-- mes 12, 637.623,76

-- 07. qual foi o mês com maior faturamento?
select month(p.data_pedido), sum(i.quantidade * i.preco_unitario) as total_pedido
from pedidos as p join itens_pedido as i
on i.id_pedido = p.id_pedido 
where p.status <> 'Cancelado'
group by month(p.data_pedido)
order by total_pedido desc;

-- com base nos resultados da consulta anterior, o mês com maior faturamento foi o mês 9, com um total de 1.156.629,13.



