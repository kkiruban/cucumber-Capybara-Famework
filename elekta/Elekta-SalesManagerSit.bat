set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Elekta-Sales-Manager-%_my_datetime%.html
cd /d %~dp0
REM cucumber features --tags @sm-opp,@SalesMgr_accounts,@SalesMgr_contacts,@SalesMgr_leads --expand --format html --out %_filename%  UserRole='SalesManagerSit'
cucumber features --tags @sm-mc,@sm-opp --expand --format html --out %_filename%  UserRole='SalesManagerSit'