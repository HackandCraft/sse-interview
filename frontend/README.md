# React Frontend Project

This folder contains a boilerplate React TypeScript application for the interview project.

## Prerequisites

- Node.js (v18 or later)
- npm or yarn

## Project Structure

- `src/`: Source code directory
  - `components/`: React components
  - `services/`: API services
  - `types/`: TypeScript type definitions
  - `pages/`: Page components
  - `App.tsx`: Main application component
  - `index.tsx`: Application entry point

## Setup Instructions

1. Open a terminal in this directory
2. Run `npm install` to install dependencies
3. Run `npm start` to start the development server

The application will be available at `http://localhost:3000`.

## Task

Your task is to implement a frontend application that:

1. Fetches product data from the F# backend API
2. Displays the products and their variants in a user-friendly way
3. Allows users to filter products by category

Specifically, you need to:

1. **Create an API Service**: Implement a service that fetches data from the backend API.

2. **Create a Products Page**: Create a page component that displays products and their variants.

3. **Implement Styling**: Style the application in a way that showcases the products effectively.

## API Endpoint

The backend API exposes the following endpoint:

```
GET http://localhost:5000/api/products/category/{categoryId}
```

Where `{categoryId}` is the ID of the category to filter by.

## Example API Response

The API returns a JSON response similar to:

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

- Correct implementation of the API service
- Clean and maintainable React components
- Appropriate use of TypeScript
- User-friendly UI/UX
- Proper error handling 