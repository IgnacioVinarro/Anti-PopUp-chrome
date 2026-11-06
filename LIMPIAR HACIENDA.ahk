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

; =========================================================================
; Bucle
; =========================================================================

NumpadAdd:: ;(+)
Loop
{
Click, 1090, 450
SendInput, 5308{Enter}
Sleep, 200
Send, {F1}
Sleep, 300
Send, {Enter}
Sleep, 500
Send, ^{F4}
Sleep, 300
}
return

NumpadSub:: ;(-) 33
; Sumar 33 a coord Y
Send, {Ctrl Down}
Click, 1482, 396
Click, 1482, 429
Click, 1482, 462
Click, 1482, 495
Click, 1482, 528
Click, 1482, 562
Click, 1482, 595
Click, 1482, 628
Click, 1482, 661
Click, 1482, 694
Click, 1482, 727
Click, 1482, 760
Click, 1482, 793
Click, 1482, 826
Click, 1482, 859
Click, 1482, 892
Click, 1482, 925
Click, 1482, 958
Click, 1482, 991
Click, 1482, 1024
Send, {Ctrl Up}
Sleep, 100
Send, {Down 10}
Sleep, 100
Send, {Ctrl Down}
Click, 1482, 624
Click, 1482, 657
Click, 1482, 690
Click, 1482, 723
Click, 1482, 756
Click, 1482, 789
Click, 1482, 822
Click, 1482, 855
Click, 1482, 888
Click, 1482, 921
Click, 1482, 954
Click, 1482, 987
Click, 1482, 1020
Send, {Ctrl Up}
return

NumpadMult:: ;45
Send, {Ctrl Down}
Click, 1482, 396
Click, 1482, 429
Click, 1482, 462
Click, 1482, 495
Click, 1482, 528
Click, 1482, 562
Click, 1482, 595
Click, 1482, 628
Click, 1482, 661
Click, 1482, 694
Click, 1482, 727
Click, 1482, 760
Click, 1482, 793
Click, 1482, 826
Click, 1482, 859
Click, 1482, 892
Click, 1482, 925
Click, 1482, 958
Click, 1482, 991
Click, 1482, 1024
Send, {Ctrl Up}
Sleep, 100
Send, {Down 10}
Sleep, 100
Send, {Ctrl Down}
Click, 1482, 624
Click, 1482, 657
Click, 1482, 690
Click, 1482, 723
Click, 1482, 756
Click, 1482, 789
Click, 1482, 822
Click, 1482, 855
Click, 1482, 888
Click, 1482, 921
Click, 1482, 954
Click, 1482, 987
Click, 1482, 1020
Send, {Ctrl Up}
Sleep, 100
Send, {Down 10}
Sleep, 100
Send, {Ctrl Down}
Click, 1482, 650
Click, 1482, 683
Click, 1482, 716
Click, 1482, 749
Click, 1482, 782
Click, 1482, 815
Click, 1482, 848
Click, 1482, 881
Click, 1482, 914
Click, 1482, 947
Click, 1482, 980
Click, 1482, 1013
Send, {Ctrl Up}
return

NumpadDiv::
Send, {Down 10}
return