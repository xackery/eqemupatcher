echo building....
set VERSION=1.0.17.0
set BUILD_CONFIGURATION=Release
set SERVER_NAME=EQEMU Patcher
set FILELIST_URL=https://test.com

"C:\Program Files\Microsoft Visual Studio\2022\Community\Msbuild\Current\Bin\msbuild.exe" /m /p:Configuration=%BUILD_CONFIGURATION% /p:Version=%VERSION% /p:SERVER_NAME="%SERVER_NAME%" /p:FILELIST_URL="%FILELIST_URL%"
copy "EQEmu Patcher"\bin\Release\eqemupatcher.exe .

