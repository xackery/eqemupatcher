@echo off
setlocal enabledelayedexpansion
echo Are you sure you want to mute ambient_loops? Press Enter to continue or Ctrl+C to cancel.
pause > nul

if exist "..\..\sounds\lava2_lp.wav" (
	for %%F in ("..\..\sounds\lava2_lp.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "ambient_loops\original\" >nul 2>&1
		copy "..\..\sounds\lava2_lp.wav" "ambient_loops\original\lava2_lp.wav" /Y
	)
)
copy blank.wav ..\..\sounds\lava2_lp.wav /Y

if exist "..\..\sounds\lava_lp.wav" (
	for %%F in ("..\..\sounds\lava_lp.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "ambient_loops\original\" >nul 2>&1
		copy "..\..\sounds\lava_lp.wav" "ambient_loops\original\lava_lp.wav" /Y
	)
)
copy blank.wav ..\..\sounds\lava_lp.wav /Y

if exist "..\..\sounds\wind_corr_lp.wav" (
	for %%F in ("..\..\sounds\wind_corr_lp.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "ambient_loops\original\" >nul 2>&1
		copy "..\..\sounds\wind_corr_lp.wav" "ambient_loops\original\wind_corr_lp.wav" /Y
	)
)
copy blank.wav ..\..\sounds\wind_corr_lp.wav /Y

if exist "..\..\sounds\wind_lp1.wav" (
	for %%F in ("..\..\sounds\wind_lp1.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "ambient_loops\original\" >nul 2>&1
		copy "..\..\sounds\wind_lp1.wav" "ambient_loops\original\wind_lp1.wav" /Y
	)
)
copy blank.wav ..\..\sounds\wind_lp1.wav /Y

if exist "..\..\sounds\wind_lp2.wav" (
	for %%F in ("..\..\sounds\wind_lp2.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "ambient_loops\original\" >nul 2>&1
		copy "..\..\sounds\wind_lp2.wav" "ambient_loops\original\wind_lp2.wav" /Y
	)
)
copy blank.wav ..\..\sounds\wind_lp2.wav /Y

if exist "..\..\sounds\wind_lp3.wav" (
	for %%F in ("..\..\sounds\wind_lp3.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "ambient_loops\original\" >nul 2>&1
		copy "..\..\sounds\wind_lp3.wav" "ambient_loops\original\wind_lp3.wav" /Y
	)
)
copy blank.wav ..\..\sounds\wind_lp3.wav /Y

if exist "..\..\sounds\wind_lp4.wav" (
	for %%F in ("..\..\sounds\wind_lp4.wav") do (
		set "size=%%~zF"
	)
	if !size! GTR 250 (
		mkdir "ambient_loops\original\" >nul 2>&1
		copy "..\..\sounds\wind_lp4.wav" "ambient_loops\original\wind_lp4.wav" /Y
	)
)
copy blank.wav ..\..\sounds\wind_lp4.wav /Y
echo Completed. Review the output above for any errors.
pause > nul
