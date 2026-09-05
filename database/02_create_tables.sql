create table clientes(
id_cliente int not null auto_increment,
nome varchar(50) not null,
email varchar(60),
cidade varchar(30) default 'São Paulo' not null,
estado varchar(30) default 'SP' not null,
data_cadastro date,
primary key(id_cliente)
); 

create table categorias(
id_categoria int not null auto_increment,
nome_categoria varchar(50),
primary key(id_categoria)
);

create table produtos(
id_produto int not null,
id_categoria int not null,
nome_produto varchar(50),
preco decimal,
custo decimal, 
estoque int,	
primary key(id_produto)
);

create table pedidos(
id_pedido int not null auto_increment,
id_cliente int not null, 
data_pedido date, 
status varchar(20),
primary key(id_pedido)
);

create table itens_pedido(
id_item int not null,
id_pedido int not null,
id_produto int not null,
quantidade int,
preco_unitario decimal,
primary key(id_item)
);

create table pagamentos(
id_pagamento int,
id_pedido int not null,
forma_pagamento varchar(40),
status_pagamento varchar(20),
primary key(id_pagamento)
);

-- adicionando chaves estrangeiras
alter table produtos
add foreign key (id_categoria)
references categorias(id_categoria);

alter table pedidos
add foreign key(id_cliente)
references clientes(id_cliente);

alter table itens_pedido
add foreign key (id_pedido)
references pedidos(id_pedido),
add foreign key (id_produto)
references produtos(id_produto);

alter table pagamentos
add foreign key (id_pedido)
references pedidos(id_pedido);
