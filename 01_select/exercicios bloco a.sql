-- BLOCO A

-- SELECT TOP 10 * FROM Production.Product;

-- Selecionando a DB.
USE AdventureWorks2025;

-- (Exercicio 1) Listando nome e sobrenome, ordenado por sobrenome.
SELECT TOP 20 FirstName, LastName
FROM Person.Person
ORDER BY LastName;

-- (Exercicio 2) Listando nome e preco da lista de produtos acima de U$1000, do mais caro para o mais barato. 
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000
ORDER BY ListPrice DESC;

-- (Exercicio 3) Listando os produtos de cor red e black.
SELECT Color
FROM Production.Product
WHERE Color IN ('Red', 'Black');

-- (Exercicio 4) Listando produtos que o nome comeca com Mountain.
SELECT Name
FROM Production.Product
WHERE Name LIKE 'Mountain%';

-- (Exercicio 5) Listando quantas cores diferentes existem na tabela produtos.
SELECT COUNT(DISTINCT Color) AS QtdCores
FROM Production.Product;

-- (Exercicio 6) Listando produtos que nao tem cor.
SELECT Name, Color
FROM Production.Product
WHERE Color IS NULL;

