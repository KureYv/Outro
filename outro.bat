@echo off
set "file=song.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cls
set /a time=17
:timer
cls
echo Time before shutdown:%time%
ping localhost -n 2 >nul
set /a time=%time%-1
if %time%==0 (
goto timeup
)else goto :timer
:timeup
cls
echo Shutting down 
shutdown /s /f /t 0
pause


