CREATE FUNCTION get_products()
RETURNS TABLE (
    product_name VARCHAR(255)
) AS $$
    SELECT DISTINCT product_name
    FROM products
    JOIN order_details USING(product_id)
    WHERE order_details.quantity = 10;
$$ LANGUAGE SQL;

SELECT get_products();