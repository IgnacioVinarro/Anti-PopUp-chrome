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

; =========================================================================
; INICIAR SESION
; =========================================================================
F12::
     Click, 27, 333
     Sleep, 400
     Click, 616, 234
     Sleep, 100
     SendInput, 20472731336
     Sleep, 100
     SendInput, {Tab}
     Sleep, 100
     SendInput, 1023{ENTER}
     Sleep, 200
     SendInput, ^l
     Sleep, 100
     Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
     Sleep, 300
     Click, 330, 180
    return

; =========================================================================
; PESTAÑA SELECCIONADA A EXP CREAR
; =========================================================================
RCtrl & F12::
        SendInput, ^l
        Sleep, 100
        Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
        Sleep, 300
        Click, 330, 180
    return

; =========================================================================
; SI SE SALE EL ESCANEO
; =========================================================================
RCtrl & NumpadSub:: ;(Ctrl -)
    ; Buscamos y activamos OmniPage
    if WinExist("ahk_exe omnipage19.exe") {
    WinActivate, ahk_exe omnipage19.exe
    WinWaitActive, ahk_exe omnipage19.exe, , 2
    Click, 100, 105
    Sleep, 100
    Click, 19, 106
    Sleep, 400
    Click, 160, 226
    Sleep, 300
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
    return

; =========================================================================
; FINALIZAR ESCANEO
; =========================================================================
NumpadEnter::
    WinActivate, ahk_exe TwainClientU.exe
    Click, 404, 206
    WinWaitClose, ahk_exe TwainClientU.exe
    Sleep, 100
    SendInput, {Enter}
    return

; =========================================================================
; SALVAVIDAS: USAR EN CASO DE NO TENER LAS IMÁGENES EN ARCHIVO TEMPORAL (REEMPLAZAR)
; =========================================================================    
F10::
    SendInput, ^r
    Sleep, 1500
    Click, 191, 110
    Sleep, 500
    Click, 805, 156
    Sleep, 500
    Click, 528, 398 ;Guardar violeta
    Sleep, 500
    Click, 486, 400 ;Ok
    Sleep, 300
    Click, 828, 268 ;Guardar verde
    Sleep, 300
    Click, 525, 381 ;Guardar violeta
    Sleep, 500
    Click, 451, 379 ;
    Sleep, 1000
    Click, 593, 120 ; Copiar
    Sleep, 100
    Click, 1381, 100
    Sleep, 100
    Click, 100, 630
    Sleep, 100
    Click, 19, 106
    Sleep, 400
    Click, 160, 226
    Sleep, 4000
    Click, 480, 20
    return

; ================================================================================================================================================
; CONFIGURACIÓN ADICIONAL PROPIA DE LA DIRECCION (Opcional)
; ================================================================================================================================================

; =========================================================================
; BAJAR A SUBFORMULARIO (<)
; =========================================================================
<::
        Click, 923, 336
        Send, {End}
        Sleep, 300
        Click, 912, 152
    return

; =========================================================================
; COPIADO FORMULARIO Y SUBFORMULARIO (CTRL |)
; =========================================================================
LCtrl & |::
    CopiarYPegarFormulario()
    return
    
; =========================================================================================================================================================================================================================
; INICIO SCRIPT
; =========================================================================================================================================================================================================================

; ==============================================================================================================================================
; FUNCIONES GLOBALES
; ==============================================================================================================================================
    CopiarYPegarFormulario()
    {
        global
            ; Variable para guardar el portapapeles actual del usuario y no arruinarlo
            PortapapelesAnterior := ClipboardAll 

            ; --- COPIADO NUMERO EXPEDIENTE ---
            Click, 333, 181 
            Send, ^a
            Sleep, 50
            Send, ^c
            Click, 333, -333 
            Send, ^a
            Sleep, 50
            Send, ^v
            
            ; --- COPIADO AÑO ---
            Click, 515, 696   
            Send, ^a
            Sleep, 50
            Send, ^c
            Click, 515, -336 
            Send, ^a
            Sleep, 50
            Send, ^v

            ; --- COPIADO CARATULA ---
            Click, 900, 821  
            Send, ^a
            Sleep, 50
            Send, ^c
            Click, 923, -210 
            Send, ^a
            Sleep, 50
            Send, ^v


            ; --- BAJAR FORMULARIO ---
            Send, {Ctrl Up}
            Click, 923, 336
            Send, {End}
            Click, 923, 857
            Send, {End}
            Sleep, 150

            ; --- COPIADO EMPRESA ---
            Click, 621, 151  
            Send, ^a
            Sleep, 50
            Send, ^c
            Click, 621, -365 
            Send, ^a
            Sleep, 50
            Send, ^v

            ; --- COPIADO NUMERO FACTURA ---
            Send, {Ctrl Up}
            Click, 912, 669  
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 912, -365 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- COPIADO NUMERO ORDEN DE PAGO ---
            Click, 342, 787  
            Send, ^a
            Sleep, 50
            Send, ^c
            Click, 342, -245 
            Send, ^a
            Sleep, 50
            Send, ^v

            ; --- COPIADO RECIBO DE PAGO ---
            Send, {Ctrl Up}
            Click, 912, 787   
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 912, -245 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- COPIADO REGISTRO DEVENGADO ---
            Send, {Ctrl Up}
            Click, 912, 728 
            Sleep, 50
            Send, ^a
            Sleep, 50
            Send, ^c
            Sleep, 100
            Click, 912, -304 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v

            ; --- COPIADO REGISTRO COMPROMISO ---
            Send, {Ctrl Up}
            Click, 342, 845 
            Sleep, 50
            Send, ^a
            Sleep, 50
            Send, ^c
            Sleep, 100
            Click, 342, -187 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v

            ; --- COPIADO ORDEN DE COMPRA ---
            Send, {Ctrl Up}
            Click, 342, 669
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 342, -365 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- NUMERO ORDEN DE CANCELACION ---
            Send, {Ctrl Up}
            Click, 625, 787
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 625, -245 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- NUMERO ALTA PROVISIONAL BIENES ---
            Send, {Ctrl Up}
            Click, 625, 847
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 625, -185 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- NUMERO SOLICITUD DE PEDIDO ---
            Click, 912, 847 
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, ^c
            Sleep, 100
            Click, 912, -185 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v

            ; --- NUMERO SOLICITUD DE GASTO ---
            Click, 342, 907
            Sleep, 50
            Send, ^a
            Sleep, 50
            Send, ^c
            Sleep, 100
            Click, 342, -127 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v
            Sleep, 300

            ; --- FECHA ---
            Send, {Ctrl Up}
            Sleep, 100
            Click, 375, 731
            Sleep, 100
            Send, ^a
            Send, ^c
            Sleep, 100
            Click, 600, -306
            fechaLimpia := RegExReplace(Clipboard, "\D", "")
            Sleep, 150
            SendInput, %fechaLimpia%
            Sleep, 150

            ; --- TERMINAR Y RESTAURAR TECLADO ---
            Clipboard := PortapapelesAnterior ; Le devolvemos al usuario lo que tenía copiado antes de usar el script
    }

    CopiarYPegarCaratula()
    {
            Click, 314, 200
            Send, ^a
            Send, ^c
            Sleep, 100
            Click, 320, -323 ; Click núm exp pegar
            Send, ^a
            Sleep, 100
            Send, ^v
            Click, 515, 714   ; Doble click año copiar
            Sleep, 100
            Send, ^a
            Send, ^c
            Sleep, 100
            Click, 515, -323  ; Doble click año pegar
            Send, ^a
            Send, ^v
            Click, 900, 840  ; Seleccionar caratula copiar
            Send, ^a
            Send, ^c
            Click, 923, -197 ; Seleccionar caratula pegar
            Sleep, 50
            Send, ^a
            Send, ^v
    }

    CopiarYPegarCaratulaFormulario()
    {
            Click, 314, 200
            Send, ^a
            Send, ^c
            Sleep, 100
            Click, 320, -323 ; Click núm exp pegar
            Send, ^a
            Sleep, 100
            Send, ^v
            Click, 515, 714   ; Doble click año copiar
            Sleep, 100
            Send, ^a
            Send, ^c
            Sleep, 100
            Click, 515, -323  ; Doble click año pegar
            Send, ^a
            Send, ^v
            Click, 900, 840  ; Seleccionar caratula copiar
            Send, ^a
            Send, ^c
            Click, 923, -197 ; Seleccionar caratula pegar
            Sleep, 50
            Send, ^a
            Send, ^v
            Click, 665, 702 ; Alcance
            Send, ^a
            Send, ^c
            Click, 665, -334 ; Alcance
            Send, ^a
            Send, ^v
            Click, 761, 702 ; Cuerpo
            Send, ^a
            Send, ^c
            Click, 761, -334 ; Cuerpo
            Send, ^a
            Send, ^v
        
        ; --- BAJAR FORMULARIO ---
            Send, {Ctrl Up}
            Click, 923, 336
            Send, {End}
            Click, 923, 857
            Send, {End}
            Sleep, 150

            ; --- COPIADO EMPRESA ---
            Click, 621, 151  
            Send, ^a
            Sleep, 50
            Send, ^c
            Click, 621, -365 
            Send, ^a
            Sleep, 50
            Send, ^v

            ; --- COPIADO NUMERO FACTURA ---
            Send, {Ctrl Up}
            Click, 912, 669  
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 912, -365 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- COPIADO NUMERO ORDEN DE PAGO ---
            Send, {Ctrl Up}
            Click, 342, 787  
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 342, -245 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- COPIADO RECIBO DE PAGO ---
            Send, {Ctrl Up}
            Click, 912, 787   
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 912, -245 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- COPIADO REGISTRO DEVENGADO ---
            Send, {Ctrl Up}
            Click, 912, 728 
            Sleep, 50
            Send, ^a
            Sleep, 50
            Send, ^c
            Sleep, 100
            Click, 912, -304 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v

            ; --- COPIADO REGISTRO COMPROMISO ---
            Send, {Ctrl Up}
            Click, 342, 845 
            Sleep, 50
            Send, ^a
            Sleep, 50
            Send, ^c
            Sleep, 100
            Click, 342, -187 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v

            ; --- COPIADO ORDEN DE COMPRA ---
            Send, {Ctrl Up}
            Click, 342, 669
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 342, -365 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- NUMERO ORDEN DE CANCELACION ---
            Send, {Ctrl Up}
            Click, 625, 787
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 625, -245 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- NUMERO ALTA PROVISIONAL BIENES ---
            Send, {Ctrl Up}
            Click, 625, 847
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, {Ctrl Down}c{Ctrl Up}
            ClipWait, 0.15, 1
            if (ErrorLevel = 0)
            {
                TextoCasilla := Trim(Clipboard)
                if (TextoCasilla != "") 
                {
                    Sleep, 100
                    Click, 625, -185 
                    Sleep, 150
                    Click
                    Sleep, 100
                    Send, ^a
                    Sleep, 100
                    Send, ^v
                    Sleep, 150
                }
            }
            else
            {
                Send, {Ctrl Up}
                DllCall("Ole32.dll\OleFlushClipboard")
                Sleep, 50
                Send, !{Tab}
                Send, {Alt Up}
                Sleep, 100
            }

            ; --- NUMERO SOLICITUD DE PEDIDO ---
            Click, 912, 847 
            Sleep, 50
            Send, ^a
            Sleep, 50
            Clipboard := ""
            Send, ^c
            Sleep, 100
            Click, 912, -185 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v

            ; --- NUMERO SOLICITUD DE GASTO ---
            Click, 342, 907
            Sleep, 50
            Send, ^a
            Sleep, 50
            Send, ^c
            Sleep, 100
            Click, 342, -127 
            Sleep, 100
            Send, ^a
            Sleep, 100
            Send, ^v
            Sleep, 300
    }

    CrearExpNuevoYEscaneo()
    {
            Click, 945, 360
            Sleep, 100
            Send, {End}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 500
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 300
            Click, 504, 377
            Sleep, 200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1433, 80  ; Pegar (Uploader)
            Sleep, 100
            Click, 44, 584    ; Nuevo documento (Omnipage)
            Sleep, 100
            Click, 79, 107    ; Dig (Omnipage)
            Sleep, 100
    }

    CrearExpNuevoMismaIMG()
    {
            Click, 945, 360
            Sleep, 100
            Send, {End}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 500
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 300
            Click, 504, 377
            Sleep, 200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1433, 80  ; Pegar (Uploader)
            Sleep, 100
            Click, 100, 630   ; Dig (Omnipage)
            Sleep, 100
            Click, 19, 106    ; Si procesar todas las páginas (Omnipage)
            Sleep, 400
            Click, 160, 226  ; Aceptar (Omnipage)
            Sleep, 200
    }

    CrearExpNuevoMismaIMG_inyect()
    {
            Click, 945, 360
            Sleep, 100
            Send, {End}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 500
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 300
            Click, 504, 377
            Sleep, 200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1433, 80  ; Pegar (Uploader)
            Sleep, 100
            Click, 103, 201
        ; =========================================================================
        ;CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
        WinWait, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
        WinActivate, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
    }

    AbrirEscaneo()
    {
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 421, 704
            Sleep, 500
            WinWaitClose, ahk_exe TwainClientU.exe
            Sleep, 300
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
            return
        }
    }

    CerrarEscaneo()
    {
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 480, 20    ; Cerrar (Nuance escaner)
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
        }
    }

    GuardarYRepetir()
    {
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
            Send, ^r
            Sleep, 1000
            Run, brave.exe --new-window "http://192.168.0.11/digexp/documentos/editar"
            Sleep, 500
        WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos ARRIBA a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 0, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva%

        }
    }

    GuardarYRepetir2()
    {
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
            Send, ^r
            Sleep, 200
            Click, 240, 533
            Sleep, 500
            Run, brave.exe --new-window "http://192.168.0.11/digexp/documentos/editar"
            Sleep, 500
        WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos ARRIBA a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 0, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva%
        }
    }

    GuardarYNuevo() ;REVISAR
    {
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
            Send, ^r
            Sleep, 200
            Click, 240, 538
            Sleep, 500
            Send, ^{F4}
            Run, brave.exe --new-window "http://192.168.0.11/digexp/documentos/editar"
            Sleep, 700
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos ARRIBA a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 0, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
            }
            Sleep, 200
            CoordMode, Mouse, Screen
            Sleep, 200
            Click, 315, 182
            Sleep, 500
            CoordMode, Mouse, Window
    }

    SubidaUploader()
    {
        ;SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
        Sleep, 100
        WinActivate, ahk_exe OmniPageUploader.exe
        WinWaitActive, ahk_exe OmniPageUploader.exe
        Click, 103, 201
        ; =========================================================================
        ;CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
        WinWait, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
        WinActivate, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
    }

    Bucle1()
    {
            ;DETECTAR CAMBIOS EN LA CARPETA DE DOCUMENTOS

        folder := "C:\DOCUMENTOS\Imagenes"

        lastCount := -1
        lastSize := -1
        stable := 0

        Loop
        {
        FileCount := 0
        totalSize := 0

        Loop, Files, %folder%\*.jpg, F
        {
            FileCount++
            FileGetSize, size, %A_LoopFileFullPath%
            totalSize += size
        }

        if (FileCount != lastCount || totalSize != lastSize)
        {
            lastCount := FileCount
            lastSize := totalSize
            stable := 0
        }
        else
        {
            stable++
        }
        ; TIEMPO: 0.5 sec
        if (stable >= 1)
            break

        Sleep, 500
        }
    }

    Bucle2()
    {
            ;BUCLE PARA DETECTAR IMÁGENES CARGANDO
        Loop
        {
        ControlGetText, TextoBoton, BarButton2, ahk_exe Omnipage19.exe
        if (TextoBoton != "x") 
        {
            break ; El botón ya cambió, salimos de este bucle de espera inicial
        }
        Sleep, 200
        }
        ; =========================================================================
        ;BUCLE PARA DETECTAR IMÁGENES GUARDADAS
        Loop
        {
        ControlGetText, TextoBoton, BarButton2, ahk_exe Omnipage19.exe
        
        ; Si el botón volvió a decir "Guardar", el proceso terminó
        if (TextoBoton = "x")
        {
            break ; Rompe el bucle para continuar
        }
        Sleep, 300
        }
    }

