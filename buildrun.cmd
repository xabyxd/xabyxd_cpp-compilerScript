@echo off
REM Compilling tool for Windows
REM C/C++ using Mingw64 v15.1
REM Version: 1.2.0
REM Author: xabyxd (https://github.com/xabyxd)
REM License: Apache License 2.0
REM GCC version: 15.1.0

chcp 65001
cls

REM Enabling ANSI escape sequences
for /f "tokens=3" %%a in ('ver') do (
    if %%a GEQ 10 set ENABLE_ANSI=1
)

REM Function to enable ANSI escape sequences (ANSI required)
set ESC=[
set CLR_RESET=%ESC%0m
set CLR_GREEN=%ESC%32m
set CLR_RED=%ESC%31m
set CLR_YELLOW=%ESC%33m
set CLR_CYAN=%ESC%36m


REM Paths and files
set SOURCE_DIR=C:\Users\User\Documents\mc-serverManager\
set OUTPUT_DIR=C:\Users\User\Documents\mc-serverManager\builds\
set SOURCE_FILE=serverManager.cpp
set OUTPUT_FILE=serverManager.exe

REM Configuration for the compiler
set ERRORS=-fshow-column
set NO_HAT=-fno-diagnostics-show-caret
set DEBUG=-g
set ALLOW_WARNINGS=-Wall
set WARNINGS_AS_ERRORS=-pedantic-errors
set OPTIMIZATIONS=-O0
set NO_VALUE_FUNCTION=-Werror=return-type
set CODIFIC_IN=-finput-charset=utf-8
set CODIFIC_OUT=-fexec-charset=utf-8
set CPP_STANDARD=-std=c++17
set LINK_LIBRARIES=-Iinclude -lwininet -lpsapi -lws2_32 -lstdc++fs -static-libgcc -static-libstdc++ -static
REM Lib "-library to link" (for "lib" directory)
REM -lws2_32 -static-libgcc -static-libstdc++ -static (for static compile/include static libraries)

REM Command builder
REM Mingw64 v15.1 needs to be in the PATH or the full path must be specified
REM set COMPILER_COMMAND=C:\Mingw64-v15.1\bin\g++.exe ^
set COMPILER_COMMAND=g++ ^
    %ERRORS% ^
    %NO_HAT% ^
    %DEBUG% ^
    %SOURCE_DIR%%SOURCE_FILE% ^
    %ALLOW_WARNINGS% ^
    %WARNINGS_AS_ERRORS% ^
    %OPTIMIZATIONS% ^
    %NO_VALUE_FUNCTION% ^
    %CODIFIC_IN% ^
    %CODIFIC_OUT% ^
    %CPP_STANDARD% ^
    %LINK_LIBRARIES% ^
    -o "%OUTPUT_DIR%%OUTPUT_FILE%"

REM Compile the program
echo %CLR_CYAN%Compiling the program...%CLR_RESET%
%COMPILER_COMMAND%

REM Verify if the compilation was successful
if %errorlevel% equ 0 (
    echo.
    echo %CLR_YELLOW%Compilation successful.%CLR_RESET%
    echo.
    echo %CLR_GREEN%Running the program...%CLR_RESET%
    echo %CLR_YELLOW%-------------------------------------------------%CLR_RESET%
    echo.
    %OUTPUT_DIR%%OUTPUT_FILE%
) else (
    echo.
    echo %CLR_RED%Compilation error. Check the error messages.%CLR_RESET%
    echo.
    pause
    exit /b 1
)

REM Pause the execution of the script (optional)
echo.
echo Program execution finished.
pause
