In SQL, a common but subtle error arises when using `COUNT(*)` in conjunction with `GROUP BY` while expecting a count of distinct groups.  If your `GROUP BY` clause includes columns with NULL values, `COUNT(*)` will still count the rows with NULL values in the grouping. This leads to an inflated count compared to what's intuitively expected for distinct groups.

```sql
-- Incorrect query leading to inflated count
SELECT category, COUNT(*) AS category_count
FROM products
GROUP BY category;
```

If some products have `NULL` in the `category` column, `COUNT(*)` will include these NULLs in the count for each category.

Another less obvious problem might be implicit type conversions during joins or comparisons. If you compare data types that are not exactly the same (e.g., comparing an INT to a VARCHAR without explicit casting), unexpected results can occur. SQL might silently perform implicit type conversions, which could lead to inaccurate or misleading comparisons leading to incorrect results.