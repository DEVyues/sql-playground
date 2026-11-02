-- BLOCO B

-- SELECT TOP 10 * FROM Production.Product;

-- Selecionando a DB.
USE AdventureWorks2025;

-- (Exercicio 7) Vendo quantos pedidos existem.
SELECT COUNT(*) AS TotalPedidos
FROM Sales.SalesOrderHeader;

-- (Exercicio 8) Vendo Faturamento total.
SELECT SUM(TotalDue) AS FaturamentoTotal
FROM Sales.SalesOrderHeader;

-- (Exercicio 9) Vendo ticket médio.
SELECT AVG(TotalDue) AS TicketMedio
FROM Sales.SalesOrderHeader;

-- (Exercicio 10) Vendo maior e menor pedido.
SELECT
	MAX(TotalDue) AS MaiorPedido,
	MIN(TotalDue) AS MenorPedido
FROM Sales.SalesOrderHeader;

-- (Exercicio 11) Vendo número de pedidos por ano.
SELECT 
	YEAR(OrderDate) AS Ano, 
	COUNT(*) AS TotalPedidos
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY Ano;

-- (Exercicio 12) Vendo faturamento por ano e mes em ordem cronológica.
SELECT
	YEAR(OrderDate) AS Ano,
	MONTH(OrderDate) AS Mes,
	SUM(TotalDue) AS Faturamento
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Ano, Mes;

-- (Exercicio 13) Comparando pedidos online e nao online, faturamento de cada grupo.
SELECT
	OnlineOrderFlag,
	COUNT(*) AS TotalPedidos,
	SUM(TotalDue) AS Faturamento
FROM Sales.SalesOrderHeader
GROUP BY OnlineOrderFlag;

-- (Exercicio 14) Vendo clientes com mais de 10 pedidos.
SELECT CustomerID, COUNT(*) AS TotalPedidos
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 10
ORDER BY TotalPedidos DESC;

-- (Exercicio 15) Quantos produtos existem por cor DESC.
SELECT Color, COUNT(*) AS TotalProdutos
FROM Production.Product
GROUP BY Color
ORDER BY TotalProdutos DESC;