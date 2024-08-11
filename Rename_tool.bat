@echo off

set old_name_default=*.png
set new_name_default=-d.png
set number_length_default=3
set rules_chack=1
set rename_chack=0

set co=%1
set ce=%2
set cn=%3

::set co
if "%co%"=="" (
	set co=%old_name_default%
)


::set ce
if "%ce%"=="" (
	set ce=%new_name_default%
)

set cet=%ce:-d= %
for /F "tokens=1 delims= " %%a in ("%cet%") do set ces=%%a
for /F "tokens=2 delims= " %%a in ("%cet%") do set cee=%%a

set cet=%cet:~0,1%
if "%cet%"==" " (
	set cee=%ces%
	set ces=
)


::set cn
set cn_long_set=0
set cnt=%cn%
if "%cn%"=="" (
	set cnl=%number_length_default%
	set cn_long_set=1
) else (
	set cnl=0
	:get_number_length
	if not "%cnt%"=="" (
		set /a cnl+=1
		set cnt=%cnt:~1%
		goto get_number_length
	)
)
set cns=1
set cnlc=0
:cns_add_length
if "%cnlc%" lss "%cnl%" (
	set /a cnlc+=1
	set /a cns*=10
	goto cns_add_length
)
set cns_number_add=0
set cns_temp=%cn%
set cns_chack_temp=%cns_temp:~0,1%
if "%cn_long_set%"=="1" (
	set cns_number_add=0
) else (
	for /F "delims=1234567890" %%a in ("%cns_temp%") do if not %%a=="" (
		echo.
		echo     not numbers ,set to 0.
		echo.
		set cns_number_add=0
		goto cns_number_add_finded
	)
	:cns_remove_zero
	set cns_chack_temp=%cns_temp:~0,1%
	if "%cns_chack_temp%"=="0" (
		set cns_temp=%cns_temp:~1%
		goto cns_remove_zero
	)
	if "%cns_temp%"=="" (
		set cns_temp=0
	)
	set cns_number_add=%cns_temp%
)
:cns_number_add_finded
set /a cns+=%cns_number_add%

:: show rules
echo Show rules:
echo.
echo     old name: %co%
echo     new name: %ces%[number]%cee%
setlocal EnableDelayedExpansion
echo     number start: !cns:~-%cnl%!
endlocal
echo.

if "%rules_chack%"=="1" (
	pause
	echo.
)

set number_using=%cns%
echo Rename start.
echo.
setlocal EnableDelayedExpansion
for %%n in ("%co%") do (
ren "%%n" "%ces%!number_using:~-%cnl%!%cee%"
echo     [%%n] to [%ces%!number_using:~-%cnl%!%cee%]
set /a number_using+=1
)
endlocal
echo.
echo Rename end.
echo.
if "%rename_chack%"=="1" (
	pause
)

exit