# 📊 Projeto 01 — Análise de Vendas de um E-commerce (MarcStore)

## 🏢 Sobre a empresa

A **MarcStore** é uma empresa fictícia de comércio eletrônico especializada na venda de produtos de tecnologia, incluindo:

- Notebooks
- Celulares
- Monitores
- Teclados
- Mouses
- Headsets
- Webcams
- Acessórios
- Componentes de computador

A empresa possui dados de clientes, produtos e pedidos, mas ainda não conta com uma análise estruturada dos seus resultados de negócio.

## 🎯 Objetivo do projeto

Este projeto tem como objetivo atuar como Analista de Dados Júnior na MarcStore, utilizando **SQL** para explorar os dados da empresa e responder perguntas de negócio que apoiem a tomada de decisão. Todo o processo — desde a construção do banco de dados até a inserção dos dados e o desenvolvimento das consultas — foi realizado de forma independente, com foco em entender:

- Faturamento
- Comportamento dos clientes
- Desempenho dos produtos
- Desempenho das categorias
- Formas de pagamento
- Pedidos cancelados
- Lucratividade

## 🗂️ Modelagem do banco de dados

### Diagrama de Entidade e Relacionamento (DER)
![der](modelo_relacional/der.png)

## 🛠️ Tecnologias utilizadas

- **SQL** — modelagem, criação e consultas ao banco de dados
- **MySQL**  — sistema gerenciador de banco de dados
- **MySQL Workbench** — ferramenta de administração
- **dbdiagram.io** — criação do diagrama ER
- **Excel** - visualização do dataset

## 📁 Estrutura do repositório

```
├── README.md
├── database
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   └── 03_insert_into.sql
└── analysis/
    └── 01_general_analysis.sql
    └── 02_sales_analysis.sql
    └── 03_products_analysis.sql
    └── 04_customer_analysis.sql
├── images/
│   └── der.png
├── dataset/
│   └── dataset_ecommerce.xlsx
```

## 👩‍💻 Autora

Projeto desenvolvido como parte da transição de carreira para a área de Análise de Dados.
