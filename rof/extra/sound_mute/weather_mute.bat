@echo off
setlocal enabledelayedexpansion
echo Are you sure you want to mute weather? Press Enter to continue or Ctrl+C to cancel.
pause > nul

if exist "..\..\sounds\rain_hvy_leaves_lp.wav" (
	for %%F in ("..\..\sounds\rain_hvy_leaves_lp.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "weather\original\" >nul 2>&1
		copy "..\..\sounds\rain_hvy_leaves_lp.wav" "weather\original\rain_hvy_leaves_lp.wav" /Y
	)
)
copy weather\rain_hvy_leaves_lp.wav ..\..\sounds\rain_hvy_leaves_lp.wav /Y

if exist "..\..\sounds\rain_wood_roof_lp.wav" (
	for %%F in ("..\..\sounds\rain_wood_roof_lp.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "weather\original\" >nul 2>&1
		copy "..\..\sounds\rain_wood_roof_lp.wav" "weather\original\rain_wood_roof_lp.wav" /Y
	)
)
copy weather\rain_wood_roof_lp.wav ..\..\sounds\rain_wood_roof_lp.wav /Y

if exist "..\..\sounds\rainloop.wav" (
	for %%F in ("..\..\sounds\rainloop.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "weather\original\" >nul 2>&1
		copy "..\..\sounds\rainloop.wav" "weather\original\rainloop.wav" /Y
	)
)
copy weather\rainloop.wav ..\..\sounds\rainloop.wav /Y

if exist "..\..\sounds\thunder1.wav" (
	for %%F in ("..\..\sounds\thunder1.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "weather\original\" >nul 2>&1
		copy "..\..\sounds\thunder1.wav" "weather\original\thunder1.wav" /Y
	)
)
copy weather\thunder1.wav ..\..\sounds\thunder1.wav /Y

if exist "..\..\sounds\thunder2.wav" (
	for %%F in ("..\..\sounds\thunder2.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "weather\original\" >nul 2>&1
		copy "..\..\sounds\thunder2.wav" "weather\original\thunder2.wav" /Y
	)
)
copy weather\thunder2.wav ..\..\sounds\thunder2.wav /Y
echo Completed. Review the output above for any errors.
pause > nul
