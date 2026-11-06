ClipBackup := ClipboardAll
    
    ; Código JS que busca por clase, limpia espacios (.trim) y hace clic
    jsCode := "Array.from(document.querySelectorAll('button.btn-secondary')).find(el => el.textContent.trim() === 'Copiar').click();"
    Clipboard := jsCode
    ClipWait, 1

    ; Entrar a la barra de direcciones de Chrome
    Send, ^l
    Sleep, 150

    ; Escribimos "javascript:" manualmente (Chrome bloquea si se pega del portapapeles)
    SendRaw, javascript:
    
    ; Pegamos el código restante y ejecutamos con Enter
    Send, ^v
    Sleep, 50
    Send, {Enter}

    ; Restauramos el portapapeles original
    Sleep, 200
    Clipboard := ClipBackup



; =========================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; =========================================================================
#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2          ; Permite buscar partes del título (ej. "Documentos")
MsgBox, 64, Script Listo, El script se ha iniciado correctamente.
Return

F1::
    Click, 593, 120   ; Copiar  NUEVA COORD
    Sleep, 100
    Click, 1381, 100  ; Pegar (Uploader)
    Sleep, 100
        Click, 100, 630   ; Dig (Omnipage)
        Sleep, 100
        Click, 19, 106    ; Si procesar todas las páginas (Omnipage)
        Sleep, 400
        Click, 160, 226   ; Aceptar (Omnipage)
        Sleep, 200
Loop, 10 ; Intenta durante 2 segundos máximo (10 * 200ms)
{
    ControlGetText, TextoBoton, BarButton2, ahk_exe Omnipage19.exe
    if (TextoBoton != "x") 
    {
        break ; El botón ya cambió, salimos de este bucle de espera inicial
    }
    Sleep, 200
}
Loop
{
    ControlGetText, TextoBoton, BarButton2, ahk_exe Omnipage19.exe
    
    ; Si el botón volvió a decir "Guardar", el proceso terminó
    if (TextoBoton = "x")
    {
        break ; Rompe el bucle para continuar
    }
    Sleep, 300
    MouseMove, 530, 100
}
if WinExist("ahk_exe uploadfiles.exe") {
    WinActivate, ahk_exe uploadfiles.exe
    WinWaitActive, ahk_exe uploadfiles.exe, , 2
    
    ; --- Secuencia de clics para UploadFiles ---
    Click, 463, 172   ; Subir archivos
    Sleep, 100
} else {
    MsgBox, 48, Error, UploadFiles.exe no está abierto.
}
WinWait, Finalizado ahk_exe uploadFiles.exe
Sleep, 200
WinActivate, Finalizado ahk_exe uploadFiles.exe
Sleep, 200
        Send, {Enter}
        Sleep, 300
        Click, -5, 485    ; Bajar barra pestaña Google
        Sleep, 300
        Click, 851, 146   ; Cargar imágenes (boton blue)
return