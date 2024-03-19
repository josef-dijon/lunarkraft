###############################################################################
# Copyright (c) 2024 Josef de Joanelli (josef@pixelrift.io)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
###############################################################################
#
# Usage:
# .\update_md5s.ps1 -manifestPath "C:\Path\To\Your\OriginalManifest.json"
#
param (
    [Parameter(Mandatory=$true)]
    [string]$manifestPath
)

# Assuming the rest of the variables are defined within the script or derived from the manifest path
$downloadDirectory = Join-Path -Path (Split-Path -Parent $manifestPath) -ChildPath "download-tmp"
$newManifestPath = Join-Path -Path (Split-Path -Parent $manifestPath) -ChildPath "manifest_with_md5.json"

# Read and parse the manifest file
$manifest = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json

# Ensure the download directory exists
if (-not (Test-Path -Path $downloadDirectory)) {
    New-Item -Path $downloadDirectory -ItemType Directory
}

# Function to calculate MD5 checksum for a file
function Get-MD5Checksum {
    param($filePath)
    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $fileContent = [System.IO.File]::ReadAllBytes($filePath)
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($fileContent)).Replace('-', '').ToLower()
    return $hash
}

# Iterate over each item in the manifest, download the file if not present, and calculate MD5
foreach ($item in $manifest) {
    $localFilePath = Join-Path -Path $downloadDirectory -ChildPath $item.filename.ToLower()

	Write-Host "Downloading $($item.name)..."
	Invoke-WebRequest -Uri $item.url -OutFile $localFilePath

    # Calculate MD5 checksum
    $md5Checksum = Get-MD5Checksum -filePath $localFilePath
    Write-Host "MD5 checksum for $($item.name): $md5Checksum"

    # Update the item with the MD5 checksum
    $item.md5 = $md5Checksum
}

# Convert the updated manifest back to JSON with indents for readability
$json = $manifest | ConvertTo-Json -Depth 10

# Save the updated manifest to a new file
$json | Out-File -FilePath $newManifestPath -Encoding utf8

Write-Host "New manifest with MD5 checksums has been saved to $newManifestPath"
