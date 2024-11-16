@echo off
setlocal enabledelayedexpansion
echo Are you sure you want to unmute bangs? Press Enter to continue or Ctrl+C to cancel.
pause > nul
del ..\..\sounds\boulder_hit.wav

if exist "bangs\original\boulder_hit.wav" (
	copy "bangs\original\boulder_hit.wav" "..\..\sounds\boulder_hit.wav" /Y
)
del ..\..\sounds\lava_hiss.wav

if exist "bangs\original\lava_hiss.wav" (
	copy "bangs\original\lava_hiss.wav" "..\..\sounds\lava_hiss.wav" /Y
)
del ..\..\sounds\rock_cave_fall01.wav

if exist "bangs\original\rock_cave_fall01.wav" (
	copy "bangs\original\rock_cave_fall01.wav" "..\..\sounds\rock_cave_fall01.wav" /Y
)
del ..\..\sounds\rock_cave_fall02.wav

if exist "bangs\original\rock_cave_fall02.wav" (
	copy "bangs\original\rock_cave_fall02.wav" "..\..\sounds\rock_cave_fall02.wav" /Y
)
del ..\..\sounds\rock_cave_fall03.wav

if exist "bangs\original\rock_cave_fall03.wav" (
	copy "bangs\original\rock_cave_fall03.wav" "..\..\sounds\rock_cave_fall03.wav" /Y
)
del ..\..\sounds\stomp_01.wav

if exist "bangs\original\stomp_01.wav" (
	copy "bangs\original\stomp_01.wav" "..\..\sounds\stomp_01.wav" /Y
)
del ..\..\sounds\stomp_02.wav

if exist "bangs\original\stomp_02.wav" (
	copy "bangs\original\stomp_02.wav" "..\..\sounds\stomp_02.wav" /Y
)
del ..\..\sounds\thunder_rolling.wav

if exist "bangs\original\thunder_rolling.wav" (
	copy "bangs\original\thunder_rolling.wav" "..\..\sounds\thunder_rolling.wav" /Y
)
echo Completed. Review the output above for any errors.
pause > nul
