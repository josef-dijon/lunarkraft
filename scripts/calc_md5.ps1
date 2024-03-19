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
# .\calc_md5s.ps1 -manifestPath "C:\Path\To\Your\file.jar"
#
param (
    [Parameter(Mandatory=$true)]
    [string]$path
)

# Function to calculate MD5 checksum for a file
function Get-MD5Checksum {
    param($filePath)
    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $fileContent = [System.IO.File]::ReadAllBytes($filePath)
    $hash = [System.BitConverter]::ToString($md5.ComputeHash($fileContent)).Replace('-', '').ToLower()
    return $hash
}

$md5Checksum = Get-MD5Checksum -filePath $path
Write-Host "MD5 checksum for $($item.name): $md5Checksum"
