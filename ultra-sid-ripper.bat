@echo off
REM Ultra C64 SID Ripper by SkylarZYX (originally made by nicco1690 @ nicco1690.neocities.org)
REM JSIDPlay2 by kenchis
REM Released by XYZ Studio (xyzstudiogroup.net)
cls

:::      _______________________________
:::     |  _    _  _       _ _______ TM |
:::     | \ \  / / \ \   / / |___  |    |
:::     |  \ \/ /   \ \ / /     / /     |
:::     |  / /\ \    \   /     / /__    |
:::     | /_/  \_\    |_|     /_____|   |
:::     |                               |
:::     |                 S T U D I O   |
:::     |_______________________________|
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A 
echo Ultra C64 SID Ripper by SkylarZYX (originally made by nicco1690 @ nicco1690.neocities.org)
echo ver. 1.0a
echo JSIDPlay2 by kenchis
echo Released by XYZ Studio (xyzstudiogroup.net)
pause

cls

set /a bak=1

echo Enter SID filename (can also include a directory: D:\path\to\sidfile.sid or you can drag and drop it to the window)
set /p fna=
echo Enter filename to stream as (can also include a directory: D:\path\to\sidwave or drag and drop) (be sure to get rid of the file ext!)
set /p sna=
echo Enter the SID Model to use (opts: 6581, 8580, digi) (case sensitive)
set /p sid=
echo Enter how the WAVs should be exported as (options: "master" - exports all streamed channels mixed into one file or "stems" - exports singular streamed channels including a master wav file)
set /p exp=
echo Enter song run time (format: mm:ss.mm)
set /p sru=
echo Enter song fade out time (format: mm:ss.mm)
set /p fde=
IF %sid%==6581 (goto set6581)
IF %sid%==8580 (goto set8580)
IF %sid%==digi (goto setdigi)

:set6581
echo Enter filter to use (default: FilterAlankila6581R4AR_3789)
set /p flt=
echo Enter song number to use (1 is start, not 0)
set /p sno=
echo Enter sampling frequency (Default: MEDIUM, Possible Values: [VERY LOW, LOW, MEDIUM, HIGH])
set /p shz=
pause
IF %exp%==master (goto rec6581master)
IF %exp%==stems (goto rec6581stem)

:set8580
echo Enter filter to use (default: FilterTrurl8580R5_3691)
set /p flt=
echo Enter song number to use (1 is start, not 0)
set /p sno=
echo Enter sampling frequency (Default: MEDIUM, Possible Values: [VERY LOW, LOW, MEDIUM, HIGH])
set /p shz=
pause
IF %exp%==master (goto rec8580master)
IF %exp%==stems (goto rec8580stem)

:setdigi
echo Enter filter to use (default: FilterAlankila6581R4AR_3789)
set /p flt=
echo Enter song number to use (1 is start, not 0)
set /p sno=
echo Enter sampling frequency (Default: MEDIUM, Possible Values: [VERY LOW, LOW, MEDIUM, HIGH])
set /p shz=
pause
IF %exp%==master (goto recdigimaster)
IF %exp%==stems (goto recdigistem)

:rec6581master
cd /D %UserProfile%
IF EXIST jsidplay2.xml (rename "jsidplay2.xml" "jsidplay2.bak") else (set /a bak=0)

cd /D %~dp0
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 false -2 false -3 false -r "%sna%.wav" -o "%sno%" "%fna%"
goto complete

:rec6581stem
cd /D %UserProfile%
IF EXIST jsidplay2.xml (rename "jsidplay2.xml" "jsidplay2.bak") else (set /a bak=0)

cd /D %~dp0
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 false -2 true -3 true -r "%sna%_1.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 true -2 false -3 true -r "%sna%_2.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 true -2 true -3 false -r "%sna%_3.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 false -2 false -3 false -r "%sna%.wav" -o "%sno%" "%fna%"
goto complete

:rec8580master
cd /D %UserProfile%
IF EXIST jsidplay2.xml (rename "jsidplay2.xml" "jsidplay2.bak") else (set /a bak=0)

cd /D %~dp0
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS8580" --reSIDfpFilter8580 %flt% -1 false -2 false -3 false -r "%sna%.wav" -o "%sno%" "%fna%"
goto complete

:rec8580stem
cd /D %UserProfile%
IF EXIST jsidplay2.xml (rename "jsidplay2.xml" "jsidplay2.bak") else (set /a bak=0)

cd /D %~dp0
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS8580" --reSIDfpFilter8580 %flt% -1 false -2 true -3 true -r "%sna%_1.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS8580" --reSIDfpFilter8580 %flt% -1 true -2 false -3 true -r "%sna%_2.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS8580" --reSIDfpFilter8580 %flt% -1 true -2 true -3 false -r "%sna%_3.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS8580" --reSIDfpFilter8580 %flt% -1 false -2 false -3 false -r "%sna%.wav" -o "%sno%" "%fna%"
goto complete

:recdigimaster
cd /D %UserProfile%
IF EXIST jsidplay2.xml (rename "jsidplay2.xml" "jsidplay2.bak") else (set /a bak=0)

cd /D %~dp0
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 false -2 false -3 false -4 false -r "%sna%.wav" -o "%sno%" "%fna%"
goto complete

:recdigistem
cd /D %UserProfile%
IF EXIST jsidplay2.xml (rename "jsidplay2.xml" "jsidplay2.bak") else (set /a bak=0)

cd /D %~dp0
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 false -2 true -3 true -4 true -r "%sna%_1.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 true -2 false -3 true -4 true -r "%sna%_2.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 true -2 true -3 false -4 true -r "%sna%_3.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 true -2 true -3 true -4 false -r "%sna%_4.wav" -o "%sno%" "%fna%"
jsidplay2-console-4.6.exe -g "%sru%" --fadeOut %fde% -s true -a wav -f %shz% -m "MOS6581" --reSIDfpFilter6581 %flt% -1 false -2 false -3 false -4 false -r "%sna%.wav" -o "%sno%" "%fna%"
goto complete

:complete
cd /D %UserProfile%
del /f "jsidplay2.xml"
IF %bak%==1 (rename "jsidplay2.bak" "jsidplay2.xml") else (echo JSIDPlay2 Console XML has been deleted)
cls
echo The recording is now complete.
pause

rem --fadeOut: fadeout length
rem -s: play 1 track?
rem -a: audio format (anything other than soundcard records)
rem -m: force sid model (MOS6581 or MOS8580)
rem -1 through -4: mute sid voices 1 through 4?
rem -r: filename to record as
rem -o: song number
rem -f: sampling frequency in hz
rem --reSIDfpFilter6581: set 6581 filter
rem --reSIDfpFilter8580: set 8580 filter