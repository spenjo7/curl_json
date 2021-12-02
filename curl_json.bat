@ECHO off
::echo %date%, %time% >> log.txt
SET "now=%date% %time%"

SET "jsonFile="
FOR /f "delims=" %%a in ('findstr /i "^jsonFile=" config.ini') do set %%a

IF DEFINED jsonFile (  
	SET _bool_1=t
	ECHO [%NOW%][INFO][config.ini.jsonFile=%jsonFile%] 
) ELSE (
	SET _bool_1=f
	ECHO [%NOW%][ERROR][config.ini.jsonFile is undefined or null]
)

SET "url="
FOR /f "delims=" %%b in ('findstr /i "^URL=" config.ini') do set %%b

IF DEFINED url (  
	SET _bool_2=t
	ECHO [%NOW%][INFO][config.ini.url=%url%] 
) ELSE (
	SET _bool_2=f
	ECHO [%NOW%][ERROR][config.ini.url is undefined or null]
)

IF NOT "%_bool_1%%_bool_2%" == "tt" ( 
	ECHO [%NOW%][ERROR][Check config.ini for required variables.]
) else (
	ECHO [%NOW%][INFO][Attempting CURL process]
	curl -X POST -H "Content-Type: application/json" -d @%jsonFile% %url%
)

cmd /k