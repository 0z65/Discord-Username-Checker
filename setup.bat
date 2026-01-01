@echo off
go version >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Invoke-WebRequest -Uri https://go.dev/dl/go1.22.0.windows-amd64.msi -OutFile go_installer.msi"
    msiexec /i go_installer.msi /quiet /qn /norestart
    del go_installer.msi
)
go get github.com/joho/godotenv
go mod tidy