; ================================================================================================================================================
; SIN CARATULA
; ================================================================================================================================================

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A HACIENDA (SIN CARATULA)
; =========================================================================
NumpadDot::
    Click, 816, 433
    Sleep, 200
    SendInput, HAC{ENTER}
    Sleep, 100
    Click, 670, 175  ;Seleccionar alcance
    Sleep, 200
    SendInput, 99
    Sleep, 100
    Click, 880, 300   ; Seleccionar caratula
    return

; =========================================================================
; CREAR FORMULARIO 29 EN HACIENDA (SIN CARATULA)
; =========================================================================
;(+)
NumpadAdd::
    ; =========================================================================
    CrearExpNuevoYEscaneo()
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 300
            Click, 670, 182  ;Seleccionar alcance
            Sleep, 200
            SendInput, 99
            Sleep, 100
            Send, !{Tab}
            Sleep, 500
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
            Sleep, 100
    ; =========================================================================
    CopiarYPegarFormulario()
    ; =========================================================================
    Send, {NumpadMult}
    Return

; =========================================================================
; CREAR FORMULARIO 29 EN CONTADURIA (SIN CARATULA)
; =========================================================================
;(*)
NumpadMult::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYRepetir2()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, PA{ENTER}
            Sleep, 300
            Click, 670, 182  ;Seleccionar alcance
            Sleep, 200
            SendInput, 99
            Sleep, 100
            Send, !{Tab}
            Sleep, 500
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
            Sleep, 100
    ; =========================================================================
    CopiarYPegarFormulario()
    ; =========================================================================
    Send, {NumpadDiv}
    Return

