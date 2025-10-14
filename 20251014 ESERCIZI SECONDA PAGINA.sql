SHOW TABLES
describe dimProduct;
TABLE dimproduct;
describe dimproduct;

#Esplora la tabelle dei prodotti DimProduct) SELECT * FROM DimProduct 
SELECT ProductKey,
ProductAlternateKey,
EnglishProductName,
Color,
FinishedGoodsFlag,
StandardCost
FROM dimproduct;

#2. Esplora la tabelle dei prodotti DimProduct) SELECT * FROM DimProduct 
select *
from dimproduct;

#3. Interroga la tabella dei prodotti DimProduct) ed esponi in output i campi ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag. 
#Il result set deve essere parlante per cui assegna un alias se lo ritieni opportuno
SELECT 
    ProductKey AS 'ID Prodotto',
    ProductAlternateKey AS 'Codice Alternativo',
    EnglishProductName AS 'Nome Prodotto',
    Color AS 'Colore',
    FinishedGoodsFlag AS 'Prodotto Finito',
    StandardCost AS 'Costo Standard'
FROM 
    dimproduct;
#4. Esponi, interrogando la tabella degli impiegati aziendali, lʼelenco dei soli agenti. Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1. 
SELECT productKey,
ProductAlternateKey,
EnglishProductName,
Color,
FinishedGoodsFlag,
StandardCost
FROM dimproduct
WHERE 
    FinishedGoodsFlag = 1;
    
#5. Interroga la tabella delle vendite FactResellerSales). Esponi in output lʼelenco delle transazioni registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. 
#Calcola per ciascuna transazione il profitto SalesAmount - TotalProductCost).

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    StandardCost,
    ListPrice
FROM
    dimproduct
WHERE
    ProductAlternateKey LIKE 'FR%'
        OR ProductAlternateKey LIKE 'BK%';
	
#Esplora la tabella degli impiegati aziendali DimEmployee) 
SELECT 
    *
FROM
    dimemployee;

#2.2 2.. Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti 
#finiti il cui prezzo di listino è compreso tra 1000 e 2000. 

#1. Esercizio Schema concettuale Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dallʼazienda ListPrice - StandardCost) 

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    StandardCost,
    ListPrice,
    ListPrice-StandardCost AS MARKUP
FROM
    dimproduct
WHERE
    (ProductAlternateKey LIKE 'FR%'
        OR ProductAlternateKey LIKE 'BK%');
-- AND ListPrice-StandardCost IS NULL; 
# 2.. Scrivi unʼaltra query al fine di esporre lʼelenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000. 

SELECT
	ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    ListPrice,
    StandardCost,
    ListPrice - StandardCost as MARKUP
    FROM
    dimproduct
WHERE 
	FinishedGoodsFlag = 1
AND
    ListPrice between 1000 and 2000
order by ListPrice;

#3. Esplora la tabella degli impiegati aziendali DimEmployee) 

SELECT *
FROM 
	dimemployee;
#4. Esponi, interrogando la tabella degli impiegati aziendali, lʼelenco dei soli agenti. 
#Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1. 

SELECT 
		EmployeeKey,
        LastName,
        FirstName,
        Title,
        DepartmentName,
        Position,
        SalesPersonFlag
	
FROM 
	dimemployee
where DepartmentName = 'Sales';

select distinct
		departmentname
from
	dimemployee;

#5. Interroga la tabella delle vendite FactResellerSales).
# Esponi in output lʼelenco delle transazioni registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. 
#Calcola per ciascuna transazione il profitto SalesAmount - TotalProductCost).

SELECT *
FROM factresellersales;

SELECT
	SalesOrderNumber,
    SalesOrderLineNumber,
    OrderDate,
    ProductKey,
    OrderQuantity,
    SalesAmount,
    TotalProductCost,
    SalesAmount - TotalProductCost AS 'Profitto'
	
FROM 
	factresellersales
WHERE 
	ProductKey IN (597, 598, 477, 214)
AND 
	OrderDate>='2020-01-01';
	
	
