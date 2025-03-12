namespace InterviewApi

module Routes =
    
    open Giraffe
    open InterviewApi.Handlers
    
    // TODO: Implement the API routes
    // This should include a route for the getProductsByCategoryHandler
    
    // Placeholder routes (to be replaced by the candidate)
    let webApp () =
        choose [
            GET >=> route "/" >=> text "Interview API - Implement the routes"
            setStatusCode 404 >=> text "Not Found"
        ] 