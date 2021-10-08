@echo off

setlocal ENABLEDELAYEDEXPANSION

::Set here the jars path, o input it manualy on batch execution
set JARS_PATH=%1

if [%1] == [] (
	set JARS_PATH=.\jars
)

echo Processing jars from !JARS_PATH! folder

::Remove existing decompiled jars folder
set DECOMP_FOLDER=!JARS_PATH!\decompiledJars\
rmdir /s/q !DECOMP_FOLDER!

for %%f in (!JARS_PATH!\*.jar) do (
	if "%%~xf"==".jar" (
		echo Decompiling %%~nf.jar
		
		set DECOMP_JAR_FOLDER=!DECOMP_FOLDER!%%~nf\
		::Lets create a folder to put decompiled code
		mkdir !DECOMP_JAR_FOLDER!
		
		cd !DECOMP_JAR_FOLDER!
		jar xf ..\.%%f
	)
)

set /p =Finished. Press ENTER to close...

endlocal
