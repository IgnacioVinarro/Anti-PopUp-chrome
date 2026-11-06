; =========================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; =========================================================================
#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2          ; Permite buscar partes del título (ej. "Documentos")
MsgBox, 64, Script Listo, El script se ha iniciado correctamente.
Return

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
NumLock::ExitApp

; =========================================================================
; INICIAR SESION
; =========================================================================
F12::
     Click, 27, 347
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
     Send, http://192.168.0.11/hcexp/private/hc-crear-editar{ENTER}
     Sleep, 300
     Click, 459, 285
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
    Sleep, 100
    Click, 79, 107
    Sleep, 200
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    return

; NumpadDot:
NumpadDot::
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

; F8: Salvar
F8::
    Click, 102, 62
    Sleep, 300
    Click, 171, 120
    Sleep, 200
    Click, 171, 120
    Sleep, 300
    Click, 124, 118
    Sleep, 300
    Click, 102, 62
    Sleep, 300
    Click, 386, 114
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

; F10: Pegar DNI
F10::
    Send, ^v
    Send, ^{Backspace}
    Send, ^{Backspace}
    Click, 740, 240
    Sleep, 100
    Click, 774, 291
    Sleep, 300
    Click, 623, 370
return


; F1: Guardar
F1::
    Click, 790, 470
    Sleep, 100
    Click, 790, 470
    Sleep, 300
    Click, 386, 114
    Sleep, 100
    Click, 1381, 100
    Sleep, 100
    Click, 44, 584
    Sleep, 100
    Click, 79, 107
    Sleep, 200
    if WinExist("ahk_exe omnipage19.exe") {
    WinWaitActive, ahk_exe TwainClientU.exe, , 6
    WinActivate, ahk_exe TwainClientU.exe
    Sleep, 200
    Click, 421, 704
} else {
    MsgBox, 48, Error, TwainClientU.exe no está abierto.
}
return

; F2: Copiar
F2::
    Click, 447, -340
return

; F3: Pegar
F3::
    Click, 150, 130
    Sleep, 300
    Click, -67, 114
    Sleep, 1000
    Click, 124, 115
    Sleep, 200
    Click, 124, 115
return

; F4: Copiar
F4::
    Click, 102, 62
    Sleep, 300
    Click, 26, 186
    Sleep, 3250
    Click, 914, 111
    Sleep, 300
    Click, 462, 292
return

; F9: Pegar DNI
F9::
    Click, 102, 62
    Sleep, 300
    Click, 26, 186
    Sleep, 3250
    Click, 914, 111
    Sleep, 300
    Click, 462, 292
    Send, ^v
    Send, ^{Backspace}
    Send, ^{Backspace}
    Click, 740, 240
    Sleep, 100
    Click, 774, 291
    Sleep, 300
    Click, 623, 370
return