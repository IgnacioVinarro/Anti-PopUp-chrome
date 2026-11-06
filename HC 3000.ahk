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

; NumpadAdd (+): (Guardar) (Crear HC)
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
        if WinExist("ahk_exe omnipage19.exe") {
    WinWaitActive, ahk_exe TwainClientU.exe, , 6
    WinActivate, ahk_exe TwainClientU.exe
    Sleep, 200
    Click, 421, 704
} else {
    MsgBox, 48, Error, TwainClientU.exe no está abierto.
}
return

; NumpadSub (-): (Subir archivos) (Uploader) (Chrome) (Nueva HC distinta anterior)
NumpadSub::
    Click, 447, -340
    Sleep, 300
    Click, -147, 18
    Sleep, 300
    Send, ^t
    Sleep, 300
    Send, http://192.168.0.11/hcexp/private/hc-crear-editar{ENTER}
    Sleep, 300
    Click, 712, 292
return

; NumpadMult (*): (Subir archivos) (Uploader) (Chrome) (Nueva HC idem anterior)
NumpadMult::
    Click, 447, -340
    Sleep, 300
    Click, -147, 18
    Sleep, 300
    Send, ^t
    Sleep, 300
    Send, http://192.168.0.11/hcexp/private/hc-crear-editar{ENTER}
    Sleep, 300
    Click, 712, 292
    Send, ^v
    Send, ^{Backspace}
    Send, ^{Backspace}
    Click, 740, 240
    Sleep, 100
    Click, 774, 291
    Sleep, 300
    Click, 623, 370
return

; NumpadDiv (/): (Subir y guardar) (Chrome) (Guardar) (Crear HC)
NumpadDiv::
    Click, 1021, 596
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
    Sleep, 100
            if WinExist("ahk_exe omnipage19.exe") {
    WinWaitActive, ahk_exe TwainClientU.exe, , 6
    WinActivate, ahk_exe TwainClientU.exe
    Sleep, 200
    Click, 421, 704
} else {
    MsgBox, 48, Error, TwainClientU.exe no está abierto.
}
return

; NumpadDot (.): (Subir y guardar) (Chrome) (Nueva HC distinta anterior)
NumpadDot::
    Click, 1021, 596
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
    Click, 462, 292
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
    Sleep, 2000
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
    Sleep, 3500
    Click, 914, 111
    Sleep, 300
    Click, 712, 292
return

; F9: Pegar DNI
F9::
    Click, 102, 62
    Sleep, 300
    Click, 26, 186
    Sleep, 3500
    Click, 914, 111
    Sleep, 300
    Click, 712, 292
    Send, ^v
    Send, ^{Backspace}
    Send, ^{Backspace}
    Click, 740, 240
    Sleep, 100
    Click, 774, 291
    Sleep, 300
    Click, 623, 370
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

; F7: Finalizar escaneo
F7::
    Click, 423, 463
    Sleep, 700
    Click, 167, 102
return