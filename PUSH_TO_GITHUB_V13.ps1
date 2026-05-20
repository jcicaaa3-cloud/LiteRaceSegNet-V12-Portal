$RepoUrl = "https://github.com/jcicaaa3-cloud/LiteRaceSegNet-V13-Portal.git"

Write-Host "Checking for forbidden files..."
$forbidden = Get-ChildItem -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {
  $_.Name -match "\.pem$|^\.env$|\.pth$|\.pt$|\.ckpt$|\.safetensors$|\.bin$"
}
if ($forbidden) {
  Write-Host "Forbidden files found. Remove them before upload:" -ForegroundColor Red
  $forbidden | Select-Object FullName
  exit 1
}

git init
git add .
git commit -m "Release LiteRaceSegNet V13 evidence portal"
git branch -M main
git remote remove origin 2>$null
git remote add origin $RepoUrl
git push -u origin main
