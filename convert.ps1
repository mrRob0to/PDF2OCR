#Dependencies - imageMagick, GhostScript, tesseract


#Comment out the line below to see errors
$ErrorActionPreference= 'silentlycontinue'
$counter = 0;

#SET THIS FILEPATH 
$filepath = "C:\Users\user\Desktop\folder"
$filetype = "*.pdf"
$file_count = [System.IO.Directory]::GetFiles("$filepath", "$filetype").Count

#SET THIS FILEPATH
Set-Location 'C:\Users\user\Desktop\folder'



Get-ChildItem -Filter '*.pdf' | ForEach-Object {
  
    Write-Host "Currently Mogrifying..."
    mogrify -density 300 -depth 8 -background white -alpha Off -format tiff $_.FullName
    Write-Host "Done Mogrifying"

        Get-ChildItem -Filter '*.tif' | ForEach-Object {
        Write-Host "Converting PDF file..."
        & 'C:\Program Files\Tesseract-OCR\tesseract.exe' -l eng $_.Name ($_.BaseName) pdf;
        Write-Host "Deleting .tiff"
        Remove-Item -Path $_.FullName
        $counter++;
        Write-Host "Finished Converting PDF file: $counter/$file_count" -ForegroundColor Yellow -BackgroundColor DarkGreen;
        }

   
}


echo "`nAll done :)"

write-host "Press any key to continue..."
[void][System.Console]::ReadKey($true)


