# Generates the app / home-screen icons for MIDI Piano from art/icon.svg: four piano keys with the E key
# pressed and sound waves rising from it, on the app's dark blue. Microsoft Edge (headless) renders the SVG at 1024 px, and
# System.Drawing scales it to the other sizes. The picture sits inside the maskable safe zone, so the maskable
# icon is the same picture.
# Run with Windows PowerShell:  powershell -File tools\make-icons.ps1
param(
    [string]$OutDir = (Join-Path $PSScriptRoot "..\src\MidiPiano\wwwroot\icons"),
    [string]$Art = (Join-Path $PSScriptRoot "..\art\icon.svg"),
    [string]$Edge = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
)

Add-Type -AssemblyName System.Drawing
New-Item -ItemType Directory -Force $OutDir | Out-Null

# Render the SVG once at 1024 px in a page with nothing else on it.
$work = Join-Path ([System.IO.Path]::GetTempPath()) ("midipiano-icons-" + [guid]::NewGuid())
New-Item -ItemType Directory -Force $work | Out-Null
Copy-Item (Resolve-Path $Art) (Join-Path $work 'icon.svg')
Set-Content (Join-Path $work 'icon.html') '<!doctype html><html><body style="margin:0;overflow:hidden"><img src="icon.svg" width="1024" height="1024" style="display:block"></body></html>' -Encoding UTF8
$master = Join-Path $work 'icon-1024.png'
$page = ([System.Uri](Join-Path $work 'icon.html')).AbsoluteUri
& $Edge --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1024,1024 "--user-data-dir=$work\profile" "--screenshot=$master" $page | Out-Null
for ($i = 0; $i -lt 50 -and -not (Test-Path $master); $i++) { Start-Sleep -Milliseconds 200 }
if (-not (Test-Path $master)) { throw "Edge did not render $Art" }

$icon = [System.Drawing.Image]::FromFile($master)

function Save-Icon([int]$size, [string]$file) {
    $bmp = New-Object System.Drawing.Bitmap $size, $size
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = 'HighQualityBicubic'
    $g.PixelOffsetMode = 'HighQuality'
    $g.SmoothingMode = 'AntiAlias'
    # Tile-flip mode keeps the edge pixels from fading to transparent when scaling.
    $attr = New-Object System.Drawing.Imaging.ImageAttributes
    $attr.SetWrapMode([System.Drawing.Drawing2D.WrapMode]::TileFlipXY)
    $g.DrawImage($icon, (New-Object System.Drawing.Rectangle 0, 0, $size, $size), 0, 0, $icon.Width, $icon.Height, 'Pixel', $attr)
    $g.Dispose()
    $bmp.Save((Join-Path $OutDir $file), [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "  $file"
}

Write-Host "Writing icons to $OutDir"
Save-Icon 180  'apple-touch-icon.png'
Save-Icon 167  'apple-touch-icon-167.png'
Save-Icon 152  'apple-touch-icon-152.png'
Save-Icon 192  'icon-192.png'
Save-Icon 512  'icon-512.png'
Save-Icon 1024 'icon-1024.png'
Save-Icon 512  'icon-512-maskable.png'
Save-Icon 32   'favicon-32.png'
$icon.Dispose()
Remove-Item -Recurse -Force $work -ErrorAction SilentlyContinue

