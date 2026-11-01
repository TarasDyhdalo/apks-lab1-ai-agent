@echo off
setlocal

if not exist ".venv\Scripts\python.exe" (
    py -3 -m venv .venv
    if errorlevel 1 exit /b %errorlevel%
)
.venv\Scripts\python.exe -m pip install -r requirements-dev.txt
if errorlevel 1 exit /b %errorlevel%
.venv\Scripts\python.exe -m pytest
if errorlevel 1 exit /b %errorlevel%
if not exist "build" mkdir build
.venv\Scripts\python.exe -m zipapp src/hello -o build/hello.pyz
if errorlevel 1 exit /b %errorlevel%
.venv\Scripts\python.exe build\hello.pyz
if errorlevel 1 exit /b %errorlevel%
