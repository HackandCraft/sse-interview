namespace InterviewApi

module Program =
    
    open System
    open Microsoft.AspNetCore.Builder
    open Microsoft.AspNetCore.Cors.Infrastructure
    open Microsoft.AspNetCore.Hosting
    open Microsoft.Extensions.Hosting
    open Microsoft.Extensions.Logging
    open Microsoft.Extensions.DependencyInjection
    open Giraffe
    open InterviewApi.Routes
    
    // Configure CORS
    let configureCors (builder: CorsPolicyBuilder) =
        builder
            .WithOrigins("http://localhost:3000")
            .AllowAnyMethod()
            .AllowAnyHeader()
            |> ignore
    
    // Configure services
    let configureServices (services: IServiceCollection) =
        services.AddCors()
                .AddGiraffe() |> ignore
    
    // Configure app
    let configureApp (app: IApplicationBuilder) =
        app.UseCors(configureCors)
           .UseGiraffe(webApp())
    
    // Configure logging
    let configureLogging (builder: ILoggingBuilder) =
        builder.AddConsole()
               .AddDebug() |> ignore
    
    [<EntryPoint>]
    let main args =
        Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(
                fun webHostBuilder ->
                    webHostBuilder
                        .Configure(configureApp)
                        .ConfigureServices(configureServices)
                        .ConfigureLogging(configureLogging)
                        |> ignore)
            .Build()
            .Run()
        0 