set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\WK_Legal-Sales-Ops-%_my_datetime%.html
cd /d %~dp0
cucumber features --tags @SalesOps_tasks --expand --format html --out %_filename%  UserRole="SalesOperationProd"
