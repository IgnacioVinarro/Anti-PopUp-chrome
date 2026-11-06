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

; ==============================================================================================================================================
; FUNCIONES GLOBALES
; ==============================================================================================================================================
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
            Sleep, 750
            Click, 504, 377
            Sleep, 1000
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1433, 80  ; Pegar (Uploader)
            Sleep, 100
            Click, 44, 584    ; Nuevo documento (Omnipage)
            Sleep, 100
            Click, 79, 107    ; Dig (Omnipage)
            Sleep, 100
    }

    AbrirEscaneo()
    {
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 421, 704
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
            return
        }
        WinWaitClose, ahk_exe TwainClientU.exe
        Sleep, 100
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

    Guardar()
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
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 300
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 500
            Send, ^l
            Sleep, 100
            SendInput, http://192.168.0.11/digexp/documentos/lista{ENTER}
            Sleep, 1000
            Click, 860, 480
    }

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
    Guardar()
    ; =========================================================================
    return

NumpadDot::
    ; =========================================================================
    Click, 591, 446
    Sleep, 100
    SendInput, 200000{ENTER}
    Sleep, 100
    ; =========================================================================
    Send, {NumpadAdd}
    ; =========================================================================
    return