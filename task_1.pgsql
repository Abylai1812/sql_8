CREATE FUNCTION get_low_stock_product()
RETURNS TABLE (
    product_name VARCHAR(255), 
    units_in_stock INTEGER
    ) 
AS $$
    SELECT product_name, units_in_stock
    FROM products
    JOIN order_details USING(product_id)
    WHERE units_in_stock < (SELECT MIN(avg_units)
                              FROM (SELECT AVG(quantity) as avg_units
                                    FROM order_details
                                    GROUP BY product_id) AS avg_subquery);
$$ LANGUAGE SQL;

SELECT get_low_stock_product();