To accurately count distinct groups when using `GROUP BY` and `COUNT(*)` in SQL, handle NULL values explicitly.  Instead of `COUNT(*)`, use `COUNT(category)` to count only non-NULL values of the 'category' column.  For handling implicit type conversions, always ensure explicit type casting for comparison and joins.

```sql
-- Correct query handling NULL values
SELECT category, COUNT(category) AS category_count
FROM products
GROUP BY category;
```

Alternatively, you can use `COUNT(DISTINCT category)` to get a count of unique categories, which would ignore NULL values as well.

For implicit type conversions:

```sql
--Explicit casting in joins and comparisons
SELECT * 
FROM table1 t1
JOIN table2 t2 ON t1.id::VARCHAR = t2.id::VARCHAR; --explicit casting to VARCHAR
```
This avoids implicit conversions and ensures the comparison happens on the same data type.