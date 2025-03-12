namespace InterviewApi

module Handlers =
    
    open Microsoft.AspNetCore.Http
    open Giraffe
    open InterviewApi.Models
    open InterviewApi.Repositories
    open System
    
    // Helper functions
    
    let handleError (ex: Exception) =
        setStatusCode 500 >=> json {| error = ex.Message |}
    
    // TODO: Implement the getProductsByCategoryHandler function
    // This function should:
    // 1. Extract the categoryId from the route
    // 2. Call the getProductsByCategory repository function
    // 3. Return the results as JSON
    
    // Placeholder handler (to be replaced by the candidate)
    let getProductsByCategoryHandler (categoryId: int) : HttpHandler =
        fun (next: HttpFunc) (ctx: HttpContext) ->
            task {
                // TODO: Implement this handler
                return! json {| message = "Not implemented" |} next ctx
            } 