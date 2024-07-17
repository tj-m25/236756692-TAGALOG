@echo off
setlocal EnableDelayedExpansion

:loop
echo.
echo Select a shape:
echo.
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
echo.

set /p "choice=Enter the number of the shape you want to calculate the area for (1-4): "

if "%choice%" == "1" goto circle
if "%choice%" == "2" goto triangle
if "%choice%" == "3" goto quadrilateral
if "%choice%" == "4" goto end

echo Invalid selection.
goto loop

:circle
set /p "radius=Enter the radius: "
set /a "area=(%radius%) * 3.14159
echo The area of the circle is: %area%
goto loop

:triangle
set /p "side1=Enter the length of side 1: "
set /p "side2=Enter the length of side 2: "
set /p "side3=Enter the length of side 3: "

set /a "s=(%side1% + %side2% + %side3%) / 2"
set /a "area=((%s% * (%s% - %side1%) * (%s% - %side2%) * (%s% - %side3%)) / 100) * 100 / 100"

echo The area of the triangle is: %area%

if "%side1%" == "%side2%" (
    if "%side1%" == "%side3%" (
        echo The triangle is equilateral.
    ) else (
        echo The triangle is isosceles.
    )
) else if "%side1%" == "%side3%" (
    echo The triangle is isosceles.
) else if "%side2%" == "%side3%" (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)
goto loop

:quadrilateral
set /p "length=Enter the length: "
set /p "width=Enter the width: "

set /a "area=%length% * %width%"

if "%length%" == "%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
echo The area of the quadrilateral is: %area%
goto loop

:end
pause