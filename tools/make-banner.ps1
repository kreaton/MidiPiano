# Takes the README banner (images/banner.png, 1280 x 640) from the running app's piano page with headless Edge.
# Start the app first:  dotnet run --project src/MidiPiano
# Then run with Windows PowerShell:  powershell -File tools\make-banner.ps1
param(
    [string]$Url = "http://localhost:5288/",
    [string]$Out = (Join-Path $PSScriptRoot "..\images\banner.png"),
    [string]$Edge = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
)

$Out = [System.IO.Path]::GetFullPath($Out)
New-Item -ItemType Directory -Force (Split-Path $Out) | Out-Null
$work = Join-Path ([System.IO.Path]::GetTempPath()) ("midipiano-banner-" + [guid]::NewGuid())
New-Item -ItemType Directory -Force $work | Out-Null

# virtual-time-budget gives the WebAssembly app time to start before the screenshot is taken.
& $Edge --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1280,640 `
    "--user-data-dir=$work\profile" --virtual-time-budget=20000 "--screenshot=$Out" $Url | Out-Null
for ($i = 0; $i -lt 50 -and -not (Test-Path $Out); $i++) { Start-Sleep -Milliseconds 200 }
Remove-Item -Recurse -Force $work -ErrorAction SilentlyContinue
if (-not (Test-Path $Out)) { throw "Edge did not take the screenshot - is the app running at $Url?" }
Write-Host "Wrote $Out"
