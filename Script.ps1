# PowerShell Menu Script Example

function Show-Menu {
    Clear-Host
    Write-Host "==================================="
    Write-Host "        Herramientas utiles        "
    Write-Host "==================================="
    Write-Host "1. Activacion de Windows y Office"
    Write-Host "2. Optimizacion e instalacion"
    Write-Host "3. Instalar Chocolatey"
    Write-Host "4. Instalar usando Chocolatey"
    Write-Host "5. Navegadores"
    Write-Host "6. Herramientas de red"
    Write-Host "7. Abrir Herramientas de Windows"
    Write-Host "8. Salir"
    Write-Host "==================================="
}

function Show-MenuNav {
    Clear-Host
    Write-Host "==================================="
    Write-Host "      Paginas web navegadores      "
    Write-Host "==================================="
    Write-Host "1. Chrome"
    Write-Host "2. Firefox"
    Write-Host "3. Opera"
    Write-Host "4. Brave"
    Write-Host "5. Volver al menu principal"
    Write-Host "==================================="
}
function Show-MenuWin {
    Clear-Host
    Write-Host "==================================="
    Write-Host "      Herramientas de Windows      "
    Write-Host "==================================="
    Write-Host "1. Administrador de tareas"
    Write-Host "2. Monitor de recursos"
    Write-Host "3. Panel de control"
    Write-Host "4. Editor de registro"
    Write-Host "5. Herramientas administrativas"
    Write-Host "6. Escaneo de disco"
    Write-Host "7. Volver al menu principal"
    Write-Host "==================================="
}

function Show-Choco {
    Clear-Host
    Write-Host "==================================="
    Write-Host "       Paquetes de chocolatey      "
    Write-Host "==================================="
    Write-Host "1. Angry Ip scanner"
    Write-Host "2. Acrobat Reader DC"
    Write-Host "3. Rufus"
    Write-Host "4. Revo Uninstaller"
    Write-Host "4. Geek Uninstaller"
    Write-Host "5. KeypassX"
    Write-Host "6. Winrar"
    Write-Host "7. Putty"
    Write-Host "8. Seleccionar paquete manualmente"
    Write-Host "9. Volver al menu principal"
    Write-Host "==================================="
}
function Show-MenuNmap {
    Clear-Host
    Write-Host "==================================="
    Write-Host "        Herramientas de red        "
    Write-Host "==================================="
    Write-Host "1. Cliente Basico"
    Write-Host "2. Cliente Completo"
    Write-Host "3. Deteccion de OS"
    Write-Host "4. Cliente agresivo"
    Write-Host "5. Escaneo de red"
    Write-Host "6. Cual es mi IP local"
    Write-Host "7. Cual es mi IP externa"
    Write-Host "8. Volver al menu principal"
    Write-Host "==================================="

}
function Menu {
    do {
        Show-Menu
        $choice = Read-Host "Seleccione una opcion (1-8)"

        switch ($choice) {
            "1" { $Command = "irm https://get.activated.win | iex"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command"}
            "2" { $Command = "irm 'https://christitus.com/win' | iex"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command"}
            "3" { $Command = "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"; $proc = Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command" -PassThru; Wait-Process -Id $proc.id; $Command = "choco install chocolateygui"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command"}
            "4" { MenuChoco}
            "5" { MenuNav}
            "6" { MenuNmap}
            "7" { MenuWin}
            "8" { Write-Host "Adios"}
            default {Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red; Start-Sleep -Seconds 1}
        }
    } while ($choice -ne "8")
}

function MenuNav {
    do {
        Show-MenuNav
        $choice = Read-Host "Seleccione una opcion (1-5)"

        switch ($choice) {
            "1" { Start-Process "https://www.google.es/chrome/"}
            "2" { Start-Process "https://www.mozilla.org/en-US/firefox/new/"}
            "3" { Start-Process "https://www.opera.com/es?msockid=134549aba99364d835955c54a83b65a0"}
            "4" { Start-Process "https://brave.com/download/"}
            "5"{}
            default {Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red; Start-Sleep -Seconds 1}
        }
    } while ($choice -ne "5")
}
function MenuWin {
    do {
        Show-MenuWin
        $choice = Read-Host "Seleccione una opcion (1-7)"

        switch ($choice) {
            "1" { Start-Process "taskmgr"}
            "2" { Start-Process "resmon"}
            "3" { Start-Process "control"}
            "4" { Start-Process "regedit"}
            "5" { Start-Process control.exe admintools}
            "6" { Start-Process "cmd.exe" -ArgumentList "/k sfc /scannow"; Start-Process "cmd.exe" -ArgumentList "/k chkdsk"; Start-Process "cmd.exe" -ArgumentList "/k DISM /Online /Cleanup-Image /RestoreHealth" }
            "7" {}
            default {Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red; Start-Sleep -Seconds 1}
        }
    } while ($choice -ne "7")
}

function MenuChoco {
    do {
        Show-Choco
        $choice = Read-Host "Seleccione una opcion (1-9)"

        switch ($choice) {
            "1" { $choice = "choco install angryip -y"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"}
            "2" { $choice = "choco install adobreader -y"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"}
            "3" { $choice = "choco install rufus -y"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"}
            "4" { $choice = "choco install revo-uninstaller -y"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"}
            "5" { $choice = "choco install geekuninstaller -y"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"}
            "6" { $choice = "choco install winrar -y"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"}
            "7" { $choice = "choco install putty.install -y"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"}
            "8" { $inputs = Read-Host "Ingrese el nombre del paquete a instalar"; if ([string]::IsNullOrWhiteSpace($inputs)) {Write-Host "No se ha ingresado un nombre de paquete." -ForegroundColor Red; Pause; continue}; $Command = "choco install $inputs -y; exit"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command -y"}
            "9"{}
            default {Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red; Start-Sleep -Seconds 1}
        }
    } while ($choice -ne "9")
}

function MenuNmap {
    do {
        Show-MenuNmap
        $choice = Read-Host "Seleccione una opcion (1-8)"
        $target = "";
        if($choice -match '^[1-5]$'){ $target = Read-Host "Selecciona la ip o la subred para escanear"}
        switch ($choice) {
            "1" { Start-Process "cmd.exe" -ArgumentList "/k nmap $target & echo. & echo Presiona Enter para salir... & pause >nul & exit" }
            "2" { Start-Process "cmd.exe" -ArgumentList "/k nmap -p- $target & echo. & echo Presiona Enter para salir... & pause >nul & exit" }
            "3" { Start-Process "cmd.exe" -ArgumentList "/k nmap -O $target & echo. & echo Presiona Enter para salir... & pause >nul & exit" }
            "4" { Start-Process "cmd.exe" -ArgumentList "/k nmap -A $target & echo. & echo Presiona Enter para salir... & pause >nul & exit" }
            "5" { Start-Process "cmd.exe" -ArgumentList "/k nmap -sn $target & echo. & echo Presiona Enter para salir... & pause >nul & exit" }
            "6" { $command = 'Write-Host ""; (Test-Connection -ComputerName $env:computername -count 1).ipv4address.IPAddressToString; Write-Host ""; Read-Host "Presiona enter para continuar..."'; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $command" }
            "7" { $command = "Write-Host ''; Invoke-RestMethod -Uri https://api.ipify.org; Write-Host ''; Read-Host 'Presiona enter para continuar...'"; Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $command" }
            "8" {}
            default {Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red; Start-Sleep -Seconds 1}
        }
    } while ($choice -ne "8")
}

# Helper function to pause
function Pause {
    Write-Host ""
    Read-Host "Press Enter to continue..."
}

# Run the menu
Menu
