@echo off

REM Move to the directory where this script is located
cd /d "%~dp0"

set BIB_FILE=references.bib

REM Check that the bib file exists
if not exist "%BIB_FILE%" (
    echo ERROR: %BIB_FILE% not found.
    echo Make sure Better BibTeX auto-export is saving to this folder.
    pause
    exit /b
)

REM Stage the bibliography file
git add "%BIB_FILE%"

REM Check if there are changes
git diff --cached --quiet
if %errorlevel%==0 (
    echo No bibliography changes to commit.
    pause
    exit /b
)

REM Commit and push
git commit -m "Update bibliography"
git push

echo Bibliography updated and pushed to GitHub.
pause