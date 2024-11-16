@echo off
setlocal enabledelayedexpansion
echo Are you sure you want to unmute weather? Press Enter to continue or Ctrl+C to cancel.
pause > nul
del ..\..\sounds\rain_hvy_leaves_lp.wav

if exist "weather\original\rain_hvy_leaves_lp.wav" (
	copy "weather\original\rain_hvy_leaves_lp.wav" "..\..\sounds\rain_hvy_leaves_lp.wav" /Y
)
del ..\..\sounds\rain_wood_roof_lp.wav

if exist "weather\original\rain_wood_roof_lp.wav" (
	copy "weather\original\rain_wood_roof_lp.wav" "..\..\sounds\rain_wood_roof_lp.wav" /Y
)
del ..\..\sounds\rainloop.wav

if exist "weather\original\rainloop.wav" (
	copy "weather\original\rainloop.wav" "..\..\sounds\rainloop.wav" /Y
)
del ..\..\sounds\thunder1.wav

if exist "weather\original\thunder1.wav" (
	copy "weather\original\thunder1.wav" "..\..\sounds\thunder1.wav" /Y
)
del ..\..\sounds\thunder2.wav

if exist "weather\original\thunder2.wav" (
	copy "weather\original\thunder2.wav" "..\..\sounds\thunder2.wav" /Y
)
echo Completed. Review the output above for any errors.
pause > nul
