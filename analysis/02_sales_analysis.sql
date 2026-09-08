-- 06. qual foi o faturamento de cada mes?

select month(p.data_pedido), sum(i.quantidade * i.preco_unitario) as total_pedido
from pedidos as p join itens_pedido as i
on i.id_pedido = p.id_pedido 
where p.status <> 'Cancelado'
group by month(p.data_pedido)
order by month(p.data_pedido);


-- 07. qual foi o mês com maior faturamento?
select month(p.data_pedido) as mes, sum(i.quantidade * i.preco_unitario) as total_pedido
from pedidos as p join itens_pedido as i
on i.id_pedido = p.id_pedido 
where p.status <> 'Cancelado'
group by month(p.data_pedido)
order by total_pedido desc
limit 1; -- mostrando apenas a linha importante

 
-- 08. qual foi o mês com maior quantidade de pedidos?
select month(data_pedido) as mes, count(*) as quantidade_pedidos
from pedidos
group by month(data_pedido)
order by quantidade_pedidos desc
limit 1; -- mostrando apenas a linha importante

-- 09. qual foi o valor médio dos pedidos por mês?
select month(data_pedido) as mes, avg(valor_pedido) as media_pedidos
from (
    select p.id_pedido, p.data_pedido,
           sum(i.quantidade * i.preco_unitario) as valor_pedido
    from pedidos as p
    join itens_pedido as i on i.id_pedido = p.id_pedido
    where p.status <> 'Cancelado'
    group by p.id_pedido, p.data_pedido
) as pedidos_agregados
group by month(data_pedido)
order by mes;

-- 10. qual foi a quantidade de pedidos cancelados?
select count(*) from pedidos
where status = 'Cancelado';
