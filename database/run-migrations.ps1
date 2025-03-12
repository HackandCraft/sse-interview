Write-Host "Running database migrations..." -ForegroundColor Cyan
dotnet run
Write-Host "Press any key to continue..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 