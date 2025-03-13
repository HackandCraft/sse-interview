-- Rename Verticals table to Subcategories
PRINT 'Renaming Verticals table to Subcategories...';

-- Step 1: Drop the foreign key constraint in Products table that references Verticals
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Products_Verticals')
BEGIN
    ALTER TABLE Products DROP CONSTRAINT FK_Products_Verticals;
    PRINT 'Dropped FK_Products_Verticals constraint.';
END

-- Step 2: Rename the VerticalId column in Products table to SubcategoryId
IF EXISTS (SELECT * FROM sys.columns WHERE name = 'VerticalId' AND object_id = OBJECT_ID('Products'))
BEGIN
    EXEC sp_rename 'Products.VerticalId', 'SubcategoryId', 'COLUMN';
    PRINT 'Renamed VerticalId column to SubcategoryId in Products table.';
END

-- Step 3: Rename the Verticals table to Subcategories
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Verticals')
BEGIN
    EXEC sp_rename 'Verticals', 'Subcategories';
    PRINT 'Renamed Verticals table to Subcategories.';
END

-- Step 4: Rename the primary key column in the Subcategories table
IF EXISTS (SELECT * FROM sys.columns WHERE name = 'VerticalId' AND object_id = OBJECT_ID('Subcategories'))
BEGIN
    EXEC sp_rename 'Subcategories.VerticalId', 'SubcategoryId', 'COLUMN';
    PRINT 'Renamed VerticalId column to SubcategoryId in Subcategories table.';
END

-- Step 5: Rename the foreign key constraint in Subcategories table
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Verticals_Categories')
BEGIN
    EXEC sp_rename 'FK_Verticals_Categories', 'FK_Subcategories_Categories', 'OBJECT';
    PRINT 'Renamed FK_Verticals_Categories constraint to FK_Subcategories_Categories.';
END

-- Step 6: Add back the foreign key constraint in Products table
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Products_Subcategories')
BEGIN
    ALTER TABLE Products ADD CONSTRAINT FK_Products_Subcategories 
    FOREIGN KEY (SubcategoryId) REFERENCES Subcategories(SubcategoryId);
    PRINT 'Added FK_Products_Subcategories constraint.';
END

PRINT 'Vertical to Subcategory migration completed successfully.';
GO 