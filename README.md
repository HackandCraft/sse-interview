# Technical Interview Project

This repository contains a technical interview project designed to evaluate candidates' skills across multiple areas of software development. The interview is structured to take approximately 1.5 hours, with the first 10-15 minutes allocated for setup (cloning the repository, connecting to the database, etc.).

## Project Overview

The project simulates a simplified e-commerce system with the following components:

1. **Database**: A SQL Server database with tables for products, variants, categories, subcategories, stock, and shops.
2. **Backend**: An F# Giraffe API with Dapper for database access.
3. **Frontend**: A React TypeScript application.

## Interview Tasks

### Task 1: Database and SQL (20-25 minutes)

1. Review the provided database schema in the `database` folder.
2. Write a stored procedure that retrieves products with their variants, filtered by category.
3. The stored procedure should:
   - Accept a category ID as a parameter
   - Join the necessary tables to fetch product information along with their variants
   - Include information about stock availability
   - Return a result set that can be consumed by the API

### Task 2: Backend Development with F# (30-35 minutes)

1. Using the provided F# Giraffe boilerplate in the `backend` folder:
2. Create a new route that will expose the data from your stored procedure
3. Implement a handler function for this route
4. Create a repository function that calls your stored procedure using Dapper
5. Format the data appropriately for the frontend to consume
6. Ensure proper error handling and response status codes

### Task 3: Frontend Development with React (30-35 minutes)

1. Using the provided React TypeScript boilerplate in the `frontend` folder:
2. Create a page component to display the products and their variants
3. Implement a service to fetch data from the backend API
4. Display the products in a user-friendly way (styling is up to you)
5. Implement basic filtering or sorting functionality if time permits

## Evaluation Criteria

Candidates will be evaluated on:

1. **Code Quality**: Clean, readable, and maintainable code
2. **Technical Knowledge**: Understanding of SQL, F#, and React/TypeScript
3. **Problem-Solving**: Approach to solving the given tasks
4. **Communication**: Ability to explain decisions and thought processes
5. **Time Management**: Completing tasks within the allocated time

## Getting Started

Detailed setup instructions for each component are available in their respective folders:

- Database setup: [database/README.md](database/README.md)
- Backend setup: [backend/README.md](backend/README.md)
- Frontend setup: [frontend/README.md](frontend/README.md)

Good luck! 