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

; ==============================================================================================================================================
; FUNCIONES GLOBALES
; ==============================================================================================================================================
    AbrirEscaneo()
    {
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 421, 704
            Sleep, 500
            WinWaitClose, ahk_exe TwainClientU.exe
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
            return
        }
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

    SubidaUploader()
    {
        ;SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
        Sleep, 100
        WinActivate, ahk_exe uploadfiles.exe
        WinWaitActive, ahk_exe uploadfiles.exe
        Click, 463, 172
        Sleep, 300
        Click, -658, 21
        Sleep, 300
        Click, 361, 490
        Sleep, 300
        Click, 459, 285
    }

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
    ;MouseMove, 219, 116
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
    Send, {NumpadSub}
    Bucle2()
    SubidaUploader()
    return

; =========================================================================
; FINALIZAR ESCANEO (-)
; =========================================================================
NumpadSub::
    WinActivate, ahk_exe TwainClientU.exe
    Click, 404, 206
    WinWaitClose, ahk_exe TwainClientU.exe
    Sleep, 100
    SendInput, {Enter}
    return


;COMIENZO
; NumpadAdd (+): (Guardar) (Crear HC) (F1)
NumpadAdd::
    Click, 790, 470
    Sleep, 100
    Click, 790, 470
    Sleep, 300
    Click, 386, 114
    Sleep, 100
    Click, 1381, 100
    Sleep, 100
    Click, 44, 584
    Sleep, 200
    Send, {F1}
   return

; NumpadMult:
NumpadMult::
    WinActivate, ahk_exe uploadFiles.exe
    Sleep, 200
    Send, {Enter}
    Sleep, 300
    Click, -816, 18
    Sleep, 300
    Click, 890, 120
    Sleep, 1000
    Click, 124, 115
    Sleep, 200
    Click, 124, 115
    Sleep, 300
    Click, 264, 19
    Sleep, 300
    Send, {NumpadAdd}
return

