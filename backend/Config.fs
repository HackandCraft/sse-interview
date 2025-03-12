namespace InterviewApi

module Config =
    
    open System
    open Microsoft.Extensions.Configuration
    
    // Configuration settings
    type AppSettings = {
        ConnectionString: string
    }
    
    // Get configuration from appsettings.json or environment variables
    let getConfiguration () =
        let builder = ConfigurationBuilder()
                        .AddJsonFile("appsettings.json", optional = true)
                        .AddEnvironmentVariables()
        builder.Build()
    
    // Get connection string from configuration
    let getConnectionString (configuration: IConfiguration) =
        let connectionString = configuration.GetConnectionString("DefaultConnection")
        if String.IsNullOrEmpty connectionString then
            // Fallback connection string
            "Server=localhost;Database=InterviewDB;Trusted_Connection=True;"
        else
            connectionString
    
    // Get application settings
    let getAppSettings () =
        let configuration = getConfiguration()
        {
            ConnectionString = getConnectionString configuration
        } 