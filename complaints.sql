SELECT *
FROM complaints;

SELECT COUNT(*)
FROM complaints
WHERE YEAR(`Date received`) between 2012 and 2022;

SELECT Product, COUNT(*) as amount
FROM complaints
GROUP BY Product
ORDER BY amount DESC;

SELECT issue, COUNT(*) as amount
FROM complaints
WHERE product = 'Credit reporting or other personal consumer reports'
GROUP BY issue
ORDER BY amount DESC;

SELECT MAX(`Date received`), MIN(`Date received`)
FROM complaints ;

SELECT YEAR(`Date received`) as year, COUNT(*)
FROM complaints
WHERE YEAR(`Date received`) between 2012 and 2022
GROUP BY YEAR(`Date received`)
ORDER BY year;

SELECT Company, COUNT(*) as amount
FROM complaints
WHERE YEAR(`Date received`) between 2012 and 2022
GROUP BY Company
ORDER BY amount DESC;

SELECT MONTH(`Date received`) as month, COUNT(*) as total
FROM complaints
WHERE YEAR(`Date received`) between 2012 and 2022
GROUP BY month(`Date received`)
ORDER BY total DESC;

SELECT State, COUNT(*) as amount
FROM complaints
WHERE YEAR(`Date received`) between 2012 and 2022
GROUP BY State
ORDER BY amount DESC;

SELECT b.Company, b.prod, a.Product
FROM(
SELECT Company, MAX(prod) as prod
FROM (
SELECT Company, Product, count(Product) as prod
FROM complaints
WHERE YEAR(`Date received`) between 2012 and 2022
GROUP BY Company, Product) p
GROUP BY Company) b
LEFT JOIN (SELECT Company, Product, count(Product) as prod
FROM complaints
WHERE YEAR(`Date received`) between 2012 and 2022
GROUP BY Company, Product) a
On a.Company = b.Company
And a.prod = b.prod
order by prod DESC;

SELECT COUNT(DISTINCT Company)
FROM complaints;

SELECT *
FROM complaints
ORDER BY  `Company public response` DESC;

SELECT COUNT(*)
FROM complaints
WHERE `Company public response` = 'Company believes it acted appropriately as authorized by contract or law'
	AND YEAR(`Date received`) between 2012 and 2022

