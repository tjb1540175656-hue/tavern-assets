```bat
@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ROOT=C:\Users\15401.DESKTOP-6NAIB41\Downloads\tavern-assets"
set "UPSCALE=upscayl_png_digital-art-4x_2x"

echo ========================================
echo Tavern Assets Upscaled Image Replacer
echo ========================================
echo.
echo Root: %ROOT%
echo.

if not exist "%ROOT%\" (
    echo ERROR: Root directory does not exist.
    pause
    exit /b 1
)

set /a FOLDERS=0
set /a FILES=0
set /a ERRORS=0

for /d %%D in ("%ROOT%\*") do (

    if exist "%%D\%UPSCALE%\" (

        set /a FOLDERS+=1

        echo.
        echo ----------------------------------------
        echo Processing: %%~nxD
        echo ----------------------------------------

        for %%F in ("%%D\%UPSCALE%\*") do (

            if exist "%%F" (

                echo Moving: %%~nxF

                move /Y "%%F" "%%D\%%~nxF" >nul

                if errorlevel 1 (
                    echo [FAILED] %%~nxF
                    set /a ERRORS+=1
                ) else (
                    echo [OK] %%~nxF
                    set /a FILES+=1
                )
            )
        )

        rem Delete upscale directory only if it is empty
        dir /b "%%D\%UPSCALE%" 2>nul | findstr "^" >nul

        if errorlevel 1 (
            rd "%%D\%UPSCALE%"
            echo Removed empty upscale directory.
        ) else (
            echo WARNING: Upscale directory is not empty.
        )
    )
)

echo.
echo ========================================
echo Finished
echo ========================================
echo Character folders: %FOLDERS%
echo Files replaced:    %FILES%
echo Errors:            %ERRORS%
echo ========================================
echo.

pause
```
