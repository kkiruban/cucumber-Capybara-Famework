set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Elekta-Admin-%_my_datetime%.html
cd /d %~dp0
<<<<<<< HEAD
cucumber features --tags @admin-mc,@Admin_accounts,@Admin_contacts,@Admin_leads,@Admin_general --expand  --format html --out %_filename% UserRole='AdminSit'