# F# Backend Project

This folder contains a boilerplate F# Giraffe API project with Dapper for database access.

## Prerequisites

- .NET 8.0 SDK or later
- Visual Studio 2022, Visual Studio Code, or Rider
- SQL Server (as set up in the database folder)

## Project Structure

- `InterviewApi.fsproj`: The F# project file
- `Program.fs`: The entry point for the application
- `Config.fs`: Configuration settings
- `Models.fs`: Domain models
- `Repositories.fs`: Data access layer
- `Handlers.fs`: HTTP request handlers
- `Routes.fs`: API route definitions

## Setup Instructions

1. Open a terminal in this directory
2. Run `dotnet restore` to restore dependencies
3. Run `dotnet build` to build the project
4. Run `dotnet run` to start the API server

The API will be available at `http://localhost:5000`.

## Task

Your task is to implement the following components:

1. **Repository Function**: Create a function in `Repositories.fs` that calls the `GetProductsByCategory` stored procedure using Dapper.

2. **Handler Function**: Create a handler in `Handlers.fs` that:
   - Accepts a category ID as a parameter
   - Calls the repository function
   - Returns the data as JSON

3. **Route Definition**: Add a route in `Routes.fs` that maps to your handler.

## Expected API Endpoint

The API should expose the following endpoint:

```
GET /api/products/category/{categoryId}
```

Where `{categoryId}` is the ID of the category to filter by.

## Example Response

The API should return a JSON response similar to:

```json
[
  {
    "productId": 1,
    "name": "Galaxy S23",
    "description": "Latest Samsung flagship smartphone",
    "brand": "Samsung",
    "basePrice": 999.99,
    "variants": [
      {
        "variantId": 1,
        "sku": "GS23-BLK-128",
        "color": "Black",
        "size": "128GB",
        "price": 999.99,
        "imageUrl": "https://example.com/images/galaxy-s23-black.jpg",
        "stockQuantity": 43
      },
      {
        "variantId": 2,
        "sku": "GS23-WHT-128",
        "color": "White",
        "size": "128GB",
        "price": 999.99,
        "imageUrl": "https://example.com/images/galaxy-s23-white.jpg",
        "stockQuantity": 34
      }
    ]
  }
]
```

## Evaluation Criteria

- Correct implementation of the repository function using Dapper
- Proper error handling
- Clean and maintainable code
- Appropriate use of F# features
- Correct API response format 