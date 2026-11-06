; ==================================================================================================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; ==================================================================================================================================================
    #SingleInstance Force
    SetWorkingDir(A_ScriptDir)
    SetTitleMatchMode(2)          ; Permite buscar partes del título (ej. "Documentos")
    CoordMode("Mouse", "Window")

    MsgBox("El script se ha iniciado correctamente.", "Script Listo", 64)

; ==================================================================================================================================================
; CONFIGURACIÓN ADICIONAL (Opcional)
; ==================================================================================================================================================

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
    ; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
    NumLock::ExitApp()

; =========================================================================
; INICIAR SESION
; =========================================================================
F12::
{
    Click(27, 333)
    Sleep(400)
    Click(616, 234)
    Sleep(100)
    Send("20472731336")
    Sleep(100)
    Send("{Tab}")
    Sleep(100)
    Send("1023{Enter}")
    Sleep(200)
    Send("^l")
    Sleep(100)
    Send("http://192.168.0.11/digexp/documentos/editar{Enter}")
    Sleep(300)
    Click(330, 180)
}

; =========================================================================
; PESTAÑA SELECCIONADA A EXP CREAR
; =========================================================================
RCtrl & F12::
{
    Send("^l")
    Sleep(100)
    Send("http://192.168.0.11/digexp/documentos/editar{Enter}")
    Sleep(300)
    Click(330, 180)
}

; =========================================================================
; SI SE SALE EL ESCANEO
; =========================================================================
RCtrl & NumpadSub:: ;(Ctrl -)
{
    ; Buscamos y activamos OmniPage
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinActivate("ahk_exe omnipage19.exe")
        if WinWaitActive("ahk_exe omnipage19.exe", , 2) 
        {
            ControlClick("ComboBox10", "A")
            Sleep(100)
            Click(19, 106)
            Sleep(400)
            Click(160, 226)
            Sleep(300)
                WinWaitActive("ahk_exe TwainClientU.exe")
                Sleep(200)
                WinActivate("ahk_exe TwainClientU.exe")
                Sleep(200)
                Click(421, 709)
        }
    } 
    else 
    {
        MsgBox("OmniPage19.exe no está abierto.", "Error", 48)
    }
}

; =========================================================================
; FINALIZAR ESCANEO
; =========================================================================
F7::
{
    Click(423, 463)
    Sleep(700)
    Click(167, 102)
}

; =========================================================================
; CONFIGURACIÓN ADICIONAL PROPIA DE LA DIRECCION (Opcional)
; =========================================================================

; =========================================================================
; BAJAR A SUBFORMULARIO (<)
; =========================================================================
<::
{
    Click(923, 336)
    Send("{End}")
    Sleep(300)
    Click(912, 152)
}

