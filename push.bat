@echo off
setlocal

set "MSG=%~1"
if "%MSG%"=="" set "MSG=Update %date% %time%"

cd /d "%~dp0"

echo Staging files...
git add -A

git diff --cached --quiet
if %errorlevel%==0 (
    echo No changes to commit.
) else (
    git commit -m "%MSG%"
    echo Committed: %MSG%
)

echo Checking connection to GitHub...
git ls-remote origin >nul 2>&1
if %errorlevel%==0 (
    echo Online - pushing...
    git push origin main
    echo Done. Pushed to GitHub.
) else (
    echo No connection to GitHub right now.
    echo Your work is safely committed locally.
    echo Run push.bat again once you're back online to push it up.
)

endlocal
