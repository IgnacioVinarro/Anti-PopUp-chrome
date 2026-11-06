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
; CONFIGURACIÓN ADICIONAL (Opcional)
; =========================================================================

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
NumLock::ExitApp

; =========================================================================
; INICIAR SESION
; =========================================================================
F12::
     Click, 616, 234
     Sleep, 100
     Send, ;REEMPLAZAR POR CUIT
     Sleep, 100
     Send, {Tab}
     Sleep, 100
     Send, ;REEMPLAZAR POR CONTRASEÑA (DEJAR ENTER){ENTER}
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

; =========================================================================
; SI SE SALE EL ESCANEO
; =========================================================================
RCtrl & NumpadAdd::
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
; PESTAÑA SELECCIONADA A EXP CREAR
; =========================================================================
RCtrl & F12::
        Send, ^l
        Sleep, 100
        Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
        Sleep, 300
        Click, 330, 180
return

; =========================================================================
; CONFIGURACIÓN ADICIONAL PROPIA DE LA DIRECCION (Opcional)
; =========================================================================

; =========================================================================
; CLICK TIPO DE TRAMITE
; =========================================================================
RCtrl & NumpadDot::
Click, 928, 368
return

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A COMPRAS
; =========================================================================
NumpadDot::
;COMIENZO EDIT
    Click, 928, 368
    Sleep, 100
    Send, INSCRIPCION PROVEEDOR
    Sleep, 100
    Send, {Down}{ENTER}
    Sleep, 200
;FIN EDIT
    Click, 816, 453 ; Seleccionar menu tipo exp
    Sleep, 200
    Send, COMPRAS{ENTER}
    Sleep, 200
    Send, {WheelDown 3}
    Sleep, 200
    Click, 475, 331   ; Numero de providencia
return

; =========================================================================
; INICIO SCRIPT
; =========================================================================

; =========================================================================
; CREAR EXP EN COMPRAS Y ESCANEO
; =========================================================================
F1::
    Send, {WheelDown 3}
    Sleep, 300
    Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
    Sleep, 1500
    Click, 494, 377   ; Guardar (Boton violeta)
    Sleep, 500
;Agregar boton extra cuando se guarda desde exp ya creado Coord: X: 504
    Click, 593, 120   ; Copiar  NUEVA COORD
    Sleep, 100
    Click, 1381, 100  ; Pegar (Uploader)
    Sleep, 100
    Click, 44, 584    ; Nuevo documento (Omnipage)
    Sleep, 100
    Click, 79, 107    ; Dig (Omnipage)
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
; SUBIR ARCHIVOS AL UPLOADER
; =========================================================================
F2::
    Click, 447, -340      ; Subir archivos
    Sleep, 300
Return

; =========================================================================
; SUBIR ARCHIVOS AL SERVIDOR
; =========================================================================
^F3::
        Send, {Enter}
        Sleep, 300
        Click, -97, 158   ; Cargar imágenes (boton blue)
        Sleep, 1000
        Click, 480, 400   ; Ok (boton violeta)
        Sleep, 300
        Send, {End}
        Sleep, 300
        Click, 827, 454   ; Guardar (Boton verde)
        Sleep, 300
        Click, 494, 377   ; Guardar (Boton violeta)
        Sleep, 300
        Send, ^r
return

; =========================================================================
; NUEVO EXP
; =========================================================================
F4::
       Send, ^l
       Sleep, 100
       Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
       Sleep, 300
       Click, 330, 180
return

; =========================================================================
; TODO JUNTO
; =========================================================================
F3::
        Send, {Enter}
        Sleep, 300
        Click, -97, 158   ; Cargar imágenes (boton blue)
        Sleep, 1000
        Click, 480, 400   ; Ok (boton violeta)
        Sleep, 300
        Send, {End}
        Sleep, 300
        Click, 827, 454   ; Guardar (Boton verde)
        Sleep, 300
        Click, 494, 377   ; Guardar (Boton violeta)
        Sleep, 300
        Send, ^l
        Sleep, 100
        Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
        Sleep, 300
        Click, 330, 180
return

; =========================================================================
; ADDONS
; =========================================================================

; =========================================================================
; CREAR EXP EN COMPRAS Y ESCANEO
; =========================================================================
; NumpadAdd (+)
NumpadAdd::
    Send, {WheelDown 3}
    Sleep, 300
    Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
    Sleep, 1500
    Click, 494, 377   ; Guardar (Boton violeta)
    Sleep, 500
;Agregar boton extra cuando se guarda desde exp ya creado Coord: X: 504
    Click, 593, 120   ; Copiar  NUEVA COORD
    Sleep, 100
    Click, 1381, 100  ; Pegar (Uploader)
    Sleep, 100
    Click, 44, 584    ; Nuevo documento (Omnipage)
    Sleep, 100
    Click, 79, 107    ; Dig (Omnipage)
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
; SUBIR ARCHIVOS AL UPLOADER
; =========================================================================
; NumpadSub (-)
NumpadSub::
    Click, 447, -340      ; Subir archivos
    Sleep, 300
    Click, -658, 21
    Sleep, 300
    Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
    Sleep, 1000
    Click, 816, 453
    Sleep, 200
    Send, COMPRAS{ENTER}
    Sleep, 100
    Click, 328, 195
Return

; =========================================================================
; SUBIR ARCHIVOS AL SERVIDOR
; =========================================================================
; NumpadMult (*)
NumpadMult::
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
