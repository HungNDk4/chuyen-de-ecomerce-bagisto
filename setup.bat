@echo off
chcp 65001 >nul
echo Dang khoi tao moi truong va storage...

if not exist .env (
    copy .env.example .env
    call php artisan key:generate
)

if exist public\storage (
    rmdir /s /q public\storage 2>nul
    del /f /q public\storage 2>nul
)

mkdir public\storage 2>nul
xcopy /E /I /Y /Q storage\app\public\* public\storage\

call php artisan optimize:clear
echo Hoan tat! Hay chay: php artisan serve
pause