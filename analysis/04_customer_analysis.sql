 -- 16. quais são os 10 clientes que mais gastaram?
 select
 c.id_cliente, 
 c.nome,
 sum(i.quantidade * i.preco_unitario) as total_gasto
 from clientes as c
 join pedidos as p on p.id_cliente = c.id_cliente
 join itens_pedido as i on i.id_pedido = p.id_pedido
 where p.status <> 'Cancelado'
 group by c.id_cliente, c.nome
 order by total_gasto desc limit 10;
 
  -- 17. qual é o gasto médio por cliente?
select round(avg(total_gasto), 2) as media_gasta
from(
  select c.id_cliente, c.nome, sum(i.quantidade * i.preco_unitario) as total_gasto
  from clientes as c
  join pedidos as p on p.id_cliente = c.id_cliente
  join itens_pedido as i on i.id_pedido = p.id_pedido
  where p.status <> 'Cancelado'
  group by c.id_cliente, c.nome
) as gastos_por_cliente;