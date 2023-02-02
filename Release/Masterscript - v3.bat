@echo off
CLS
ECHO 1.German
ECHO 2.Japanese
ECHO 3.loop
ECHO 4.loop Multi
ECHO.
set Fuss="

set /p op=Type option:
if "%op%"=="1" goto German
if "%op%"=="2" goto Japan
if "%op%"=="3" goto looping
if "%op%"=="4" goto loopmulti

echo Please Pick an option:
goto begin

::Deutsches Script
:German
set /p Filepath=What File Directory would you like?
set /p File=What File Name would you like?
ffmpeg -i %Fuss%%Filepath%%File%%Fuss% -map 0 -map -0:a:1 -c copy %File%

goto :end

::Japanisches Script
:Japan
set /p Filepath=What File Directory would you like?
set /p File=What File Name would you like?
ffmpeg -i %Fuss%%Filepath%%File%%Fuss% -map 0 -map -0:a:0 -c copy %File%

goto :end

::Loop Part
:looping
set /p loopo=How many Episodes?
set /p Sprache=What Language is it? 1 For German;0 For Japanese

set /p Filepath=What File Directory would you like?
:loopo
set /p File=What File Name would you like?
ffmpeg -i %Fuss%%Filepath%%File%%Fuss% -map 0 -map -0:a:%Sprache% -c copy %File%
set /a loopo=loopo-1
if %loopo%==0 goto exitloopo
goto loopo
:exitloopo

goto :end

::Loop Multiple languages
:loopmulti
set /p loop=How many German Episodes?
set /p loopj=How many Japanese Episodes?
set /p Filepath=What File Directory would you like?
:loop
set /p File=What File Name would you like (German)?
ffmpeg -i %Fuss%%Filepath%%File%%Fuss% -map 0 -map -0:a:1 -c copy %File%
set /a loop=loop-1
if %loop%==0 goto exitloop
goto loop
:exitloop
if %loopj% GTR 0 goto loopj
goto :end

:loopj
set /p File=What File Name would you like (Japanese)?
ffmpeg -i %Fuss%%Filepath%%File%%Fuss% -map 0 -map -0:a:0 -c copy %File%
set /a loopj=loopj-1
if %loopj%==0 goto exitloops
goto loopj
:exitloops

goto :end

:end