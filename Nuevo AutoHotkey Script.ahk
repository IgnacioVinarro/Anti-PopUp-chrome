; ==================================================================================================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; ==================================================================================================================================================
    #NoEnv
    #SingleInstance Force
    SetWorkingDir %A_ScriptDir%
    SetTitleMatchMode, 2          ; Permite buscar partes del título (ej. "Documentos")
    CoordMode, Mouse, Window
    MsgBox, 64, Script Listo, El script se ha iniciado correctamente.
    Return

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
    ; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
    NumLock::ExitApp

F4::
    ; COPIADO (Ctrl + F)
    Send, ^f
    Sleep, 300
    SendRaw, Copiar
    Sleep, 300
    Send, {Esc}
    Sleep, 100
    Send, {Enter}
Return

;PRUEBA
ClickBotonCeleste()
{
Send, ^+i
Sleep, 1000
SendRaw, document.querySelector('button.btn-primary i.fa-print').parentElement.click()
Send, {Enter}
Sleep, 200
Send, ^+i
}

; =========================================================================
; COPIADO FORMULARIO Y SUBFORMULARIO (CTRL <)
; =========================================================================
LCtrl & <::
{
    ; Variable para guardar el portapapeles actual del usuario y no arruinarlo
    PortapapelesAnterior := ClipboardAll 

    ; --- COPIADO NUMERO EXPEDIENTE ---
    Send, {Ctrl Up}
    Sleep, 50
    Click, 333, 181 
    Sleep, 50
    Send, ^a ; Seleccionar todo
    Sleep, 50
    
    ; PROCESO DE COPIADO SEGURO
    Clipboard := "" ; Limpiamos el portapapeles
    Send, {Ctrl Down}c{Ctrl Up} ; Mandamos el comando de forma explícita y controlada
    ClipWait, 0.15, 1 ; Esperamos máximo 150 milisegundos. Si está vacío, va a dar timeout.
    
    if (ErrorLevel = 0) ; Si copió algo exitosamente
    {
        TextoCasilla := Trim(Clipboard)
        if (TextoCasilla != "") 
        {
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 333, -333 
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
        ; SI ESTABA VACÍO: Forzamos a Windows a entender que Ctrl se soltó y limpiamos el búfer
        Send, {Ctrl Up}
        DllCall("Ole32.dll\OleFlushClipboard") ; Comando del sistema para vaciar el búfer físico
        Sleep, 50
        Send, !{Tab}
    }

    ; --- COPIADO AÑO ---
    Send, {Ctrl Up}
    Click, 515, 696   
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
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 515, -336 
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
    }

    ; --- COPIADO CARATULA ---
    Send, {Ctrl Up}
    Click, 900, 821  
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
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 923, -210 
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
    }

    ; --- BAJAR FORMULARIO ---
    Send, {Ctrl Up}
    Click, 923, 336
    Send, {End}
    Click, 923, 857
    Send, {End}
    Sleep, 150

    ; --- COPIADO EMPRESA ---
    Send, {Ctrl Up}
    Click, 621, 151  
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
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 621, -365 
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
    }

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
            WinActivate, ahk_exe chrome.exe
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
            WinActivate, ahk_exe chrome.exe
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
            WinActivate, ahk_exe chrome.exe
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
    }

    ; --- COPIADO REGISTRO DEVENGADO ---
    Send, {Ctrl Up}
    Click, 912, 728 
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
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 912, -304 
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
    }

    ; --- COPIADO REGISTRO COMPROMISO ---
    Send, {Ctrl Up}
    Click, 342, 845 
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
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 342, -187 
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
    }

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
            WinActivate, ahk_exe chrome.exe
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
            WinActivate, ahk_exe chrome.exe
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
            WinActivate, ahk_exe chrome.exe
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
    }

    ; --- NUMERO SOLICITUD DE PEDIDO ---
    Send, {Ctrl Up}
    Click, 912, 847
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
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 912, -185 
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
    }

    ; --- NUMERO SOLICITUD DE GASTO ---
    Send, {Ctrl Up}
    Click, 342, 907
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
            WinActivate, ahk_exe chrome.exe
            Sleep, 100
            Click, 342, -127 
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
    }

    ; --- TERMINAR Y RESTAURAR TECLADO ---
    Clipboard := PortapapelesAnterior ; Le devolvemos al usuario lo que tenía copiado antes de usar el script
    Send, {Ctrl Up}
    Sleep, 100
    Click, 590, 210 
}
return


;ORDEN DE COMPRA
Ctrl & F1::
    Click, 342, 669
    Send, ^+{Up} 
    Send, ^c
    Click, 342, -365
    Send, ^+{Up}
    Send, ^v
    return

; Numero orden de cancelacion
Ctrl & F2::
    Click, 625, 787
    Send, ^+{Up}
    Send, ^c
    Sleep, 100
    Click, 625, -245
    Send, ^+{Up}
    Send, ^v
    return

;Numero alta provisional bienes
Ctrl & F3::
    Click, 625, 847
    Send, ^+{Up}
    Send, ^c
    Sleep, 100
    Click, 625, -185
    Send, ^+{Up}
    Send, ^v
    return

;Numero solicitud de pedido
Ctrl & F4::
    Click, 912, 847
    Send, ^+{Up}
    Send, ^c
    Sleep, 100
    Click, 912, -185
    Send, ^+{Up}
    Send, ^v
    return

;Numero solicitud de gasto
Ctrl & F5::
    Click, 342, 907
    Send, ^+{Up}
    Send, ^c
    Sleep, 100
    Click, 342, -127
    Send, ^+{Up}
    Send, ^v
    return
