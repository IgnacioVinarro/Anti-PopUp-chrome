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
     Click, 27, 333
     Sleep, 400
     Click, 616, 234
     Sleep, 100
     Send, CUIT
     Sleep, 100
     Send, {Tab}
     Sleep, 100
     Send, PASSWORD{ENTER}
return

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A APREMIOS
; =========================================================================
NumpadDot::
    Click, 816, 453 ; Seleccionar menu tipo exp
    Sleep, 200
    Send, APREMIOS{ENTER}
    Sleep, 200
    Click, 328, 195
return

; =========================================================================
; CREAR EXP EN APREMIOS Y ESCANEO
; =========================================================================
F1::
    Click, 958, 485
    Sleep, 100
    Click, 958, 485
    Sleep, 100
    Click, 827, 455
    Sleep, 1500
    Click, 494, 377
    Sleep, 500
    Click, 593, 120
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

; =========================================================================
; SUBIR ARCHIVOS AL UPLOADER Y ABRIR NUEVA PESTAÑA
; =========================================================================
F2::
    Click, 447, -340
    Sleep, 300
    Click, -658, 21
    Sleep, 300
    Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
    Sleep, 1000
    Click, 328, 195
return

; =========================================================================
; GUARDAR IMÁGENES Y SELECCIONAR PESTAÑA NUEVA
; =========================================================================
F3::
    ; Buscamos y activamos UploadFiles
    if WinExist("ahk_exe uploadfiles.exe") {
    WinActivate, ahk_exe uploadfiles.exe
    WinWaitActive, ahk_exe uploadfiles.exe, , 2
    Send, {ENTER}
    Sleep, 300
    Click, -816, 18
    Sleep, 300
    Click, 851, 146
    Sleep, 1000
    Click, 480, 400   ; Ok (boton violeta)
    Sleep, 300
    Send, {End}
    Sleep, 300
    Click, 827, 454   ; Guardar (Boton verde)
    Sleep, 300
    Click, 494, 377   ; Guardar (Boton violeta)
    Sleep, 300
    Send, ^{F4}
    Sleep, 300
    Click, 328, 195
} else {
    MsgBox, 48, Error, UploadFiles.exe no está abierto.
}
return

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A APREMIOS
; =========================================================================
F4::
    Click, 816, 453 ; Seleccionar menu tipo exp
    Sleep, 200
    Send, APREMIOS{ENTER}
    Sleep, 200
    Click, 66, 305
return

; =========================================================================
; VOLVER A SUBIR IMAGENES
; =========================================================================
F8::
    Click, 102, 62
    Sleep, 800
    Click, 191, 129
    Sleep, 500
    Click, 805, 176
    Sleep, 500
    Click, 528, 398
    Sleep, 500
    Click, 486, 400
    Sleep, 300
    Click, 828, 273
    Sleep, 300
    Click, 525, 381
    Sleep, 300
    Click, 451, 379
    Sleep, 1000
    Click, 593, 103
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
