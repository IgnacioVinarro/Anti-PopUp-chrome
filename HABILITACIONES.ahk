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

; =========================================================================================================================================================================================================================
; INICIO SCRIPT
; =========================================================================================================================================================================================================================

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
            Sleep, 300
            Click, 504, 377
            Sleep, 200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1695, 143  ; Pegar (Uploader)
            Sleep, 100
    }

    AbrirEscaneo()
    {
        Click, 44, 584    ; Nuevo documento (Omnipage)
        Sleep, 100
        Click, 79, 107    ; Dig (Omnipage)
        Sleep, 100
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 421, 619
            Sleep, 500
            WinWaitClose, ahk_exe TwainClientU.exe
            Sleep, 300
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
            return
        }
    }

    SubidaUploader(){
        ;SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
        Sleep, 100
        WinActivate, ahk_exe Uploader.exe
        WinWaitActive, ahk_exe Uploader.exe
        Click, 141, 281
        ; =========================================================================
        ;CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
        WinWait, Carga completa ahk_exe Uploader.exe
        Sleep, 200
        WinActivate, Carga completa ahk_exe Uploader.exe
        Sleep, 200
    }

    GuardarYNuevo() ;REVISAR
    {
            Send, {Enter}
            Sleep, 300
            Click, -5, 485    ; Bajar barra pestaña Google
            Sleep, 300
            Click, 851, 146   ; Cargar imágenes (boton blue)
            Sleep, 2500
            Click, 480, 400   ; Ok (boton violeta)
            Sleep, 500
            Send, {End}
            Sleep, 100
            Send, {WheelDown 10}
            Sleep, 100
            Send, {WheelDown 10}
            Sleep, 100
            Send, {WheelDown 10}
            Sleep, 100
            Send, {WheelDown 10}
            Sleep, 100
            Send, {WheelDown 10}
            Sleep, 100
            Send, {WheelDown 10}
            Sleep, 300
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 1000
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 1000
            Send, ^l
            Sleep, 300
            SendInput, http://192.168.0.11/digexp/documentos/editar{ENTER}
            Sleep, 700
            Click, 331, 182
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

; ==============================================================================================================================================
; DIGITALIZACION
; ==============================================================================================================================================

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A HABILITACIONES
; =========================================================================
NumpadDot::
    Click, 816, 453
    Sleep, 200
    SendInput, HAB{ENTER}
    Sleep, 100
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
    Click, 447, 114
    return

; =========================================================================
; CREAR EXPEDIENTE EN HABILITACIONES
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
    GuardarYNuevo()
    ; =========================================================================
    return
