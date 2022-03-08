-- 1. The oldest business in the world

SELECT MIN(year_founded), MAX(year_founded)
	FROM Oldest_busuness..businesses

-- 2. How many businesses were founded before 1000?

SELECT COUNT(*)
    FROM Oldest_busuness..businesses
    WHERE year_founded < 1000;

-- 3. Which businesses were founded before 1000?

SELECT *
  FROM Oldest_busuness..businesses
  WHERE year_founded < 1000
  ORDER BY year_founded;

-- 4. Exploring the categories

SELECT bus.business, bus.year_founded, bus.country_code, cat.category
    FROM Oldest_busuness..businesses AS bus
    INNER JOIN Oldest_busuness..categories AS cat
        ON bus.category_code = cat.category_code
    WHERE year_founded < 1000
    ORDER BY year_founded;

-- 5. Counting the categories

SELECT TOP (10) cat.category, COUNT(cat.category) AS n
    FROM Oldest_busuness..businesses AS bus
    INNER JOIN Oldest_busuness..categories AS cat
        ON bus.category_code = cat.category_code
    GROUP BY cat.category
    ORDER BY n DESC;

-- 6. Oldest business by continent

SELECT MIN(bus.year_founded) as oldest, cnt.continent
    FROM Oldest_busuness..businesses AS bus
    INNER JOIN Oldest_busuness..countries as cnt
        ON bus.country_code = cnt.country_code
    GROUP BY continent
    ORDER BY oldest;

-- 7. Joining everything for further analysis

SELECT bus.business, bus.year_founded, cat.category, cnt.country, cnt.continent
    FROM Oldest_busuness..businesses AS bus
    INNER JOIN Oldest_busuness..categories as cat
        ON bus.category_code = cat.category_code
    INNER JOIN Oldest_busuness..countries as cnt
        ON bus.country_code = cnt.country_code;

-- 8. Counting categories by continent

SELECT cnt.continent, cat.category, COUNT(*) AS n
    FROM Oldest_busuness..businesses AS bus
    INNER JOIN Oldest_busuness..categories as cat
        ON bus.category_code = cat.category_code
    INNER JOIN Oldest_busuness..countries as cnt
        ON bus.country_code = cnt.country_code
    GROUP BY cnt.continent, cat.category;

-- 9. Filtering counts by continent and category

SELECT cnt.continent, cat.category, COUNT(*) AS n
    FROM Oldest_busuness..businesses AS bus
    INNER JOIN Oldest_busuness..categories as cat
        ON bus.category_code = cat.category_code
    INNER JOIN Oldest_busuness..countries as cnt
        ON bus.country_code = cnt.country_code
    GROUP BY cnt.continent, cat.category
    HAVING COUNT(*) > 5
    ORDER BY n DESC;


