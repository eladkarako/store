@echo off
::move all the images to a temporary-folder, compress them to a single-zip file with password "1".
chcp 65001 2>nul >nul

if not exist *.jpg ( goto END )

::new folder
set "D=%DATE%"
set "T=%TIME%"
set "YEAR=%D:~-4,4%"
set "MONTH=%D:~-10,2%"
set "DAY=%D:~-7,2%"
set "HOURS=%T:~0,2%"
set "MINUTES=%T:~3,2%"
set "SECONDS=%T:~6,2%"
set "TIMESTAMP=%YEAR%%MONTH%%DAY%_%HOURS%%MINUTES%%SECONDS%"
set "FOLDERNAME=%~dp0%TIMESTAMP%"
del   /q /s /f "%FOLDERNAME%\"  1>nul 2>nul
del   /q /s /f "%FOLDERNAME%"   1>nul 2>nul
rmdir /q /q    "%FOLDERNAME%"   1>nul 2>nul
mkdir "%FOLDERNAME%"

move /y "%~dp0*.jpg" "%FOLDERNAME%\"

call "%~dp0resources\zip.exe" "-rjmq9e" "-P" "1" "%TIMESTAMP%.zip"  "%TIMESTAMP%"

del   /q /s /f "%FOLDERNAME%\"  1>nul 2>nul
del   /q /s /f "%FOLDERNAME%"   1>nul 2>nul
rmdir /q /q    "%FOLDERNAME%"   1>nul 2>nul

::sync with github. this must be done from a repository.
call "git" "add" "%TIMESTAMP%.zip"
call "git" "commit" "-m" "u"
call "git" "push" "origin" "_store1_"


:END
  exit /b 0