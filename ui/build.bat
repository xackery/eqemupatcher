@echo off
rsrc -manifest eqemupatcher.manifest -o rsrc.syso
taskkill /IM eqemupatcher.exe
rm eqemupatcher.exe
go build -ldflags="-H windowsgui" -o eqemupatcher.exe
eqemupatcher.exe
