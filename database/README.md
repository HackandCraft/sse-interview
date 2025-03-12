# Database Setup

This folder contains the SQL scripts needed to set up the database for the interview project.

## Prerequisites

- SQL Server (2019 or later) or SQL Server Express
- SQL Server Management Studio (SSMS) or Azure Data Studio
- .NET 8.0 SDK or later (for the migration tool)

## Database Migration Tool

We've created an F# project that uses DbUp to run database migrations automatically. The tool:

1. Creates the database if it doesn't exist
2. Runs all SQL scripts in the correct order
3. Tracks which scripts have been run in a `SchemaVersions` table
4. Only runs scripts that haven't been executed before

### Configuration

The connection string is defined in `DbMigrations/DbMigrations/Program.fs`. By default, it uses:

```
Server=localhost;Database=InterviewDB;Trusted_Connection=True;
```

If you need to use SQL Server Authentication, modify the connection string:

```
let connectionString = "Server=localhost;Database=InterviewDB;User Id=YourUsername;Password=YourPassword;"
```

## Setup Instructions

### Option 1: Using the Database Migration Tool (Recommended)

1. Navigate to the `DbMigrations/DbMigrations` directory
2. Run the migration tool using one of the following methods:
   - Double-click the `run-migrations.bat` file
   - Run the PowerShell script: `.\run-migrations.ps1`
   - Or use the .NET CLI: `dotnet run`

This will create the database, tables, and run all the SQL scripts in the correct order.

### Option 2: Manual Setup

If you prefer to run the scripts manually:

1. Connect to your SQL Server instance using SSMS or Azure Data Studio.
2. Run the `01_create_tables.sql` script to create the necessary tables.
3. Run the `02_seed_data.sql` script to populate the tables with sample data.
4. Run the `03_create_stored_procedure.sql` script to create the stored procedure.

## SQL Scripts

The migration scripts are located in the `Scripts` directory:

- `01_create_tables.sql`: Creates the database tables
- `02_seed_data.sql`: Populates the tables with sample data
- `03_create_stored_procedure.sql`: Creates the stored procedure for retrieving products by category

## Adding New Migrations

To add a new migration:

1. Create a new SQL script in the `Scripts` directory
2. Name it with a prefix number to ensure correct ordering (e.g., `04_new_migration.sql`)
3. Run the migration tool to apply the new migration

## Database Schema

The database consists of the following tables:

- **Categories**: Product categories (e.g., Electronics, Clothing)
- **Verticals**: Sub-categories or verticals within categories (e.g., Smartphones, T-shirts)
- **Products**: Basic product information
- **Variants**: Product variants (e.g., different colors, sizes)
- **Stock**: Inventory information for each variant
- **Shops**: Store information where products are sold

### Entity Relationship Diagram

```
Categories 1──* Verticals 1──* Products 1──* Variants 1──* Stock *──1 Shops
```

## Task

Your task is to create a stored procedure named `GetProductsByCategory` that:

1. Accepts a category ID as a parameter
2. Returns products with their variants, filtered by the given category
3. Includes stock information for each variant
4. Joins with the necessary tables to provide a complete view of the products

You should write your solution in the `03_create_stored_procedure.sql` file.

## Connection String

Use the following connection string to connect to the database from the F# backend:

```
Server=localhost;Database=InterviewDB;Trusted_Connection=True;
```

If you're using SQL Server Authentication, modify the connection string accordingly:

```
Server=localhost;Database=InterviewDB;User Id=YourUsername;Password=YourPassword;
``` 