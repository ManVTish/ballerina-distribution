@echo off

REM ---------------------------------------------------------------------------
REM  Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
REM
REM  WSO2 Inc. licenses this file to you under the Apache License,
REM  Version 2.0 (the "License"); you may not use this file except
REM  in compliance with the License.
REM  You may obtain a copy of the License at
REM
REM      http://www.apache.org/licenses/LICENSE-2.0
REM
REM  Unless required by applicable law or agreed to in writing,
REM  software distributed under the License is distributed on an
REM  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
REM  KIND, either express or implied. See the License for the
REM  specific language governing permissions and limitations
REM  under the License.
REM ---------------------------------------------------------------------------

setlocal
set CURRENT_PATH=%~sdp0
xcopy /s %CURRENT_PATH%\ballerina-command-${ballerina.command.version}\lib\ballerina-command-${ballerina.command.version}.jar  %CURRENT_PATH%\..\lib /Y
xcopy /s %CURRENT_PATH%\ballerina-command-${ballerina.command.version}\bin\ballerina.bat  %CURRENT_PATH%\..\bin /Y

for %%f in (%CURRENT_PATH%\..\lib\*ballerina-command*.jar) do (
	echo %%f|find /i "ballerina-command-${ballerina.command.version}.jar">nul
    if errorlevel 1 (
	   echo "deleting old" %%~nxf
	   del /F/Q "%%f"
	)
)
exit /b
