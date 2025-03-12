import React from 'react';
import { Product } from '../types';

interface ProductCardProps {
  product: Product;
}

// TODO: Implement the ProductCard component
// This component should:
// 1. Display product information (name, description, brand, price)
// 2. Display product variants
// 3. Show stock availability
// 4. Have a clean and user-friendly design

// Placeholder component (to be replaced by the candidate)
const ProductCard: React.FC<ProductCardProps> = ({ product }) => {
  return (
    <div>
      <h2>{product.name}</h2>
      <p>Implement the ProductCard component</p>
    </div>
  );
};

export default ProductCard; 