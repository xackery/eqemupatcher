@echo off
setlocal enabledelayedexpansion
echo Are you sure you want to unmute ambient_loops? Press Enter to continue or Ctrl+C to cancel.
pause > nul
del ..\..\sounds\lava2_lp.wav

if exist "ambient_loops\original\lava2_lp.wav" (
	copy "ambient_loops\original\lava2_lp.wav" "..\..\sounds\lava2_lp.wav" /Y
)
del ..\..\sounds\lava_lp.wav

if exist "ambient_loops\original\lava_lp.wav" (
	copy "ambient_loops\original\lava_lp.wav" "..\..\sounds\lava_lp.wav" /Y
)
del ..\..\sounds\wind_corr_lp.wav

if exist "ambient_loops\original\wind_corr_lp.wav" (
	copy "ambient_loops\original\wind_corr_lp.wav" "..\..\sounds\wind_corr_lp.wav" /Y
)
del ..\..\sounds\wind_lp1.wav

if exist "ambient_loops\original\wind_lp1.wav" (
	copy "ambient_loops\original\wind_lp1.wav" "..\..\sounds\wind_lp1.wav" /Y
)
del ..\..\sounds\wind_lp2.wav

if exist "ambient_loops\original\wind_lp2.wav" (
	copy "ambient_loops\original\wind_lp2.wav" "..\..\sounds\wind_lp2.wav" /Y
)
del ..\..\sounds\wind_lp3.wav

if exist "ambient_loops\original\wind_lp3.wav" (
	copy "ambient_loops\original\wind_lp3.wav" "..\..\sounds\wind_lp3.wav" /Y
)
del ..\..\sounds\wind_lp4.wav

if exist "ambient_loops\original\wind_lp4.wav" (
	copy "ambient_loops\original\wind_lp4.wav" "..\..\sounds\wind_lp4.wav" /Y
)
echo Completed. Review the output above for any errors.
pause > nul
