# EQEmuPatcher

EQEmu File Comparison and Patcher

![alt tag](http://i.imgur.com/FSVgkzh.png)
---

## Downloading
Latest pre-compiled binaries are found here: https://github.com/xackery/eqemupatcher/releases 

*Note:* There are two parts to this program. eqemupatcher.exe and filelistbuilder.exe.

*Also Note:* While precompiled binaries are available, it is REQUIRED as a server administrator to compile eqemupatcher.exe yourself to configure it properly.
* eqemupatcher.exe is the client side patcher. Read Client Setup for more information on how to use it.
* filelistbuilder.exe is the server side patch prepper. Read Server Setup for more information on how to use it.

### Client Setup

After finishing the Server Setup process, simply distribute eqemupatcher.exe to your players. There are no additional dependencies for modern Windows users. They will need to place it in the same directory as eqgame.exe (Your Everquest directory).
* It is recommended to advise players that if they copy this file into Program Files for their EQ dir, it will need to run with administrator privileges.

### Server Setup

There are two major parts of getting eqemupatcher working. First, is compiling the c
#### Visual Studio Setup.
* Get Visual Studio if you don't have it already. You can obtain the latest copy of Visual Studio for free from Microsoft here: https://www.visualstudio.com/downloads/ Click the Community Edition.
* Fork this repository, so you can modify and version your own changes. If you are unfamiliar with forking, I suggest checking out https://help.github.com/articles/fork-a-repo/ to learn more.
* Navigate into the EQEmu Patcher directory and open EQEmu Patcher.sln. It will open in Visual Studio.

### Forking
