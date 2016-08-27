# eqemupatcher
EQEmu File Comparison and Patcher - [Download here](https://github.com/Xackery/eqemupatcher/releases)
![alt tag](http://i.imgur.com/wR0SiA8.png)
---
The intent of this patcher is a bit different than most. I noticed many people will take a server (let's say, P99) and try to play on another server, only to discover odd anomolies that are tough to figure out due to edits for P99 vs the current server's patch files.
Most patchers focus on downloading the latest patch file and simply applying them, assuming the core files are in place from a vanilla-like status, which in the above use case would cause new side effects.

This patcher is made where it analyzes all critical-to-play files with MD5 to find any files that are out of place.
If any are found to not be proper, it will notify and give options of resolution.

---
# I can't find Json .NET
right click on your project and select "manage nuget package". put json into the search, find it in the list and click "install"
