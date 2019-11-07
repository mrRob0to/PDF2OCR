# PDF2OCR
PowerShell script that converts a non-OCR .pdf into an OCR .pdf

This will convert a non-OCR pdf into an OCR pdf, as well as keep the original file name, plus batch ready.

1. Converts a redenerable .pdf into .tiff files using imageMagick/GhostScript.
2. Runs tesseract OCR on the .tiff files for readable text.
3. Converts .tiff files back into .pdfs using tesseract.
4. Deletes .tiff files.


### Instructions
1. Download dependecies: imageMagick, GhostScript, Tesseract
2. Set file paths in convert.ps1 to where .pdfs will be located - NOTE: SCRIPT WILL CONVERT ALL .pdfs IN SET DIRECTORY.
3. Run convert.ps1 script.
