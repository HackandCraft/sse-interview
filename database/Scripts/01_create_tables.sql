-- Create Categories table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categories')
BEGIN
    CREATE TABLE Categories (
        CategoryId INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(100) NOT NULL,
        Description NVARCHAR(500) NULL,
        CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedAt DATETIME NOT NULL DEFAULT GETDATE()
    );
    PRINT 'Categories table created successfully.';
END
GO

-- Create Verticals table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Verticals')
BEGIN
    CREATE TABLE Verticals (
        VerticalId INT PRIMARY KEY IDENTITY(1,1),
        CategoryId INT NOT NULL,
        Name NVARCHAR(100) NOT NULL,
        Description NVARCHAR(500) NULL,
        CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_Verticals_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
    );
    PRINT 'Verticals table created successfully.';
END
GO

-- Create Products table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductId INT PRIMARY KEY IDENTITY(1,1),
        VerticalId INT NOT NULL,
        Name NVARCHAR(200) NOT NULL,
        Description NVARCHAR(1000) NULL,
        Brand NVARCHAR(100) NULL,
        Price DECIMAL(10, 2) NOT NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_Products_Verticals FOREIGN KEY (VerticalId) REFERENCES Verticals(VerticalId)
    );
    PRINT 'Products table created successfully.';
END
GO

-- Create Variants table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Variants')
BEGIN
    CREATE TABLE Variants (
        VariantId INT PRIMARY KEY IDENTITY(1,1),
        ProductId INT NOT NULL,
        SKU NVARCHAR(50) NOT NULL,
        Color NVARCHAR(50) NULL,
        Size NVARCHAR(50) NULL,
        Weight DECIMAL(10, 2) NULL,
        Price DECIMAL(10, 2) NULL, -- NULL means use product price
        ImageUrl NVARCHAR(500) NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_Variants_Products FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
    );
    PRINT 'Variants table created successfully.';
END
GO

-- Create Shops table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Shops')
BEGIN
    CREATE TABLE Shops (
        ShopId INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(200) NOT NULL,
        Address NVARCHAR(500) NULL,
        City NVARCHAR(100) NULL,
        State NVARCHAR(100) NULL,
        Country NVARCHAR(100) NULL,
        PostalCode NVARCHAR(20) NULL,
        Phone NVARCHAR(20) NULL,
        Email NVARCHAR(100) NULL,
        IsActive BIT NOT NULL DEFAULT 1,
        CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedAt DATETIME NOT NULL DEFAULT GETDATE()
    );
    PRINT 'Shops table created successfully.';
END
GO

-- Create Stock table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Stock')
BEGIN
    CREATE TABLE Stock (
        StockId INT PRIMARY KEY IDENTITY(1,1),
        VariantId INT NOT NULL,
        ShopId INT NOT NULL,
        Quantity INT NOT NULL DEFAULT 0,
        LastUpdated DATETIME NOT NULL DEFAULT GETDATE(),
        CONSTRAINT FK_Stock_Variants FOREIGN KEY (VariantId) REFERENCES Variants(VariantId),
        CONSTRAINT FK_Stock_Shops FOREIGN KEY (ShopId) REFERENCES Shops(ShopId),
        CONSTRAINT UQ_Stock_VariantShop UNIQUE (VariantId, ShopId)
    );
    PRINT 'Stock table created successfully.';
END
GO

PRINT 'All tables created successfully.';
GO 