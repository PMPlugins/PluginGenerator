@echo off
title Plugin Generator

:start
color a0
set /p mode=Enter Mode (Generate [1] or Exit [2]): 
IF [%mode%]==[] goto error
if %mode%== 1 (
	goto gen
) else if %mode%== 2 (
	exit
) else (
	echo Please enter a valid mode...
	pause
	goto start
)

:gen
color b0
echo -------------------------------------

set /p pname=Enter Plugin name:
IF [%pname%]==[] goto error
set /p foldername=Enter Folder Name:
IF [%foldername%]==[] goto error
set /p ns1=Enter First Namespace: 
IF [%ns1%]==[] goto error
set /p ns2=Enter Second Namespace:
IF [%ns2%]==[] goto error

echo -------------------------------------
set /p cfg=Want a config? (Enter y or n):
IF [%cfg%]==[] goto error
echo -------------------------------------

echo Now it is time for plugin.yml info!

set /p mfn=Enter Main file name:
IF [%mfn%]==[] goto error
set /p ver=Enter version:
IF [%ver%]==[] goto error
set /p api=Enter API version:
IF [%api%]==[] goto error
set /p author=Enter Author name:
IF [%author%]==[] goto error
REM set /p des=Enter description for plugin:
REM IF [%des%]==[] goto error
goto startgen

:startgen
echo -------------------------------------
	echo Generating folder structure template...
	mkdir %foldername%
	cd %foldername%
	mkdir src
		(
			echo name: %pname%
			echo main: %ns1%\%ns2%\%mfn%
			echo version: "%ver%"
			echo api: [%api%]
			echo author: %author%
			REM echo description: %des%
		) > plugin.yml
	if %cfg%== y (
		mkdir resources 
		cd resources
		(
			echo ---
			echo ...
		)>config.yml
		cd ..
	)
	cd src
	mkdir %ns1%
	cd %ns1%
	mkdir %ns2%
	cd %ns2%
	echo //Code Here...>>%mfn%.php
	echo Generation complete!
	pause
	goto start
echo -------------------------------------

:error
echo You entered a invalid value. Please restart by pressing enter.
pause
goto start
