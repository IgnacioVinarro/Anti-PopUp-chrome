; =========================================================================================================================================================================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; =========================================================================================================================================================================================================================
    #NoEnv
    #SingleInstance Force
    SetWorkingDir %A_ScriptDir%
    SetTitleMatchMode, 2          ; Permite buscar partes del título (ej. "Documentos")
    MsgBox, 64, Script Listo, El script se ha iniciado correctamente.
    Return

; ================================================================================================================================================
; CONFIGURACIÓN ADICIONAL (Opcional)
; ================================================================================================================================================

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
    ; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
    NumLock::ExitApp

F1::
    if WinExist("ahk_exe omnipage19.exe") {
    WinActivate, ahk_exe omnipage19.exe
    WinWaitActive, ahk_exe omnipage19.exe, , 2
    Click, 100, 105
    Sleep, 100
    if WinExist("ahk_exe omnipage19.exe") {
        WinWaitActive, ahk_exe TwainClientU.exe, , 6
        WinActivate, ahk_exe TwainClientU.exe
        Sleep, 200
        Click, 421, 704
        } else {
        MsgBox, 48, Error, TwainClientU.exe no está abierto.
        }
    } else {
    MsgBox, 48, Error, OmniPage19.exe no está abierto.
    }
    Sleep, 2000
    WinGetTitle, tituloInicial, ahk_exe TwainClientU.exe
    MouseMove, 219, 116
    Loop
    {
        ; Consultamos el título actual en cada ciclo
        WinGetTitle, tituloActual, ahk_exe TwainClientU.exe

        ; Si el título cambió respecto al inicial, rompemos el bucle
        if (tituloActual != tituloInicial)
        {
            break
        }
        ; Pausa de 100 ms para no saturar el uso de CPU
        Sleep, 100
    }
    ; El script continúa aquí una vez que el título cambia...
    MsgBox, ¡El título de la ventana ha cambiado!
    return