@echo off
title Plugin Generator

:start
color a0
set /p mode=Enter Mode (Generate [1] or Delete [2] or Exit [3]): 
if %mode%== 1 (
	goto gen
)else if %mode%== 2 (
	goto del
)else if %mode%== 3 (
	exit
)else (
	echo Please enter a valid mode...
	pause
	goto start
)
:gen
color b0
if not exist plugin (
	echo Generating folder structure template...
	mkdir plugin
	cd plugin
	mkdir src
	echo name>>plugin.yml
	cd src
	mkdir name
	cd name
	mkdir space
	cd space
	echo //Code Here...>>Main.php
	echo Generation complete!
	cd ..
	cd ..
	cd ..
	cd ..
	cd ..
	pause
	goto start
) else (
	echo Dir exists!
	pause
	goto start
)

:del
color d0
if exist plugin (
	echo Deleting...
	rd /S /Q plugin
	echo Deleting process complete!!!
	pause
	goto start
) else (
	echo Directory does NOT exist!!!
	pause
	goto start
)
