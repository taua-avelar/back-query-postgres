CREATE DATABASE ecommerce;


CREATE TABLE produtos(
  id serial primary key,
  nome varchar(100),
  descricao text,
  preco int,
  quantidade_em_estoque int,
  categoria_id int REFERENCES categorias(id)
);

CREATE TABLE categorias (
  id serial primary key,
  nome varchar(50)
);
  
CREATE TABLE itens_do_pedido (
  id serial primary key,
  pedido_id int REFERENCES pedidos(id),
  quantidade int,
  produto_id int REFERENCES produtos(id)
);


CREATE TABLE pedidos (
  id serial primary key,
  valor int,
  cliente_cpf char(11) REFERENCES clientes(cpf),
  vendedor_cpf char(11) REFERENCES vendedores(cpf)
  );
  
  CREATE TABLE clientes (
    cpf char(11) UNIQUE,
    nome varchar(150)
    );
  
  CREATE TABLE vendedores (
    cpf char(11) UNIQUE,
    nome varchar(150)
    );


INSERT INTO categorias(nome)
VALUES  ('frutas'),
		('verduras'),
        ('massas'),
        ('bebidas'),
        ('utilidades');


INSERT INTO produtos(nome,
                     descricao,
                     preco, 
                     quantidade_em_estoque, 
                     categoria_id)
                     
VALUES 	('Mamão', 
        'Rico em vitamina A, potássio e vitamina C',
       	300,
        123,
        1
       )
       ('Maça',
        'Fonte de potássio e fibras.',
        90,
        34,
        1
       )
       ('Cebola',
        'Rico em quercetina, antocianinas, vitaminas do complexo B, C.',
        50,
        76,
        2
       )
       ('Abacate',
        'NÃO CONTÉM GLÚTEN.',
        150,
        64,
        1
       )
       ('Tomate',
        'Rico em vitaminas A, B e C',
        125,
        88,
        2
       ),
       ('Acelga',
        'NÃO CONTÉM GLÚTEN.',
        235,
        13,
        2
       ),
       ('Macarrão parafuso',
        'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais',
        690,
        5,
        3
       ),
       ('Massa para lasanha',
        'Uma reunião de família precisa ter comida boa e muita alegria.	',
        875,
        19,
        3
       ),
       ('Refrigerante coca cola lata',
        'Sabor original',
        350,
        189,
        4
       ),
       ('Refrigerante Pepsi 2l',
        'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.	',
        700,
        12,
        4
       ),
       ('Cerveja Heikeken 600ml',
        'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado	',
        1200,
        500,
        4
       ),
       ('Agua mineral sem gás',
        'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.	',
        130,
        478,
        4
       ),
       ('Vassoura',
        'Pigmento, matéria sintética e metal. ',
        2350,
        30,
        5
       ),
       ('Saco para lixo',
        'Reforçado para garantir mais segurança	',
        1340,
        90,
        5
       ),
       ('Escova dental',
        'Faça uma limpeza profunda com a tecnologia inovadora',
        1000,
        44,
        5
       ),
       ('Balde para lixo 50l',
        'Possui tampa e fabricado com material reciclado',
        2290,
        55,
        5
       ),
       ('Manga',
        'Rico em Vitamina A, potássio e vitamina C',
        198,
        176,
        1
       ),
       ('Uva',
        'NÃO CONTÉM GLÚTEN.	',
       	420,
        90,
        1
       );

INSERT INTO clientes (cpf, nome)
VALUES 	(80371350042, 'José Augusto Silva'),
		(67642869061, 'Antonio Oliveira'),
        (63193310034, 'Ana Rodrigues'),
        (75670505018, 'Maria da Conceição');
        
INSERT INTO vendedores (cpf, nome)
VALUES	(82539841031, 'Rodrigo Sampaio'),
		(23262546003, 'Beatriz Souza Santos'),
        (28007155023, 'Carlos Eduardo');


INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES	(9650, 80371350042, 28007155023);

INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(1, 1, 1);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 1;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(1, 1, 10);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 10;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(1, 6, 11);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 6 WHERE id = 11;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(1, 1, 15);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 15;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(1, 5, 2);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 1 WHERE id = 2;


INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES	(6460, 63193310034, 23262546003);

INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(2, 10, 17);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 10 WHERE id = 17;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(2, 3, 18);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 3 WHERE id = 18;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(2, 5, 1);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 5 WHERE id = 1;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(2, 10, 5);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 10 WHERE id = 5;


INSERT INTO itens_do_pedido(pedido_id, quantidade, produto_id)
VALUES	(2, 2, 6);
UPDATE produtos 
SET quantidade_em_estoque = quantidade_em_estoque - 2 WHERE id = 6;




SELECT produtos.nome, categorias.nome FROM produtos
LEFT JOIN categorias ON produtos.categoria_id = categorias.id;

SELECT id, valor, vendedores.nome AS vendedor, clientes.nome AS Cliente FROM pedidos 
LEFT JOIN vendedores ON pedidos.vendedor_cpf = vendedores.cpf
LEFT JOIN clientes ON pedidos.cliente_cpf = clientes.cpf;

SELECT categorias.nome, SUM(produtos.quantidade_em_estoque) FROM produtos
LEFT JOIN categorias ON produtos.categoria_id = categorias.id
GROUP BY categorias.nome;


SELECT produtos.nome, SUM(quantidade) FROM itens_do_pedido
LEFT JOIN produtos ON produtos.id = itens_do_pedido.produto_id
GROUP BY itens_do_pedido.id, produtos.id;

