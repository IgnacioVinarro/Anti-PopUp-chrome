#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

; Cierra el aviso de Chrome "Cambia tu contraseña" pulsando "Aceptar".
SetTitleMatchMode 2   ; el título solo necesita CONTENER el texto

SetTimer(CerrarAviso, 1000)

CerrarAviso() {
    static titulo := "Cambia tu contraseña ahk_exe chrome.exe"
    if !(hwnd := WinExist(titulo))
        return
    try {
        WinActivate(hwnd)
        if WinWaitActive(hwnd, , 1)
            Send("{Enter}")   ; "Aceptar" es el botón por defecto
    }
}