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

-- 18. quais cidades possuem maior quantidade de pedidos?
select c.cidade, count(p.id_pedido) as total_pedidos
from pedidos as p inner join clientes as c
on c.id_cliente = p.id_cliente 
group by c.cidade
order by total_pedidos desc;


-- 19. quais clientes realizaram mais pedidos?
select c.id_cliente, c.nome, count(id_pedido) as quantidade_pedidos 
from pedidos as p
join clientes as c 
on p.id_cliente = c.id_cliente
group by c.id_cliente, c.nome
order by quantidade_pedidos desc 
limit 5;

-- 20. quantos clientes nunca realizaram um pedido?
select count(null) as clientes_sem_pedidos 
from clientes as c 
left join pedidos as p 
on p.id_cliente = c.id_cliente;