; =========================================================================
; COPIADO FORMULARIO Y SUBFORMULARIO (CTRL <)
; =========================================================================
LCtrl & <::
{
    ; Ajusta el delay de las pulsaciones para que el sistema asimile los comandos (20ms entre teclas, 20ms de presión)
    SetKeyDelay(20, 20)

    ; --- NÚMERO DE EXPEDIENTE ---
    Click(314, 200)
    Send("^+{Left}")
    A_Clipboard := "" ; Vacía el portapapeles para asegurar una copia limpia
    Send("^c")
    if !ClipWait(1) ; Espera hasta 1 segundo a que aparezca el texto
        return
    Sleep(120)       ; Pausa para estabilizar la interfaz
    
    Click(320, -323) ; Click núm exp pegar
    Send("^+{Left}")
    Sleep(100)
    Send("^v")
    Sleep(120)

    ; --- AÑO ---
    Click(515, 714)   ; Doble click año copiar
    Sleep(100)
    Send("^+{Up}")
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    Sleep(120)
    
    Click(515, -323)  ; Doble click año pegar
    Send("^+{Up}")
    Sleep(100)
    Send("^v")
    Sleep(120)

    ; --- CARÁTULA ---
    Click(900, 840)  ; Seleccionar caratula copiar
    Send("^+{Up}")
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    Sleep(120)
    
    Click(923, -197) ; Seleccionar caratula pegar
    Sleep(100)
    Send("^+{Up}")
    Send("^v")
    Sleep(150)

    ; --- DESPLAZAMIENTOS ---
    Click(923, 336)
    Send("{End}")
    Click(923, 857)
    Send("{End}")
    Sleep(150)

    ; --- EMPRESA ---
    Click(621, -365)  ; Click empresa arriba
    Sleep(100)
    Send("^+{Up}")
    Send("^v")
    Sleep(120)

    ; --- NÚMERO DE FACTURA ---
    Click(912, 669)   ; Click numero de factura abajo
    Sleep(100)
    Send("^+{Up}")
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    Sleep(120)
    
    Click(912, -365)  ; Click numero de factura arriba
    Sleep(100)
    Send("^+{Up}")    
    Send("^v")
    Sleep(120)

    ; --- ORDEN DE PAGO ---
    Click(342, 787)    ; Click orden de pago
    Sleep(100)
    Send("^+{Up}")
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    Sleep(120)
    
    Click(342, -245)  ; Click orden de pago arriba
    Sleep(100)
    Send("^+{Up}")
    Send("^v")
    Sleep(120)

    ; --- RECIBO DE PAGO ---
    Click(912, 787)   ; Recibo de pago abajo
    Sleep(100)
    Send("^+{Up}")
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    Sleep(120)
    
    Click(912, -245)    ; Recibo de pago arriba
    Sleep(100)
    Send("^+{Up}")
    Send("^v")
    Sleep(120)

    ; --- DEVENGADO ---
    Click(912, 728) ; Copiar devengado
    Sleep(100)
    Send("^+{Up}")
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    Sleep(120)
    
    Click(912, -304)
    Sleep(100)
    Send("^a{Backspace}")
    Sleep(100)
    Send("^v")
    Sleep(120)

    ; --- COMPROMISO ---
    Click(342, 845) ; Copiar compromiso
    Sleep(100)
    Send("^+{Up}")
    A_Clipboard := ""
    Send("^c")
    ClipWait(1)
    Sleep(120)
    
    Click(342, -187)
    Sleep(100)
    Send("^a{Backspace}")
    Sleep(100)
    Send("^v")
    
    ; --- FIN ---
    Sleep(150)
    Click(590, 210) ; Seleccionar fecha
}

; ==================================================================================================================================================
; INICIO SCRIPT
; ==================================================================================================================================================

; =========================================================================
; SIN CARATULA
; =========================================================================

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A HACIENDA (SIN CARATULA)
; =========================================================================
NumpadDot::
{
    Click(816, 453)
    Sleep(200)
    Send("HAC{Enter}")
    Sleep(100)
    Click(670, 182)  ; Seleccionar alcance
    Sleep(200)
    Send("99")
    Sleep(100)
    Click(880, 320)  ; Seleccionar caratula
}

