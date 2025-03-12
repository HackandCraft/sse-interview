// For more information see https://aka.ms/fsharp-console-apps
open System
open System.Reflection
open DbUp
open DbUp.Helpers
open DbUp.Engine

// Define the connection string
let connectionString = ""

// Main function to run the migrations
let runMigrations() =
    let scriptsUpgrader = 
        DeployChanges.To
            .SqlDatabase(connectionString)
            .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
            .WithScriptsFromFileSystem("Scripts")
            .LogToConsole()
            .Build()
    
    let storedProceduresUpgrader =
            DeployChanges.To.SqlDatabase(connectionString)
                .WithScriptsFromFileSystem("StoredProcedures")
                .WithTransactionPerScript()
                .WithExecutionTimeout(TimeSpan.FromMinutes(5.0))
                .JournalTo(NullJournal())
                .LogToConsole()
                .Build()
        
    let upgraders = [scriptsUpgrader; storedProceduresUpgrader]

    let rec runUpgrades (upgraders: DbUp.Engine.UpgradeEngine list) =
        match upgraders with
        | [] -> ()
        | upgrader :: remainingUpgraders ->
            let result = upgrader.PerformUpgrade()
            if not result.Successful then
                failwithf "Upgrade failed: %s" result.Error.Message
            else
                runUpgrades remainingUpgraders

    runUpgrades upgraders

    0

// Entry point
[<EntryPoint>]
let main argv =
    Console.WriteLine("Starting database migration...")
    
    try
        // Run the migrations
        runMigrations()
    with
    | ex -> 
        Console.ForegroundColor <- ConsoleColor.Red
        Console.WriteLine("An error occurred during migration:")
        Console.WriteLine(ex.Message)
        Console.ResetColor()
        -1 // Return -1 for error
