; ==================================================================================================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; ==================================================================================================================================================
    #NoEnv
    #SingleInstance Force
    SetWorkingDir %A_ScriptDir%
    SetTitleMatchMode, 2          ; Permite buscar partes del título (ej. "Documentos")
    MsgBox, 64, Script Listo, El script se ha iniciado correctamente.
    CoordMode, Mouse, Window
    Return

;ZOOM AL 90%

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
    ; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
    NumLock::ExitApp

; =========================================================================
; RECARGAR ESTADÍSTICAS (CADA 5 MINUTOS)
; =========================================================================
; --- ACTIVACIÓN ---
F1::
    ; Ejecuta los clics inmediatamente la primera vez
    Gosub, MiAccion 
    
    ; Activa el temporizador para repetir cada 5 minutos (300,000 ms)
    SetTimer, MiAccion, 30000 
    ToolTip, Script Activado ; Muestra un pequeño mensaje flotante
    Sleep, 1000
    ToolTip ; Quita el mensaje
return

; --- PAUSA ---
F2::
    SetTimer, MiAccion, Off ; Apaga el temporizador
    ToolTip, Script Pausado
    Sleep, 1000
    ToolTip
return

; --- ACCIÓN ---
MiAccion:
    Click, 912, 134
    Sleep, 1000
    Click, 1875, 128
return