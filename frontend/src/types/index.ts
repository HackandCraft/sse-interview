// Product and variant types

export interface Variant {
  variantId: number;
  sku: string;
  color?: string;
  size?: string;
  price?: number;
  imageUrl?: string;
  stockQuantity: number;
}

export interface Product {
  productId: number;
  name: string;
  description?: string;
  brand?: string;
  basePrice: number;
  variants: Variant[];
}

// Category type
export interface Category {
  categoryId: number;
  name: string;
  description?: string;
} 