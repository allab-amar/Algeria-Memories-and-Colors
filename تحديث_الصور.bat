@echo off
chcp 65001 >nul
echo =========================================
echo       تحديث أرشيف الصور
echo =========================================
echo.
echo جاري قراءة الصور الجديدة...
powershell -ExecutionPolicy Bypass -File "%~dp0update_database.ps1"
echo.
echo تم التحديث بنجاح! يمكنك الآن فتح الصفحة.
echo =========================================
pause
