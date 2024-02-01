@ECHO OFF

SET commit_message=%1
SET "ORI=C:\Sesac\skproject\sk_sesac_pt2-master\hacking02_sk"
FOR /F %%P IN ('cd') DO SET CURRENT_PATH=%%P
IF "%ORI%" == "%CURRENT_PATH%" (
	 ECHO PATH SAME
	 SET "MY_BUILD="
	 FOR /F "tokens=*" %%G IN ('gradlew clean build ^| find /I "BUILD SUCCESSFUL"') DO SET "MY_BUILD=%%G"
	
	 IF %ERRORLEVEL% EQU 0 (
		 ECHO BUILD SUCCESS
		 call COPY build\libs\hacking02_sk-0.0.1-SNAPSHOT-plain.war "%CD%\ROOT.war"

		 FOR /F "tokens=*" %%C IN ('git branch ^| find /I "* pooh2s"') DO SET "MY_GIT=%%C"
		
		 IF %ERRORLEVEL% EQU 0 (
			call git add .
			call git commit -m "%commit_message%"
			call git checkout master
			call git merge poo2s
			call git push origin master
			call git checkout poo2s
			ECHO SUCCESS
		)
	)
)