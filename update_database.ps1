# update_database.ps1
$ErrorActionPreference = "Stop"
$items = Get-ChildItem -Path "images" -Filter "*.jpg" | Where-Object Name -ne "header-image.jpg"
$lines = @()
foreach ($item in $items) {
    $name = $item.Name -replace '\.jpg$', '' -replace '[\u0600-\u06FF].*$', '' -replace '^[._\s-]+|[._\s-]+$', ''
    $name = $name.Trim()
    $kw = $name.ToLower() -replace '"', '\"'
    $img = "images/" + $item.Name
    $lines += "{name:`"$name`",image:`"$img`",keywords:`"$kw`"}"
}
$content = "const ARCHIVE = [" + "`r`n" + ($lines -join ",`r`n") + "`r`n];"
Set-Content -Path "data.js" -Value $content -Encoding UTF8
Write-Host "Database updated successfully with $($lines.Count) images!" -ForegroundColor Green
