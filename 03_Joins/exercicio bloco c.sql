USE AdventureWorks2025;

-- (Exercicio 16) Listando nome e email de de 50 pessoas.
SELECT TOP 50
	CONCAT(p.FirstName, ' ', p.LastName) AS NomeComleto,
	e.EmailAddress
FROM Person.Person AS p
INNER JOIN Person.EmailAddress AS e
	ON p.BusinessEntityID = e.BusinessEntityID;

-- (Exercicio 17) Listando produtos com o nome da subcategoria.
SELECT
	p.Name AS Produto,
	sub.Name AS Subcategoria
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS sub
	ON p.ProductSubcategoryID = sub.ProductSubcategoryID;

-- (Exercicio 18) Listando Nome, Categoria e Subcategoria.
-- Primeiro exemplo com Inner Join.
SELECT
	p.Name AS Produto,
	s.Name AS Subcategoria,
	c.Name AS Categoria
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS s
	ON p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS c
	ON s.ProductCategoryID = c.ProductCategoryID;

-- Segundo exemplo com com Left Join.
SELECT
	p.Name AS Produto,
	s.Name AS Subcategoria,
	c.Name AS Categoria
FROM Production.Product AS p
LEFT JOIN Production.ProductSubcategory AS s
	ON p.ProductSubcategoryID = s.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS c
	ON s.ProductCategoryID = c.ProductCategoryID;

-- (Exercicio 19) Vendo itens do pedido 43659 (Nome do produto, quantidade, preco unitário e total).
SELECT
    d.SalesOrderID,
    p.Name AS Produto,
    d.OrderQty AS Quantidade,
    d.UnitPrice AS PrecoUnitario,
    d.LineTotal AS TotalLinha
FROM Sales.SalesOrderDetail AS d
INNER JOIN Production.Product AS p
    ON d.ProductID = p.ProductID
WHERE d.SalesOrderID = 43659;

-- (Exercicio 20) Qual o faturamento por categoria de produto.
SELECT
    c.Name AS Categoria,
    SUM(d.LineTotal) AS Faturamento
FROM Sales.SalesOrderDetail AS d
INNER JOIN Production.Product AS p
    ON d.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS c
    ON s.ProductCategoryID = c.ProductCategoryID
GROUP BY c.Name
ORDER BY Faturamento DESC;

-- (Exercicio 21) Produtos mais vendidos em quantidade.
SELECT TOP 10
	p.Name AS Produto,
	SUM(d.OrderQty) AS Quantidade
FROM Sales.SalesOrderDetail AS d
INNER JOIN Production.Product AS p
    ON d.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY Quantidade DESC;

-- (Exercicio 22) Listando pedidos com nome dos clientes.
SELECT TOP 50
	h.SalesOrderID,
	h.OrderDate,
	CONCAT(p.FirstName, ' ', p.LastName) AS Cliente,
	h.TotalDue
FROM Sales.SalesOrderHeader AS h
INNER JOIN Sales.Customer AS c
	ON h.CustomerID = c.CustomerID
LEFT JOIN Person.Person AS p
	ON c.PersonID = p.BusinessEntityID;

-- (Exercicio 23) Qual o faturamento por território.
SELECT
    t.Name AS Territorio,
    SUM(h.TotalDue) AS Faturamento
FROM Sales.SalesOrderHeader AS h
INNER JOIN Sales.SalesTerritory AS t
    ON h.TerritoryID = t.TerritoryID
GROUP BY t.Name
ORDER BY Faturamento DESC;

-- (Exercicio 24) Produtos que nunca foram vendidos.
SELECT 
	p.Name AS Produto
FROM Production.Product AS p
LEFT JOIN Sales.SalesOrderDetail AS d
    ON p.ProductID = d.ProductID
WHERE d.ProductID IS NULL;

-- (Exercicio 25) Clientes que nunca fizeram pedidos.
SELECT 
	c.CustomerID
FROM Sales.Customer AS c
LEFT JOIN Sales.SalesOrderHeader AS h
    ON c.CustomerID = h.CustomerID
WHERE h.SalesOrderID IS NULL;