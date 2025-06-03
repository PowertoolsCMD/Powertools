# PowerShell Menu Script Example

function Show-Menu {
    Clear-Host
    Write-Host "==================================="
    Write-Host "        Herramientas utiles        "
    Write-Host "==================================="
    Write-Host "1. Activacion de windows y Office"
    Write-Host "2. Optimizacion e instalacion"
    Write-Host "3. Instalar Chocolatey"
    Write-Host "4. Instalar usando Chocolatey"
    Write-Host "5. Navegadores"
    Write-Host "6. Salir"
    Write-Host "==================================="
}

function Show-Menu2 {
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
    Write-Host "6. Putty"
    Write-Host "6. Seleccionar paquete manualmente"
    Write-Host "7. Volver al menu principal"
    Write-Host "==================================="
}
function Menu {
    do {
        Show-Menu
        $choice = Read-Host "Seleccione una opcion (1-6)"

        switch ($choice) {
            "1" {
                $Command = "irm https://get.activated.win | iex"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command"
            }
            "2" {
                $Command = "irm 'https://christitus.com/win' | iex"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command"
            }
            "3" {
                $Command = "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
                $proc = Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command" -PassThru
                Wait-Process -Id $proc.id
                $Command = "choco install chocolateygui"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command"
            }
            "4" {
                MenuChoco
            }
            "5" {
                Menu2
            }
            "6"{
                Write-Host "Adios"
            }
            default {
                Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red
                Start-Sleep -Seconds 1
            }
        }
    } while ($choice -ne "6")
}

function Menu2 {
    do {
        Show-Menu2
        $choice = Read-Host "Seleccione una opcion (1-5)"

        switch ($choice) {
            "1" {
                Start-Process "https://www.google.es/chrome/"
            }
            "2" {
                Start-Process "https://www.mozilla.org/en-US/firefox/new/"
            }
            "3" {
                Start-Process "https://www.opera.com/es?msockid=134549aba99364d835955c54a83b65a0"
            }
            "4" {
                Start-Process "https://brave.com/download/"
            }
            "5"{

            }
            default {
                Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red
                Start-Sleep -Seconds 1
            }
        }
    } while ($choice -ne "5")
}

function MenuChoco {
    do {
        Show-Choco
        $choice = Read-Host "Seleccione una opcion (1-9)"

        switch ($choice) {
            "1" {
                $choice = "choco install angryip -y"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"
            }
            "2" {
                $choice = "choco install adobreader -y"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"
            }
            "3" {
                $choice = "choco install rufus -y"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"
            }
            "4" {
                $choice = "choco install revo-uninstaller -y"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"
            }
            "5" {
                $choice = "choco install geekuninstaller -y"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"
            }
            "6" {
                $choice = "choco install winrar -y"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"
            }
            "7" {
                $choice = "choco install putty.install -y"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $choice"
            }
            "8" {
                $inputs = Read-Host "Ingrese el nombre del paquete a instalar"
                    if ([string]::IsNullOrWhiteSpace($inputs)) {
                        Write-Host "No se ha ingresado un nombre de paquete." -ForegroundColor Red
                        Pause
                        continue
                    }
                $Command = "choco install $inputs -y; exit"
                Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -Command $Command -y"
            }
            "9"{

            }
            default {
                Write-Host "Seleccion invalida, prueba de nuevo." -ForegroundColor Red
                Start-Sleep -Seconds 1
            }
        }
    } while ($choice -ne "9")
}

# Helper function to pause
function Pause {
    Write-Host ""
    Read-Host "Press Enter to continue..."
}

# Run the menu
Menu
