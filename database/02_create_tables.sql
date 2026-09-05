CREATE TABLE clientes(
id_cliente INT NOT NULL auto_increment,
nome VARCHAR(50) NOT NULL,
email VARCHAR(60) UNIQUE,
cidade VARCHAR(30) DEFAULT 'São Paulo' NOT NULL,
estado VARCHAR(30) DEFAULT 'SP' NOT NULL,
data_cadastro DATE,
PRIMARY KEY(id_cliente)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE categorias(
id_categoria INT NOT NULL auto_increment,
nome_categoria VARCHAR(50),
PRIMARY KEY(id_categoria)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE produtos(
id_produto INT NOT NULL,
id_categoria INT NOT NULL,
nome_produto VARCHAR(50),
preco DECIMAL(10,2),
custo DECIMAL(10,2), 
estoque INT,	
PRIMARY KEY(id_produto)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE pedidos(
id_pedido INT NOT NULL auto_increment,
id_cliente INT NOT NULL, 
data_pedido DATE, 
status VARCHAR(20),
PRIMARY KEY(id_pedido)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE itens_pedido(
id_item INT NOT NULL,
id_pedido INT NOT NULL,
id_produto INT NOT NULL,
quantidade INT,
preco_unitario DECIMAL(10,2),
PRIMARY KEY(id_item)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE pagamentos(
id_pagamento INT NOT NULL AUTO_INCREMENT,
id_pedido INT NOT NULL,
forma_pagamento VARCHAR(40),
status_pagamento VARCHAR(20),
PRIMARY KEY(id_pagamento)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

-- adicionando chaves estrangeiras
ALTER TABLE produtos
ADD CONSTRAINT fk_produtos_categoria
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;


ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_cliente
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itens_pedido_pedido
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
ADD CONSTRAINT fk_itens_pedido_produto
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
REFERENCES produtos(id_produto);

ALTER TABLE pagamentos
ADD CONSTRAINT fk_pagamentos_pedido
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
ADD CONSTRAINT uq_pagamentos_pedido
    UNIQUE (id_pedido);
