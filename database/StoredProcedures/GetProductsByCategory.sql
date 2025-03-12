-- Create or alter the stored procedure for retrieving products by category
-- This is a template that candidates will need to implement
CREATE OR ALTER PROCEDURE GetProductsByCategory
    @CategoryId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- TODO: Implement the stored procedure to retrieve products with their variants
    -- filtered by the given category ID.
    -- The stored procedure should:
    -- 1. Join the necessary tables (Categories, Verticals, Products, Variants, Stock, Shops)
    -- 2. Filter products by the given category ID
    -- 3. Include information about stock availability
    -- 4. Return a result set that can be consumed by the API
    
    -- Example implementation (incomplete):
    
    SELECT 
        p.ProductId,
        p.Name AS ProductName,
        p.Description AS ProductDescription,
        p.Brand,
        p.Price AS BasePrice,
        v.VariantId,
        v.SKU,
        v.Color,
        v.Size,
        v.Price AS VariantPrice,
        v.ImageUrl,
        SUM(s.Quantity) AS TotalStock
    FROM 
        Categories c
        INNER JOIN Verticals vt ON c.CategoryId = vt.CategoryId
        INNER JOIN Products p ON vt.VerticalId = p.VerticalId
        INNER JOIN Variants v ON p.ProductId = v.ProductId
        LEFT JOIN Stock s ON v.VariantId = s.VariantId
    WHERE 
        c.CategoryId = @CategoryId
        AND p.IsActive = 1
        AND v.IsActive = 1
    GROUP BY
        p.ProductId,
        p.Name,
        p.Description,
        p.Brand,
        p.Price,
        v.VariantId,
        v.SKU,
        v.Color,
        v.Size,
        v.Price,
        v.ImageUrl
    ORDER BY 
        p.Name, 
        v.Color, 
        v.Size;
    
    -- Placeholder query (to be replaced by the candidate)
    --SELECT 'Implement the GetProductsByCategory stored procedure' AS Task;
END
GO

PRINT 'Stored procedure template created. Implement the GetProductsByCategory stored procedure.';
GO 