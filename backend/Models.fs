namespace InterviewApi

module Models =
    
    // Domain models
    
    [<CLIMutable>]
    type Variant = {
        VariantId: int
        Sku: string
        Color: string
        Size: string
        Price: decimal
        ImageUrl: string
        StockQuantity: int
    }
    
    [<CLIMutable>]
    type Product = {
        ProductId: int
        Name: string
        Description: string
        Brand: string
        BasePrice: decimal
        Variants: Variant list
    }
    
    // Database models (for Dapper)
    
    [<CLIMutable>]
    type ProductVariantDto = {
        ProductId: int
        ProductName: string
        ProductDescription: string
        Brand: string
        BasePrice: decimal
        VariantId: int
        SKU: string
        Color: string
        Size: string
        VariantPrice: decimal
        ImageUrl: string
        TotalStock: int
    }
    
    // Transformation functions
    
    let mapToVariant (dto: ProductVariantDto) : Variant =
        {
            VariantId = dto.VariantId
            Sku = dto.SKU
            Color = dto.Color
            Size = dto.Size
            Price = dto.VariantPrice
            ImageUrl = dto.ImageUrl
            StockQuantity = dto.TotalStock
        }
    
    let groupByProduct (dtos: ProductVariantDto list) : Product list =
        dtos
        |> List.groupBy (fun dto -> dto.ProductId)
        |> List.map (fun (productId, variants) ->
            let firstVariant = List.head variants
            {
                ProductId = productId
                Name = firstVariant.ProductName
                Description = firstVariant.ProductDescription
                Brand = firstVariant.Brand
                BasePrice = firstVariant.BasePrice
                Variants = variants |> List.map mapToVariant
            }
        ) 