@echo off

SET BLD_DIR=%CD%
cd /D "%RECIPE_DIR%\.."
FOR /F "delims=" %%i IN ('git describe --tags') DO set PANDAS_VERSION=%%i
echo.%PANDAS_VERSION% | %PYTHON% .\conda.recipe\version.py > %SRC_DIR%\__conda_version__.txt
%PYTHON% setup.py --quiet install
