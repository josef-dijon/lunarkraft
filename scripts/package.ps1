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

param(
	[Parameter(Mandatory=$true)]
    [string]$version
)

# Define the URL of the .jar file.
$url = "https://github.com/josef-dijon/minecraft-mod-updater/releases/latest/download/mod-updater.jar"

# Download the .jar file
Invoke-WebRequest -Uri $url -OutFile "prism-profile-windows/.minecraft/bootstrap.jar"
Invoke-WebRequest -Uri $url -OutFile "prism-profile-linux/.minecraft/bootstrap.jar"

# Define the output zip file name, including the version
$zipFileNameWindows = "Lunarkraft-windows-$version.zip"
$zipFileNameLinux = "Lunarkraft-linux-$version.zip"

# Zip the directory
Compress-Archive -Force -Path "prism-profile-windows/*" -DestinationPath $zipFileNameWindows
Compress-Archive -Force -Path "prism-profile-linux/*" -DestinationPath $zipFileNameLinux

# Output the location of the zip file
Write-Host "Package created at: $zipFileNameWindows"
Write-Host "Package created at: $zipFileNameLinux"