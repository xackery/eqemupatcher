@echo off
setlocal enabledelayedexpansion
echo Are you sure you want to mute bangs? Press Enter to continue or Ctrl+C to cancel.
pause > nul

if exist "..\..\sounds\boulder_hit.wav" (
	for %%F in ("..\..\sounds\boulder_hit.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\boulder_hit.wav" "bangs\original\boulder_hit.wav" /Y
	)
)
copy bangs\boulder_hit.wav ..\..\sounds\boulder_hit.wav /Y

if exist "..\..\sounds\lava_hiss.wav" (
	for %%F in ("..\..\sounds\lava_hiss.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\lava_hiss.wav" "bangs\original\lava_hiss.wav" /Y
	)
)
copy bangs\lava_hiss.wav ..\..\sounds\lava_hiss.wav /Y

if exist "..\..\sounds\rock_cave_fall01.wav" (
	for %%F in ("..\..\sounds\rock_cave_fall01.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\rock_cave_fall01.wav" "bangs\original\rock_cave_fall01.wav" /Y
	)
)
copy bangs\rock_cave_fall01.wav ..\..\sounds\rock_cave_fall01.wav /Y

if exist "..\..\sounds\rock_cave_fall02.wav" (
	for %%F in ("..\..\sounds\rock_cave_fall02.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\rock_cave_fall02.wav" "bangs\original\rock_cave_fall02.wav" /Y
	)
)
copy bangs\rock_cave_fall02.wav ..\..\sounds\rock_cave_fall02.wav /Y

if exist "..\..\sounds\rock_cave_fall03.wav" (
	for %%F in ("..\..\sounds\rock_cave_fall03.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\rock_cave_fall03.wav" "bangs\original\rock_cave_fall03.wav" /Y
	)
)
copy bangs\rock_cave_fall03.wav ..\..\sounds\rock_cave_fall03.wav /Y

if exist "..\..\sounds\stomp_01.wav" (
	for %%F in ("..\..\sounds\stomp_01.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\stomp_01.wav" "bangs\original\stomp_01.wav" /Y
	)
)
copy bangs\stomp_01.wav ..\..\sounds\stomp_01.wav /Y

if exist "..\..\sounds\stomp_02.wav" (
	for %%F in ("..\..\sounds\stomp_02.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\stomp_02.wav" "bangs\original\stomp_02.wav" /Y
	)
)
copy bangs\stomp_02.wav ..\..\sounds\stomp_02.wav /Y

if exist "..\..\sounds\thunder_rolling.wav" (
	for %%F in ("..\..\sounds\thunder_rolling.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "bangs\original\" >nul 2>&1
		copy "..\..\sounds\thunder_rolling.wav" "bangs\original\thunder_rolling.wav" /Y
	)
)
copy bangs\thunder_rolling.wav ..\..\sounds\thunder_rolling.wav /Y
echo Completed. Review the output above for any errors.
pause > nul
