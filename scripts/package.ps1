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
    [string]$version
)

# Define the URL of the .jar file.
$url = "https://github.com/josef-dijon/minecraft-mod-updater/releases/latest/download/mod-updater.jar"

# Define the directory where the .jar file will be placed.
$directory = prism-profile/.minecraft

# Define the name of the jar file.
$jarFileName = "bootstrap.jar"

# Full path for the .jar file
$jarFilePath = Join-Path -Path $directory -ChildPath $jarFileName

# Download the .jar file
Invoke-WebRequest -Uri $url -OutFile $jarFilePath

# Define the output zip file name, including the version
$zipFileName = "Lunarkraft-$version.zip"

# Zip the directory
Compress-Archive -Path "$directory" -DestinationPath $zipFileName

# Output the location of the zip file
Write-Host "Package created at: $zipFileName"