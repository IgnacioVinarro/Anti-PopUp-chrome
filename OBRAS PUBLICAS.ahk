; ==================================================================================================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; ==================================================================================================================================================
    #NoEnv
    #SingleInstance Force
    SetWorkingDir %A_ScriptDir%
    SetTitleMatchMode, 2          ; Permite buscar partes del título (ej. "Documentos")
    MsgBox, 64, Script Listo, El script se ha iniciado correctamente.
    Return

; ==================================================================================================================================================
; CONFIGURACIÓN ADICIONAL (Opcional)
; ==================================================================================================================================================

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
    ; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
    NumLock::ExitApp

; =========================================================================
; INICIAR SESION
; =========================================================================
F12::
     Click, 27, 333
     Sleep, 400
     Click, 616, 234
     Sleep, 100
     Send, 20472731336
     Sleep, 100
     Send, {Tab}
     Sleep, 100
     Send, 1023{ENTER}
     Sleep, 200
     Send, ^l
     Sleep, 100
     Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
     Sleep, 300
     Click, 330, 180
    return

; =========================================================================
; PESTAÑA SELECCIONADA A EXP CREAR
; =========================================================================
RCtrl & F12::
        Send, ^l
        Sleep, 100
        Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
        Sleep, 300
        Click, 330, 180
    return

;PRUEBA
F1::
Send, {Enter}
ColorNaranja := 0xF79130
    Encontrado := false
    
    ; 4. BUCLE DE ESPERA: Intentará buscar el color durante 2 segundos 
    ; (hace hasta 20 intentos, esperando 100ms entre cada uno)
    Loop, 20
    {
        ; Buscamos en toda la pantalla. 
        ; El "30" final es la variación: permite que el color varíe un poco en tono/brillo
        PixelSearch, EncontradoX, EncontradoY, 0, 0, A_ScreenWidth, A_ScreenHeight, %ColorNaranja%, 10, Fast RGB
        
        if (ErrorLevel = 0)
        {
            Encontrado := true
            break ; ¡Lo encontramos! Salimos del bucle inmediatamente
        }
        Sleep, 100 ; Esperamos una décima de segundo antes de volver a escanear
    }

    ; 5. Resultado
    if (Encontrado)
    {
        ; Movemos el mouse un poco más al centro del bloque naranja (sumando un pequeño ajuste)
        TargetX := 757
        TargetY := EncontradoY + 5
        
        MouseMove, %TargetX%, %TargetY%, 2
        Sleep, 200
    }
    else
    {
        MsgBox, 48, Error, No se encontró el color naranja en pantalla.`n`nAsegúrate de que el texto realmente se resalte de ese color y que esté visible en la pantalla.
    }
    Sleep, 100
    Send, {Esc}
    Sleep, 100
    Click
    Sleep, 800
    Click, 960, 423
    Sleep, 200
    Click, 958, 506
    Sleep, 200
    Click, 269, 147
return

F2::
            Send, {End}
            Sleep, 100
            Send, {WheelDown 3}
            Sleep, 100
            Send, {WheelDown 3}
            Sleep, 100
            Send, {WheelDown 3}
            Sleep, 100
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 1500
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 500
            Click, 504, 377
            Sleep, 1200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1381, 100  ; Pegar (Uploader)
return

F9::
            CoordMode, Mouse, Screen
            Click, 227, 712
            Sleep, 100
            Click, 227, 712
            WinWaitActive, ahk_exe Photos.exe
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            WinMaximize, ahk_id %IDVentanaActiva%
            WinActivate, ahk_id %IDVentanaActiva% 
            }
            Sleep, 500
            Click, 327, 21 ;Tres puntos
            Sleep, 500
            Click, 336, 163 ;Cambiar tamaño de imagen
            Sleep, 500
            Click, 791, 534 ;10%
            Sleep, 500
            Click, 861, 703 ;Guardar
            Sleep, 500
            Send, {Enter}
            Sleep, 500
            Send, !{F4}
            Sleep, 500
            Send, {Delete}
            Sleep, 500
            Click, 227, 712
            Sleep, 200
            Send, ^x
            Click, 1200, 712
            Sleep, 200
            Send, ^v
            Sleep, 200
            CoordMode, Mouse, Window
            Sleep, 100
            WinActivate, ahk_exe uploadfiles.exe
            WinWaitActive, ahk_exe uploadfiles.exe
            Click, 463, 172
            Sleep, 100
    ; =========================================================================
    ;CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
    WinWait, Finalizado ahk_exe uploadFiles.exe
    Sleep, 200
    WinActivate, Finalizado ahk_exe uploadFiles.exe
    Sleep, 200
            Send, {Enter}
            Sleep, 300
            Click, -5, 485    ; Bajar barra pestaña Google
            Sleep, 300
            Click, 851, 146   ; Cargar imágenes (boton blue)
            Sleep, 1500
            Click, 480, 400   ; Ok (boton violeta)
            Sleep, 500
            Send, {End}
            Sleep, 300
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 300
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 500
            Send, ^{F4}
            Sleep, 200
            Send, ^r
            Sleep, 500
            Send, ^f
return