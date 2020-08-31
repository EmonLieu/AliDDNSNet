@echo off&color e&Title �����ƶ�̬DNS-API �����п���̨

cls

:Begin

echo   **********************************
echo.
echo          �����ƶ�̬DNS-API �����п���̨
echo.
echo   **********************************
echo. & echo   Script: %0% & echo.
echo ���������
echo.
echo     list         ��ѯ �����ƶ�̬DNS-API ����
echo     config       �� �����ƶ�̬DNS-API �����ļ�
echo.
echo     start        ���� �����ƶ�̬DNS-API ����
echo.
echo     restart        ���� �����ƶ�̬DNS-API ����
echo.
echo     kill        ɱ�� �����ƶ�̬DNS-API ����
echo.
echo     exit         �˳�����̨
echo     cmd          ���� cmd

echo.&echo.&set /p cmd=�����룺

if  "%cmd%"=="list"    goto List
if  "%cmd%"=="config"     goto Config
if  "%cmd%"=="start"   goto Start
if  "%cmd%"=="exit"    goto End
if  "%cmd%"=="kill"     goto Kill
if  "%cmd%"=="restart"   goto ReStart
if  "%cmd%"=="cmd"     goto Cmd

cls
goto Begin

:End
exit

:Kill
cls
echo.
echo     ����ɱ�� �����ƶ�̬DNS-API ����
echo.
echo.&echo.
taskkill /F /IM AliCloudDynamicDNS.exe* 
set cmd=
echo.&echo     ִ�����
echo.&echo.
echo.&echo.&set /p waitinput=��Enter�����ع��ܲ˵�
cls
goto Begin


:Start
cls
echo.
echo     �������� �����ƶ�̬DNS-API ����
echo.
echo.&echo.&set /p interval=�����������ʱ������(��λ���룬���ڵ���30)��
echo.&echo.

start cmd.exe "/k title �����ƶ�̬DNS-API && AliCloudDynamicDNS.exe -f ./settings.json -i %interval%"

set cmd=
echo.&echo     ִ�����
echo.&echo.
echo.&echo.&set /p waitinput=��Enter�����ع��ܲ˵�
cls
goto Begin


:ReStart
cls
echo.
echo     ����ɱ�� �����ƶ�̬DNS-API ����
echo.
echo.&echo.
taskkill /F /IM AliCloudDynamicDNS.exe* 
echo.
echo     �������� �����ƶ�̬DNS-API ����
echo.
echo.&echo.&set /p interval=�����������ʱ������(��λ���룬���ڵ���30)��
echo.&echo.

start cmd.exe "/k AliCloudDynamicDNS.exe -f ./settings.json -i %interval% && title �����ƶ�̬DNS-API

set cmd=
echo.&echo     ִ�����
echo.&echo.
echo.&echo.&set /p waitinput=��Enter�����ع��ܲ˵�
cls
goto Begin


:List
cls
echo.
echo     ��ѯ �����ƶ�̬DNS-API ����
echo.

tasklist /fi "imagename eq AliCloudDynamicDNS.exe"
set cmd=
echo.&echo.
echo.&echo.&set /p waitinput=��Enter�����ع��ܲ˵�
cls
goto Begin

:Cmd
cls
start cmd
set cmd=
goto Begin

:Config
cls
echo.
echo     �� �����ƶ�̬DNS-API �����ļ�
echo.

start notepad %cd%\settings.json
set cmd=
echo.&echo.
goto Begin