; =========================================================================
; CREAR EXP EN HACIENDA (SIN CARATULA)
; =========================================================================
;(+)
NumpadAdd::
{
    ; =========================================================================
    ; COMIENZO F1
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(44, 584)    ; Nuevo documento (Omnipage)
    Sleep(100)
    Click(79, 107)    ; Dig (Omnipage)
    Sleep(100)
    ; FIN F1
    ; =========================================================================
    
    ; =========================================================================
    ; INICIO DETECTAR BOTON ESCANEAR
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(421, 709)
        Sleep(500)
        WinWaitClose("ahk_exe TwainClientU.exe")
        Sleep(300)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
        return
    }
    ; =========================================================================
    
    ; =========================================================================
    ; DETECTAR CAMBIOS EN LA CARPETA DE DOCUMENTOS
    folder := "C:\DOCUMENTOS\Imagenes"
    lastCount := -1
    lastSize := -1
    stable := 0

    Loop
    {
        FileCount := 0
        totalSize := 0

        ; Sintaxis v2 para bucle de archivos
        Loop Files, folder "\*.jpg", "F"
        {
            FileCount++
            ; FileGetSize ahora es una función que retorna el valor
            size := FileGetSize(A_LoopFileFullPath)
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
        
        ; TIEMPO: 3 sec
        if (stable >= 6)
            break

        Sleep(500)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
    Sleep(500)
    WinActivate("ahk_exe uploadfiles.exe")
    WinWaitActive("ahk_exe uploadfiles.exe")
    Click(463, 172)
    Sleep(100)
    ; =========================================================================
    
    ; =========================================================================
    ; CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
    WinWait("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    WinActivate("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    ; =========================================================================
    
    ; =========================================================================
    ; F3
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Send("^r")
    Sleep(1000)
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(500)
    
    ; WinGet en v2 se usa a través de funciones específicas
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    Click(816, 453)   ; Seleccionar tipo de expediente (Menú desplegable)
    Sleep(200)
    Send("CONTAD{Enter}")
    Sleep(200)
    Click(887, 243)
    Sleep(300)
    Send("CONTADURIA{Enter}")
    Sleep(800)
    Click(887, 371)
    Sleep(300)
    Send("CONTADURIA{Enter}")
    Sleep(300)
    Click(670, 182)  ; Seleccionar alcance
    Sleep(200)
    Send("99")
    Sleep(100)
    Send("!{Tab}")
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 516, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(100)
    Send("{LCtrl Down}<{LCtrl Up}")
}

; =========================================================================
; CREAR EXP EN CONTADURIA (SIN CARATULA)
; =========================================================================
;(*)
NumpadMult::
{
    ; COMIENZO F4
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(100, 630)    ; Dig (Omnipage)
    Sleep(100)
    Click(19, 106)     ; Si procesar todas las páginas (Omnipage)
    Sleep(400)
    Click(160, 226)   ; Aceptar (Omnipage)
    Sleep(200)
    ; FIN F4
    ; =========================================================================
    
    ; =========================================================================
    ; CERRAR ESCANER
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(480, 20)    ; Cerrar (Nuance escaner)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES CARGANDO
    Loop
    {
        ; v2: ControlGetText ahora recibe el Control y luego el título de la Ventana
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        if (TextoBoton != "x") 
        {
            break ; El botón ya cambió, salimos de este bucle de espera inicial
        }
        Sleep(200)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES GUARDADAS
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        
        ; Si el botón volvió a decir "Guardar", el proceso terminó
        if (TextoBoton = "x")
        {
            break ; Rompe el bucle para continuar
        }
        Sleep(300)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
    if WinExist("ahk_exe uploadfiles.exe") 
    {
        WinActivate("ahk_exe uploadfiles.exe")
        WinWaitActive("ahk_exe uploadfiles.exe", , 2)
        Click(463, 172)   ; Subir archivos
        Sleep(100)
    } 
    else 
    {
        MsgBox("UploadFiles.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
    WinWait("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    WinActivate("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    ; =========================================================================
    
    ; =========================================================================
    ; F8
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(300)
    Send("^r")
    Sleep(200)
    Click(263, 533)
    Sleep(500)
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(700)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    Click(816, 453)   ; Seleccionar tipo de expediente (Menú desplegable)
    Sleep(200)
    Send("PA{Enter}")
    Sleep(200)
    Click(887, 243)
    Sleep(300)
    Send("PATRIMONIO{Enter}")
    Sleep(800)
    Click(887, 371)
    Sleep(300)
    Send("PATRIMONIO{Enter}")
    Sleep(300)
    Click(670, 182)  ; Seleccionar alcance
    Sleep(200)
    Send("99")
    Sleep(100)
    Send("!{Tab}")
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 516, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(100)
    Send("{LCtrl Down}<{LCtrl Up}")
}

; =========================================================================
; CREAR EXP EN PATRIMONIO (SIN CARATULA)
; =========================================================================
;(/)
NumpadDiv::
{
    ; F4
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(100, 630)    ; Dig (Omnipage)
    Sleep(100)
    Click(19, 106)     ; Si procesar todas las páginas (Omnipage)
    Sleep(400)
    Click(160, 226)   ; Aceptar (Omnipage)
    Sleep(200)
    ; FIN F4
    ; =========================================================================
    
    ; =========================================================================
    ; CERRAR ESCANER
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(480, 20)    ; Cerrar (Nuance escaner)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES CARGANDO
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        if (TextoBoton != "x") 
        {
            break ; El botón ya cambió, salimos de este bucle de espera inicial
        }
        Sleep(200)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES GUARDADAS
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        
        ; Si el botón volvió a decir "Guardar", el proceso terminó
        if (TextoBoton = "x")
        {
            break ; Rompe el bucle para continuar
        }
        Sleep(300)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
    if WinExist("ahk_exe uploadfiles.exe") 
    {
        WinActivate("ahk_exe uploadfiles.exe")
        WinWaitActive("ahk_exe uploadfiles.exe", , 2)
        Click(463, 172)   ; Subir archivos
        Sleep(100)
    } 
    else 
    {
        MsgBox("UploadFiles.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
    WinWait("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    WinActivate("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    ; =========================================================================
    
    ; =========================================================================
    ; F9
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(300)
    Send("^r")
    Sleep(800)
    Click(263, 533)
    Sleep(800)
    Send("^{F4}")
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(700)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    CoordMode("Mouse", "Screen") ; v2: Parámetros como funciones y entre comillas
    Sleep(500)
    Click(315, 182)
    Sleep(500)
    CoordMode("Mouse", "Window") ; Volvemos al modo relativo de ventana
}

; =========================================================================
; CON CARATULA
; =========================================================================

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A HACIENDA (CON CARATULA)
; =========================================================================
RCtrl & NumpadDot::
{
    Click(816, 453)
    Sleep(200)
    Send("HAC{Enter}")
    Sleep(100)
    Click(880, 320)  ; Seleccionar caratula
}

; =========================================================================
; CREAR EXP EN HACIENDA (CON CARATULA)
; =========================================================================
;(CTRL +)
RCtrl & NumpadAdd::
{
    ; =========================================================================
    ; COMIENZO F1
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(44, 584)    ; Nuevo documento (Omnipage)
    Sleep(100)
    Click(79, 107)    ; Dig (Omnipage)
    Sleep(100)
    ; FIN F1
    ; =========================================================================
    
    ; =========================================================================
    ; INICIO DETECTAR BOTON ESCANEAR
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(421, 709)
        Sleep(500)
        WinWaitClose("ahk_exe TwainClientU.exe")
        Sleep(300)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
        return
    }
    ; =========================================================================
    
    ; =========================================================================
    ; DETECTAR CAMBIOS EN LA CARPETA DE DOCUMENTOS
    folder := "C:\DOCUMENTOS\Imagenes"
    lastCount := -1
    lastSize := -1
    stable := 0

    Loop
    {
        FileCount := 0
        totalSize := 0

        ; Sintaxis v2 para bucle de archivos
        Loop Files, folder "\*.jpg", "F"
        {
            FileCount++
            ; FileGetSize es función y retorna el tamaño directamente
            size := FileGetSize(A_LoopFileFullPath)
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
        
        ; TIEMPO: 3 sec
        if (stable >= 6)
            break

        Sleep(500)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
    Sleep(500)
    WinActivate("ahk_exe uploadfiles.exe")
    WinWaitActive("ahk_exe uploadfiles.exe")
    Click(463, 172)
    Sleep(100)
    ; =========================================================================
    
    ; =========================================================================
    ; CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
    WinWait("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    WinActivate("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    ; =========================================================================
    
    ; =========================================================================
    ; F3
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Send("^r")
    Sleep(1000)
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    Click(816, 453)   ; Seleccionar tipo de expediente (Menú desplegable)
    Sleep(200)
    Send("CONTAD{Enter}")
    Sleep(200)
    Click(887, 243)
    Sleep(300)
    Send("CONTADURIA{Enter}")
    Sleep(800)
    Click(887, 371)
    Sleep(300)
    Send("CONTADURIA{Enter}")
    Sleep(300)
    Send("!{Tab}")
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 516, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(100)
    Click(314, 200)
    Send("^+{Left}")
    Send("^c")
    Sleep(100)
    Click(320, -323) ; Click núm exp pegar
    Send("^+{Left}")
    Sleep(100)
    Send("^v")
    Click(515, 714)   ; Doble click año copiar
    Sleep(100)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(515, -323)  ; Doble click año pegar
    Send("^+{Up}")
    Send("^v")
    Click(900, 840)  ; Seleccionar caratula copiar
    Send("^+{Up}")
    Send("^c")
    Click(923, -197) ; Seleccionar caratula pegar
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(300)
}

; =========================================================================
; CREAR EXP EN CONTADURIA (CON CARATULA)
; =========================================================================
;(CTRL *)
RCtrl & NumpadMult::
{
    ; COMIENZO F4
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(100, 630)    ; Dig (Omnipage)
    Sleep(100)
    Click(19, 106)     ; Si procesar todas las páginas (Omnipage)
    Sleep(400)
    Click(160, 226)   ; Aceptar (Omnipage)
    Sleep(200)
    ; FIN F4
    ; =========================================================================
    
    ; =========================================================================
    ; CERRAR ESCANER
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(480, 20)    ; Cerrar (Nuance escaner)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES CARGANDO
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        if (TextoBoton != "x") 
        {
            break ; El botón ya cambió, salimos de este bucle de espera inicial
        }
        Sleep(200)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES GUARDADAS
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        
        ; Si el botón volvió a decir "Guardar", el proceso terminó
        if (TextoBoton = "x")
        {
            break ; Rompe el bucle para continuar
        }
        Sleep(300)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
    if WinExist("ahk_exe uploadfiles.exe") 
    {
        WinActivate("ahk_exe uploadfiles.exe")
        WinWaitActive("ahk_exe uploadfiles.exe", , 2)
        Click(463, 172)   ; Subir archivos
        Sleep(100)
    } 
    else 
    {
        MsgBox("UploadFiles.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
    WinWait("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    WinActivate("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    ; =========================================================================
    
    ; =========================================================================
    ; F8
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(300)
    Send("^r")
    Sleep(200)
    Click(263, 533)
    Sleep(500)
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(700)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    Click(816, 453)   ; Seleccionar tipo de expediente (Menú desplegable)
    Sleep(200)
    Send("PA{Enter}")
    Sleep(200)
    Click(887, 243)
    Sleep(300)
    Send("PATRIMONIO{Enter}")
    Sleep(800)
    Click(887, 371)
    Sleep(300)
    Send("PATRIMONIO{Enter}")
    Sleep(300)
    Send("!{Tab}")
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 516, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(100)
    Click(314, 200)
    Send("^+{Left}")
    Send("^c")
    Sleep(100)
    Click(320, -323) ; Click núm exp pegar
    Send("^+{Left}")
    Sleep(100)
    Send("^v")
    Click(515, 714)   ; Doble click año copiar
    Sleep(100)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(515, -323)  ; Doble click año pegar
    Send("^+{Up}")
    Send("^v")
    Click(900, 840)  ; Seleccionar caratula copiar
    Send("^+{Up}")
    Send("^c")
    Click(923, -197) ; Seleccionar caratula pegar
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(100)
}

; =========================================================================
; CREAR EXP EN PATRIMONIO (CON CARATULA)
; =========================================================================
;(CTRL /)
RCtrl & NumpadDiv::
{
    ; F4
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(100, 630)    ; Dig (Omnipage)
    Sleep(100)
    Click(19, 106)     ; Si procesar todas las páginas (Omnipage)
    Sleep(400)
    Click(160, 226)   ; Aceptar (Omnipage)
    Sleep(200)
    ; FIN F4
    ; =========================================================================
    
    ; =========================================================================
    ; CERRAR ESCANER
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(480, 20)    ; Cerrar (Nuance escaner)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES CARGANDO
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        if (TextoBoton != "x") 
        {
            break ; El botón ya cambió, salimos de este bucle de espera inicial
        }
        Sleep(200)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; BUCLE PARA DETECTAR IMÁGENES GUARDADAS
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        
        ; Si el botón volvió a decir "Guardar", el proceso terminó
        if (TextoBoton = "x")
        {
            break ; Rompe el bucle para continuar
        }
        Sleep(300)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
    if WinExist("ahk_exe uploadfiles.exe") 
    {
        WinActivate("ahk_exe uploadfiles.exe")
        WinWaitActive("ahk_exe uploadfiles.exe", , 2)
        Click(463, 172)   ; Subir archivos
        Sleep(100)
    } 
    else 
    {
        MsgBox("UploadFiles.exe no está abierto.", "Error", 48)
    }
    ; =========================================================================
    
    ; =========================================================================
    ; CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
    WinWait("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    WinActivate("Finalizado ahk_exe uploadFiles.exe")
    Sleep(200)
    ; =========================================================================
    
    ; =========================================================================
    ; F9
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(300)
    Send("^r")
    Sleep(200)
    Click(263, 533)
    Sleep(500)
    Send("^{F4}")
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(700)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        WinRestore("ahk_id " IDVentanaActiva)
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    CoordMode("Mouse", "Screen")
    Sleep(500)
    Click(315, 182)
    Sleep(500)
    CoordMode("Mouse", "Window")
}

; =========================================================================
; PASO 1: CREAR EXP EN HACIENDA Y ESCANEO
; =========================================================================
F1::
{
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(44, 584)    ; Nuevo documento (Omnipage)
    Sleep(100)
    Click(79, 107)    ; Dig (Omnipage)
    Sleep(100)
    
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(421, 709)
        WinWaitClose("ahk_exe TwainClientU.exe")
        WinActivate("ahk_exe omnipage19.exe")
        WinWaitActive("ahk_exe omnipage19.exe", , 2)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
    }
    
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        if (TextoBoton != "x") 
        {
            break ; El botón ya cambió, salimos de este bucle de espera inicial
        }
        Sleep(200)
    }
    
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        
        ; Si el botón volvió a decir "Guardar", el proceso terminó
        if (TextoBoton = "x")
        {
            break ; Rompe el bucle para continuar
        }
        Sleep(300)
    }
    
    if WinExist("ahk_exe uploadfiles.exe") 
    {
        WinActivate("ahk_exe uploadfiles.exe")
        WinWaitActive("ahk_exe uploadfiles.exe", , 2)
        
        ; --- Secuencia de clics para UploadFiles ---
        Click(463, 172)   ; Subir archivos
        Sleep(100)
    } 
    else 
    {
        MsgBox("UploadFiles.exe no está abierto.", "Error", 48)
    }
}

; =========================================================================
; PASO 2: SUBIR ARCHIVOS AL UPLOADER
; =========================================================================
F2::
{
    ; Buscamos y activamos UploadFiles
    if WinExist("ahk_exe uploadfiles.exe") 
    {
        WinActivate("ahk_exe uploadfiles.exe")
        WinWaitActive("ahk_exe uploadfiles.exe", , 2)
        
        ; --- Secuencia de clics para UploadFiles ---
        Click(463, 172)   ; Subir archivos
        Sleep(100)
    } 
    else 
    {
        MsgBox("UploadFiles.exe no está abierto.", "Error", 48)
    }
}

; =========================================================================
; PASO 3: SUBIR ARCHIVOS AL SERVIDOR Y REPLICAR EN CONTADURIA
; =========================================================================
F3::
{
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Send("^r")
    Sleep(1000)
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        ; Forzamos a que se restaure por si está maximizada
        WinRestore("ahk_id " IDVentanaActiva)
        ; La movemos ARRIBA a la izquierda
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        ; La mantiene al frente y enfocada
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    Click(816, 453)   ; Seleccionar tipo de expediente (Menú desplegable)
    Sleep(200)
    Send("CONTAD{Enter}")
    Sleep(200)
    Click(887, 243)
    Sleep(300)
    Send("CONTADURIA{Enter}")
    Sleep(800)
    Click(887, 371)
    Sleep(300)
    Send("CONTADURIA{Enter}")
    Sleep(300)
    Send("!{Tab}")
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        ; Forzamos a que se restaure por si está maximizada
        WinRestore("ahk_id " IDVentanaActiva)
        ; La movemos abajo a la izquierda
        WinMove(-7, 516, 974, 523, "ahk_id " IDVentanaActiva)
        ; La mantiene al frente y enfocada
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(100)
    Click(314, 200)
    Send("^+{Left}")
    Send("^c")
    Sleep(100)
    Click(320, -323) ; Click núm exp pegar
    Send("^+{Left}")
    Sleep(100)
    Send("^v")
    Click(515, 714)   ; Doble click año copiar
    Sleep(100)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(515, -323)  ; Doble click año pegar
    Send("^+{Up}")
    Send("^v")
    Click(900, 840)  ; Seleccionar caratula copiar
    Send("^+{Up}")
    Send("^c")
    Click(923, -197) ; Seleccionar caratula pegar
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(100)
    
    Click(923, 336)
    Send("{End}")
    Click(923, 857)
    Send("{End}")
    Sleep(100)
    
    Click(621, 151)   ; Click empresa
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(50)
    Click(621, -365)  ; Click empresa arriba
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    
    Click(912, 669)   ; Click numero de factura abajo
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(50)
    Click(912, -365)  ; Click numero de factura arriba
    Sleep(50)
    Send("^+{Up}")    
    Send("^v")
    Sleep(50)
    
    Click(342, 787)    ; Click orden de pago
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Click(342, -245)  ; Click orden de pago arriba
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(50)
    
    Click(912, 787)   ; Recibo de pago abajo
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(912, -245)    ; Recibo de pago arriba
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(50)
    
    Click(912, 728) ; Copiar devengado
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(912, -304)
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(100)
    
    Click(342, 845) ; Copiar compromiso
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(342, -187)
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(100)
    
    Click(590, 210) ; Seleccionar fecha
}

; =========================================================================
; PASO 4: CREAR EXPEDIENTE DUPLICADO Y CARGAR IMG EN CARPETA
; =========================================================================
F4::
{
    Click(945, 360)
    Sleep(100)
    Send("{End}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Send("{WheelDown 3}")
    Sleep(100)
    Sleep(100)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(1500)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(500)
    Click(504, 377)
    Sleep(100)
    Send("^r")
    Sleep(1500)
    Click(195, 115)
    Sleep(300)
    Click(593, 120)   ; Copiar  NUEVA COORD
    Sleep(100)
    Click(1381, 100)  ; Pegar (Uploader)
    Sleep(100)
    Click(100, 630)    ; Dig (Omnipage)
    Sleep(100)
    Click(19, 106)     ; Si procesar todas las páginas (Omnipage)
    Sleep(400)
    Click(160, 226)   ; Aceptar (Omnipage)
    Sleep(200)
    
    if WinExist("ahk_exe omnipage19.exe") 
    {
        WinWaitActive("ahk_exe TwainClientU.exe", , 6)
        WinActivate("ahk_exe TwainClientU.exe")
        Sleep(200)
        Click(480, 20)    ; Cerrar (Nuance escaner)
    } 
    else 
    {
        MsgBox("TwainClientU.exe no está abierto.", "Error", 48)
    }
    
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        if (TextoBoton != "x") 
        {
            break ; El botón ya cambió, salimos de este bucle de espera inicial
        }
        Sleep(200)
    }
    
    Loop
    {
        TextoBoton := ControlGetText("BarButton2", "ahk_exe Omnipage19.exe")
        
        ; Si el botón volvió a decir "Guardar", el proceso terminó
        if (TextoBoton = "x")
        {
            break ; Rompe el bucle para continuar
        }
        Sleep(300)
    }
    
    if WinExist("ahk_exe uploadfiles.exe") 
    {
        WinActivate("ahk_exe uploadfiles.exe")
        WinWaitActive("ahk_exe uploadfiles.exe", , 2)
        
        ; --- Secuencia de clics para UploadFiles ---
        Click(463, 172)   ; Subir archivos
        Sleep(100)
    } 
    else 
    {
        MsgBox("UploadFiles.exe no está abierto.", "Error", 48)
    }
}

; =========================================================================
; PASO 5: SUBIR IMÁGENES EN CONDATURÍA Y COPIAR EN PATRIMONIO
; =========================================================================
F8::
{
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(300)
    Send("^r")
    Sleep(200)
    Click(263, 533)
    Sleep(500)
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(700)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        ; Forzamos a que se restaure por si está maximizada
        WinRestore("ahk_id " IDVentanaActiva)
        ; La movemos ARRIBA a la izquierda
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        ; La mantiene al frente y enfocada
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    Click(816, 453)   ; Seleccionar tipo de expediente (Menú desplegable)
    Sleep(200)
    Send("PA{Enter}")
    Sleep(200)
    Click(887, 243)
    Sleep(300)
    Send("PATRIMONIO{Enter}")
    Sleep(800)
    Click(887, 371)
    Sleep(300)
    Send("PATRIMONIO{Enter}")
    Sleep(300)
    Send("!{Tab}")
    Sleep(500)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        ; Forzamos a que se restaure por si está maximizada
        WinRestore("ahk_id " IDVentanaActiva)
        ; La movemos abajo a la izquierda
        WinMove(-7, 516, 974, 523, "ahk_id " IDVentanaActiva)
        ; La mantiene al frente y enfocada
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(100)
    Click(314, 200)
    Send("^+{Left}")
    Send("^c")
    Sleep(100)
    Click(320, -323) ; Click núm exp pegar
    Send("^+{Left}")
    Sleep(100)
    Send("^v")
    Click(515, 714)   ; Doble click año copiar
    Sleep(100)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(515, -323)  ; Doble click año pegar
    Send("^+{Up}")
    Send("^v")
    Click(900, 840)  ; Seleccionar caratula copiar
    Send("^+{Up}")
    Send("^c")
    Click(923, -197) ; Seleccionar caratula pegar
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(100)
    
    Click(923, 336)
    Send("{End}")
    Click(923, 857)
    Send("{End}")
    Sleep(100)
    
    Click(621, 151)   ; Click empresa
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(50)
    Click(621, -365)  ; Click empresa arriba
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    
    Click(912, 669)   ; Click numero de factura abajo
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(50)
    Click(912, -365)  ; Click numero de factura arriba
    Sleep(50)
    Send("^+{Up}")    
    Send("^v")
    Sleep(50)
    
    Click(342, 787)    ; Click orden de pago
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Click(342, -245)  ; Click orden de pago arriba
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(50)
    
    Click(912, 787)   ; Recibo de pago abajo
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(912, -245)    ; Recibo de pago arriba
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(50)
    
    Click(912, 728) ; Copiar devengado
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(912, -304)
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(100)
    
    Click(342, 845) ; Copiar compromiso
    Sleep(50)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(342, -187)
    Sleep(50)
    Send("^+{Up}")
    Send("^v")
    Sleep(100)
    
    Click(590, 210) ; Seleccionar fecha
}

; =========================================================================
; PASO 6: SUBIR IMÁGENES EN PATRIMONIO Y CREAR NUEVO EXPEDIENTE
; =========================================================================
F9::
{
    Send("{Enter}")
    Sleep(300)
    Click(-5, 485)    ; Bajar barra pestaña Google
    Sleep(300)
    Click(851, 146)   ; Cargar imágenes (boton blue)
    Sleep(1000)
    Click(480, 400)   ; Ok (boton violeta)
    Sleep(300)
    Send("{End}")
    Sleep(300)
    Click(827, 454)   ; Guardar (Boton verde) NUEVA COORD
    Sleep(300)
    Click(494, 377)   ; Guardar (Boton violeta)
    Sleep(300)
    Send("^r")
    Sleep(200)
    Click(263, 533)
    Sleep(500)
    Send("^{F4}")
    
    Run('chrome.exe --new-window "http://192.168.0.11/digexp/documentos/editar"')
    Sleep(700)
    
    IDVentanaActiva := WinGetID("A")
    if (IDVentanaActiva) 
    {
        ; Forzamos a que se restaure por si está maximizada
        WinRestore("ahk_id " IDVentanaActiva)
        ; La movemos ARRIBA a la izquierda
        WinMove(-7, 0, 974, 523, "ahk_id " IDVentanaActiva)
        ; La mantiene al frente y enfocada
        WinActivate("ahk_id " IDVentanaActiva) 
    }
    
    Sleep(200)
    CoordMode("Mouse", "Screen")
    Sleep(500)
    Click(315, 182)
    Sleep(500)
    CoordMode("Mouse", "Window")
}

; =========================================================================
; SALVAVIDAS: USAR EN CASO DE NO TENER LAS IMÁGENES EN ARCHIVO TEMPORAL
; =========================================================================    
F10::
{
    Send("^r")
    Sleep(1500)
    Click(191, 110)
    Sleep(500)
    Click(805, 156)
    Sleep(500)
    Click(528, 398) ; Guardar violeta
    Sleep(500)
    Click(486, 400) ; Ok
    Sleep(300)
    Click(828, 268) ; Guardar verde
    Sleep(300)
    Click(525, 381) ; Guardar violeta
    Sleep(500)
    Click(451, 379) ;
    Sleep(1000)
    Click(593, 120) ; Copiar
    Sleep(100)
    Click(1381, 100)
    Sleep(100)
    Click(100, 630)
    Sleep(100)
    Click(19, 106)
    Sleep(400)
    Click(160, 226)
    Sleep(4000)
    Click(480, 20)
}

; =========================================================================
; ATAJOS SECUNDARIOS DE COPIADO Y PEGADO ESPECÍFICO
; =========================================================================

; ORDEN DE COMPRA
^F1::
{
    Click(342, 669)
    Send("^+{Up}") 
    Send("^c")
    Click(342, -365)
    Send("^+{Up}")
    Send("^v")
}

; Numero orden de cancelacion
^F2::
{
    Click(625, 787)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(625, -245)
    Send("^+{Up}")
    Send("^v")
}

; Numero alta provisional bienes
^F3::
{
    Click(625, 847)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(625, -185)
    Send("^+{Up}")
    Send("^v")
}

; Numero solicitud de pedido
^F4::
{
    Click(912, 847)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(912, -185)
    Send("^+{Up}")
    Send("^v")
}

; Numero solicitud de gasto
^F5::
{
    Click(342, 907)
    Send("^+{Up}")
    Send("^c")
    Sleep(100)
    Click(342, -127)
    Send("^+{Up}")
    Send("^v")
}