; =========================================================================
; CREAR FORMULARIO 29 EN PATRIMONIO (SIN CARATULA)
; =========================================================================
;(/)
NumpadDiv::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYNuevo()
    ; =========================================================================
    Return

; ================================================================================================================================================
; CON CARATULA
; ================================================================================================================================================

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A HACIENDA (CON CARATULA)
; =========================================================================
RCtrl & NumpadDot::
    Click, 816, 453
    Sleep, 200
    SendInput, HAC{ENTER}
    Sleep, 100
    Click, 880, 320   ; Seleccionar caratula
    return

; =========================================================================
; CREAR EXP EN HACIENDA (CON CARATULA)
; =========================================================================
;(CTRL +)
RCtrl & NumpadAdd::
    ; =========================================================================
    CrearExpNuevoYEscaneo()
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratula()
    ; =========================================================================
    Send, {RCtrl}{NumpadMult}
    Return

; =========================================================================
; CREAR EXP EN CONTADURIA (CON CARATULA)
; =========================================================================
;(CTRL *)
RCtrl & NumpadMult::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYRepetir2()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, PA{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratula()
    ; =========================================================================
    Send, {NumpadDiv}
    Return

; =========================================================================
; CREAR FORMULARIO 29 EN HACIENDA (CON CARATULA)
; =========================================================================
|::
    ; =========================================================================
    CrearExpNuevoMismaIMG()
    ; =========================================================================
    CerrarEscaneo()
    ; =========================================================================
    Bucle2()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 300
            Click, 670, 182  ;Seleccionar alcance
            Sleep, 200
            SendInput, 99
            Sleep, 100
            Send, !{Tab}
            Sleep, 500
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
            Sleep, 100
    ; =========================================================================
    CopiarYPegarFormulario()
    ; =========================================================================
    Send, {NumpadMult}
    Return

; ================================================================================================================================================
; CON CARATULA Y SUB FORMULARIO
; ================================================================================================================================================

; =========================================================================
; CREAR EXP EN HACIENDA (CON CARATULA Y SUB FORMULARIO)
; =========================================================================
LCtrl & F1::
    ; =========================================================================
    CrearExpNuevoYEscaneo()
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratulaFormulario()
    ; =========================================================================
    Send, {LCtrl}{F2}
    Return

; =========================================================================
; CREAR EXP EN CONTADURIA (CON CARATULA Y SUB FORMULARIO)
; =========================================================================
LCtrl & F2::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYRepetir2()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, PA{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratulaFormulario()
    ; =========================================================================
    Send, {NumpadDiv}
    Return

; =================================================================================================================================================
; ATAJOS DE TECLADO SUBFORMULARIO
; =================================================================================================================================================

; =========================================================================
; ORDEN DE COMPRA
; =========================================================================
{::
    Click, 336, 151
    Return

; =================================================================================================================================================
; SUBIDA MANUAL
; =================================================================================================================================================

    F1::
        ; =========================================================================
        CrearExpNuevoYEscaneo()
        ; =========================================================================
        AbrirEscaneo()
    Return

    F2::
    SubidaUploader()
    Return

    F3::
    GuardarYRepetir()
        ; =========================================================================
                Sleep, 200
                Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
                Sleep, 200
                SendInput, CONTAD{ENTER}
                Sleep, 300
                Click, 670, 182  ;Seleccionar alcance
                Sleep, 200
                SendInput, 99
                Sleep, 100
                Send, !{Tab}
                Sleep, 500
                WinGet, IDVentanaActiva, ID, A
                if (IDVentanaActiva) {
                ; Forzamos a que se restaure por si está maximizada
                WinRestore, ahk_id %IDVentanaActiva%
                ; La movemos abajo a la izquierda
                WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
                ; La mantiene al frente y enfocada
                WinActivate, ahk_id %IDVentanaActiva% 
        }
                Sleep, 100
        ; =========================================================================
        CopiarYPegarFormulario()
    Return

    F4::
    CrearExpNuevoMismaIMG()
        ; =========================================================================
        CerrarEscaneo()
        ; =========================================================================
        Bucle2()
        ; =========================================================================
        SubidaUploader()
    Return

    F8::
    GuardarYRepetir2()
        ; =========================================================================
                Sleep, 200
                Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
                Sleep, 200
                SendInput, PA{ENTER}
                Sleep, 300
                Click, 670, 182  ;Seleccionar alcance
                Sleep, 200
                SendInput, 99
                Sleep, 100
                Send, !{Tab}
                Sleep, 500
                WinGet, IDVentanaActiva, ID, A
                if (IDVentanaActiva) {
                ; Forzamos a que se restaure por si está maximizada
                WinRestore, ahk_id %IDVentanaActiva%
                ; La movemos abajo a la izquierda
                WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
                ; La mantiene al frente y enfocada
                WinActivate, ahk_id %IDVentanaActiva% 
        }
                Sleep, 100
        ; =========================================================================
        CopiarYPegarFormulario()
    Return

    F9::
    GuardarYNuevo()
    Return

