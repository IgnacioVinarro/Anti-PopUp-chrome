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
; PESTAÑA SELECCIONADA A EXP CREAR
; =========================================================================
F12::
        SendInput, ^l
        Sleep, 100
        Send, http://192.168.0.11/digexp/documentos/editar{ENTER}
        Sleep, 300
        Click, 330, 180
    return

; =========================================================================
; SI SE SALE EL ESCANEO
; =========================================================================
RCtrl & NumpadSub:: ;(Ctrl -)
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
; FINALIZAR ESCANEO
; =========================================================================
NumpadEnter::
    WinActivate, ahk_exe TwainClientU.exe
    Click, 404, 206
    WinWaitClose, ahk_exe TwainClientU.exe
    Sleep, 100
    SendInput, {Enter}
    return

; =========================================================================
; SALVAVIDAS: USAR EN CASO DE NO TENER LAS IMÁGENES EN ARCHIVO TEMPORAL (REEMPLAZAR)
; =========================================================================    
F10::
    SendInput, ^r
    Sleep, 1500
    Click, 191, 110
    Sleep, 500
    Click, 805, 156
    Sleep, 500
    Click, 528, 398 ;Guardar violeta
    Sleep, 500
    Click, 486, 400 ;Ok
    Sleep, 300
    Click, 828, 268 ;Guardar verde
    Sleep, 300
    Click, 525, 381 ;Guardar violeta
    Sleep, 500
    Click, 451, 379 ;
    Sleep, 1000
    Click, 593, 120 ; Copiar
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

; ================================================================================================================================================
; CONFIGURACIÓN ADICIONAL PROPIA DE LA DIRECCION (Opcional)
; ================================================================================================================================================

; =========================================================================
; BAJAR A SUBFORMULARIO (<)
; =========================================================================
<::
        Click, 923, 336
        Send, {End}
        Sleep, 300
        Click, 912, 152
    return

; =========================================================================
; COPIADO FORMULARIO Y SUBFORMULARIO (CTRL |)
; =========================================================================
LCtrl & |::
    CopiarYPegarFormulario()
    return
    
; =========================================================================
; ORDEN DE COMPRA
; =========================================================================
{::
    Click, 336, 151
    Return

; =========================================================================
; CARATULA:
; =========================================================================

    ; =========================================================================
    ; CARATULA: MUNICIPALIDAD DE MALVINAS ARGENTINAS
    ; =========================================================================
    }::
        SendInput, MUNICIPALIDAD DE MALVINAS ARGENTINAS
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: CONSEJO ESCOLAR DE MALVINAS ARGENTINAS
    ; =========================================================================
    RCtrl & }::
        SendInput, CONSEJO ESCOLAR DE MALVINAS ARGENTINAS
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: BANCO PROVINCIA
    ; =========================================================================
    RCtrl & F1::
        SendInput, BANCO PROVINCIA
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: EMBOTELLADORA DEL PLATA S.A.
    ; =========================================================================
    RCtrl & F2::
        SendInput, EMBOTELLADORA DEL PLATA S.A.
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: PROVINCIA SEGUROS S.A.
    ; =========================================================================
    RCtrl & F3::
        SendInput, PROVINCIA SEGUROS S.A.
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: COLLOVA LUIS CARMELO
    ; =========================================================================
    RCtrl & F4::
        SendInput, COLLOVA LUIS CARMELO
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: JOSE Y JULIO FRONTANI S.H.
    ; =========================================================================
    RCtrl & F5::
        SendInput, JOSE Y JULIO FRONTANI S.H.
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: BANCO DE LA NACION ARGENTINA
    ; =========================================================================
    RCtrl & F6::
        SendInput, BANCO DE LA NACION ARGENTINA
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: MALDONADO MIGUEL ANGEL
    ; =========================================================================
    RCtrl & F7::
        SendInput, MALDONADO MIGUEL ANGEL
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: PIETROWSKI REGINA Y/O VERON MARCELO
    ; =========================================================================
    RCtrl & F8::
        SendInput, PIETROWSKI REGINA Y/O VERON MARCELO
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: PONTI CLAUDIO HECTOR
    ; =========================================================================
    RCtrl & F9::
        SendInput, PONTI CLAUDIO HECTOR
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: SOLMEDICA S.A.
    ; =========================================================================
    RCtrl & F10::
        SendInput, SOLMEDICA S.A.
        Sleep, 50
        Send, {<}
        Return

    ; =========================================================================
    ; CARATULA: COOP. TELEFONICA GRAN BOURG
    ; =========================================================================
    RCtrl & F11::
    SendInput, COOP. TELEFONICA GRAN BOURG
    Sleep, 50
    Send, {<}
    Return

; =========================================================================================================================================================================================================================
; INICIO SCRIPT
; =========================================================================================================================================================================================================================

; ==============================================================================================================================================
; FUNCIONES GLOBALES
; ==============================================================================================================================================
    CopiarTexto() {
    Clipboard := "" ; Limpia el portapapeles para evitar falsos positivos
    Send, ^c
    ClipWait, 0.15, 1 ; Espera hasta 1 segundo a que el portapapeles tenga datos
    return Clipboard
}

    PegarSiExiste(texto) {
    if (texto != "") {
        Clipboard := texto
        Send, ^v
    }
    }

    CopiarYPegarFormulario() {
    ; =========================================================================
    ; COPIADO
    ; =========================================================================
    ; --- COPIAR EXPEDIENTE ---
    Click, 333, 181
    Send, ^a ; Selecciona todo el contenido del campo actual
    Expediente := CopiarTexto()
    Send, {Tab} ; Pasa al siguiente campo
    Sleep, 100

    ; --- COPIAR AÑO ---
    Año := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR ALCANCE ---
    Alcance := CopiarTexto()
    Sleep, 100

    ; --- COPIAR CARATULA ---
    Click, 918, 306
    Send, ^a ; Selecciona todo el contenido del campo actual
    Caratula := CopiarTexto()
    Sleep, 100

    ; --- BAJAR FORMULARIO ---
    Send, {Ctrl Up}
    Click, 923, 336
    Send, {End}

    ; --- COPIAR ORDEN DE COMPRA ---
    Click, 336, 151
    Send, ^a ; Selecciona todo el contenido del campo actual
    OrdenDeCompra := CopiarTexto()
    Send, {Tab 2}
    Sleep, 100

    ; --- COPIAR FACTURA ---
    Factura := CopiarTexto()
    Sleep, 100

    ; --- COPIAR FECHA ---
    Click, 375, 214
    Send, ^a ; Selecciona todo el contenido del campo actual
    Fecha := CopiarTexto()
    Sleep, 100

    ; --- COPIAR DEVENGADO ---
    Click, 906, 211
    Send, ^a ; Selecciona todo el contenido del campo actual
    Devengado := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR ORDEN DE PAGO ---
    OrdenDePago := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR ORDEN DE CANCELACION ---
    OrdenDeCancelacion := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR RECIBO DE PAGO ---
    ReciboDePago := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR COMPROMISO ---
    Compromiso := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR ALTA PROVISORIA ---
    AltaProvisoria := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR SOLICITUD DE PEDIDO ---
    SolicitudDePedido := CopiarTexto()
    Send, {Tab}
    Sleep, 100

    ; --- COPIAR SOLICITUD DE GASTOS ---
    SolicitudDeGastos := CopiarTexto()
    Sleep, 100
    ; =========================================================================
    ; PEGADO
    ; =========================================================================
    ; --- PEGAR EXPEDIENTE ---
    Click, 333, -333 
    Send, ^a
    Clipboard := Expediente
    Send, ^v
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR AÑO ---
    Clipboard := Año
    Send, ^v
    Send, {Tab 2}
    Sleep, 100

    ; --- PEGAR ALCANCE ---
    PegarSiExiste(Alcance)
    Sleep, 100

    ; --- PEGAR CARATULA ---
    Click, 918, 306
    Send, ^a
    Clipboard := Caratula
    Send, ^v
    Sleep, 100

    ; --- BAJAR FORMULARIO ---
    Send, {Ctrl Up}
    Click, 923, 336
    Send, {End}

    ; --- PEGAR ORDEN DE COMPRA ---
    Click, 336, 151
    Send, ^a
    PegarSiExiste(OrdenDeCompra)
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR BENEFICIARIO ---
    Clipboard := Caratula
    Send, ^v
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR FACTURA ---
    PegarSiExiste(Factura)
    Sleep, 100

    ; --- PEGAR FECHA ---
    Click, 375, 214
    Clipboard := Fecha
    fechaLimpia := RegExReplace(Clipboard, "\D", "")
    Sleep, 150
    SendInput, %fechaLimpia%
    Sleep, 150

    ; --- PEGAR DEVENGADO ---
    Click, 906, 211
    Send, ^a
    Clipboard := Devengado
    Send, ^v
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR ORDEN DE PAGO ---
    Clipboard := OrdenDePago
    Send, ^v
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR ORDEN DE CANCELACION ---
    PegarSiExiste(OrdenDeCancelacion)
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR RECIBO DE PAGO ---
    PegarSiExiste(ReciboDePago)
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR COMPROMISO ---
    Clipboard := Compromiso
    Send, ^v
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR ALTA PROVISORIA ---
    PegarSiExiste(AltaProvisoria)
    Send, {Tab}
    Sleep, 100

    ; --- PEGAR SOLICITUD DE PEDIDO ---
    Clipboard := SolicitudDePedido
    Send, ^v
    Send, {Tab}
    Sleep, 100


    ; --- PEGAR SOLICITUD DE GASTOS ---
    Clipboard := SolicitudDeGastos
    Send, ^v
    Sleep, 100
    }

    CopiarYPegarCaratula() {
        ; =========================================================================
        ; COPIADO
        ; =========================================================================
        ; --- COPIAR EXPEDIENTE ---
        Click, 333, 181
        Send, ^a ; Selecciona todo el contenido del campo actual
        Expediente := CopiarTexto()
        Send, {Tab} ; Pasa al siguiente campo
        Sleep, 100

        ; --- COPIAR AÑO ---
        Año := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR ALCANCE ---
        Alcance := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR CUERPO ---
        Cuerpo := CopiarTexto()
        Sleep, 100

        ; --- COPIAR CARATULA ---
        Click, 918, 306
        Send, ^a ; Selecciona todo el contenido del campo actual
        Caratula := CopiarTexto()
        Sleep, 100


        ; =========================================================================
        ; PEGADO
        ; =========================================================================
        ; --- PEGAR EXPEDIENTE ---
        Click, 333, -333 
        Send, ^a
        Clipboard := Expediente
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR AÑO ---
        Clipboard := Año
        Send, ^v
        Send, {Tab 2}
        Sleep, 100

        ; --- PEGAR ALCANCE ---
        PegarSiExiste(Alcance)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR CUERPO ---
        PegarSiExiste(Cuerpo)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR CARATULA ---
        Click, 918, 306
        Send, ^a
        Clipboard := Caratula
        Send, ^v
        Sleep, 100
    }

    CopiarYPegarCaratulaFormulario()
    {
        ; =========================================================================
        ; COPIADO
        ; =========================================================================
        ; --- COPIAR EXPEDIENTE ---
        Click, 333, 181
        Send, ^a ; Selecciona todo el contenido del campo actual
        Expediente := CopiarTexto()
        Send, {Tab} ; Pasa al siguiente campo
        Sleep, 100

        ; --- COPIAR AÑO ---
        Año := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR ALCANCE ---
        Alcance := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR CUERPO ---
        Cuerpo := CopiarTexto()
        Sleep, 100

        ; --- COPIAR CARATULA ---
        Click, 918, 306
        Send, ^a ; Selecciona todo el contenido del campo actual
        Caratula := CopiarTexto()
        Sleep, 100

        ; --- BAJAR FORMULARIO ---
        Send, {Ctrl Up}
        Click, 923, 336
        Send, {End}

        ; --- COPIAR ORDEN DE COMPRA ---
        Click, 336, 151
        Send, ^a ; Selecciona todo el contenido del campo actual
        OrdenDeCompra := CopiarTexto()
        Send, {Tab 2}
        Sleep, 100

        ; --- COPIAR FACTURA ---
        Factura := CopiarTexto()
        Sleep, 100

        ; --- COPIAR FECHA ---
        Click, 375, 214
        Send, ^a ; Selecciona todo el contenido del campo actual
        Fecha := CopiarTexto()
        Sleep, 100

        ; --- COPIAR DEVENGADO ---
        Click, 906, 211
        Send, ^a ; Selecciona todo el contenido del campo actual
        Devengado := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR ORDEN DE PAGO ---
        OrdenDePago := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR ORDEN DE CANCELACION ---
        OrdenDeCancelacion := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR RECIBO DE PAGO ---
        ReciboDePago := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR COMPROMISO ---
        Compromiso := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR ALTA PROVISORIA ---
        AltaProvisoria := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR SOLICITUD DE PEDIDO ---
        SolicitudDePedido := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR SOLICITUD DE GASTOS ---
        SolicitudDeGastos := CopiarTexto()
        Sleep, 100
        ; =========================================================================
        ; PEGADO
        ; =========================================================================
        ; --- PEGAR EXPEDIENTE ---
        Click, 333, -333 
        Send, ^a
        Clipboard := Expediente
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR AÑO ---
        Clipboard := Año
        Send, ^v
        Send, {Tab 2}
        Sleep, 100

        ; --- PEGAR ALCANCE ---
        PegarSiExiste(Alcance)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR CUERPO ---
        PegarSiExiste(Cuerpo)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR CARATULA ---
        Click, 918, 306
        Send, ^a
        Clipboard := Caratula
        Send, ^v
        Sleep, 100

            ; --- BAJAR FORMULARIO ---
        Send, {Ctrl Up}
        Click, 923, 336
        Send, {End}

        ; --- PEGAR ORDEN DE COMPRA ---
        Click, 336, 151
        Send, ^a
        PegarSiExiste(OrdenDeCompra)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR BENEFICIARIO ---
        Clipboard := Caratula
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR FACTURA ---
        PegarSiExiste(Factura)
        Sleep, 100

        ; --- PEGAR FECHA ---
        Click, 375, 214
        Clipboard := Fecha
        fechaLimpia := RegExReplace(Clipboard, "\D", "")
        Sleep, 150
        SendInput, %fechaLimpia%
        Sleep, 150

        ; --- PEGAR DEVENGADO ---
        Click, 906, 211
        Send, ^a
        Clipboard := Devengado
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR ORDEN DE PAGO ---
        Clipboard := OrdenDePago
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR ORDEN DE CANCELACION ---
        PegarSiExiste(OrdenDeCancelacion)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR RECIBO DE PAGO ---
        PegarSiExiste(ReciboDePago)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR COMPROMISO ---
        Clipboard := Compromiso
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR ALTA PROVISORIA ---
        PegarSiExiste(AltaProvisoria)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR SOLICITUD DE PEDIDO ---
        Clipboard := SolicitudDePedido
        Send, ^v
        Send, {Tab}
        Sleep, 100


        ; --- PEGAR SOLICITUD DE GASTOS ---
        Clipboard := SolicitudDeGastos
        Send, ^v
        Sleep, 100
    }

    CrearExpNuevoYEscaneo()
    {
            Click, 945, 360
            Sleep, 100
            Send, {End}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 500
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 300
            Click, 504, 377
            Sleep, 200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1433, 80  ; Pegar (Uploader)
            Sleep, 100
            Click, 44, 584    ; Nuevo documento (Omnipage)
            Sleep, 100
            Click, 79, 107    ; Dig (Omnipage)
            Sleep, 100
    }

    CrearExpNuevoMismaIMG()
    {
            Click, 945, 360
            Sleep, 100
            Send, {End}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 500
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 300
            Click, 504, 377
            Sleep, 200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1433, 80  ; Pegar (Uploader)
            Sleep, 100
            Click, 100, 630   ; Dig (Omnipage)
            Sleep, 100
            Click, 19, 106    ; Si procesar todas las páginas (Omnipage)
            Sleep, 400
            Click, 160, 226  ; Aceptar (Omnipage)
            Sleep, 200
    }

    CrearExpNuevoMismaIMG_inyect()
    {
            Click, 945, 360
            Sleep, 100
            Send, {End}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Send, {WheelDown 3}
            Sleep, 50
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 500
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 300
            Click, 504, 377
            Sleep, 200
            Click, 594, 120   ; Copiar
            Sleep, 100
            Click, 1433, 80  ; Pegar (Uploader)
            Sleep, 100
            Click, 103, 201
        ; =========================================================================
        ;CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
        WinWait, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
        WinActivate, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
    }

    AbrirEscaneo()
    {
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 421, 704
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
            return
        }
        Sleep, 2000
        WinGetTitle, tituloInicial, ahk_exe TwainClientU.exe
        ;MouseMove, 219, 116
        Loop
        {
            ; Consultamos el título actual en cada ciclo
            WinGetTitle, tituloActual, ahk_exe TwainClientU.exe

            ; Si el título cambió respecto al inicial, rompemos el bucle
            if (tituloActual != tituloInicial)
            {
                break
            }
            ; Pausa de 100 ms para no saturar el uso de CPU
            Sleep, 100
        }
        ; El script continúa aquí una vez que el título cambia...
        WinActivate, ahk_exe TwainClientU.exe
        Click, 404, 206
        WinWaitClose, ahk_exe TwainClientU.exe
        Sleep, 100
        SendInput, {Enter}
    }

    CerrarEscaneo()
    {
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 480, 20    ; Cerrar (Nuance escaner)
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
        }
    }

    GuardarYRepetir()
    {
            Send, {Enter}
            Sleep, 300
            Click, -5, 485    ; Bajar barra pestaña Google
            Sleep, 300
            Click, 851, 146   ; Cargar imágenes (boton blue)
            Sleep, 1500
            Click, 480, 400   ; Ok (boton violeta)
            Sleep, 500
            Send, {End}
            Sleep, 300
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 300
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 500
            Send, ^r
            Sleep, 1000
            Run, brave.exe --new-window "http://192.168.0.11/digexp/documentos/editar"
            Sleep, 500
        WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos ARRIBA a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 0, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva%

        }
    }

    GuardarYRepetir2()
    {
            Send, {Enter}
            Sleep, 300
            Click, -5, 485    ; Bajar barra pestaña Google
            Sleep, 300
            Click, 851, 146   ; Cargar imágenes (boton blue)
            Sleep, 1500
            Click, 480, 400   ; Ok (boton violeta)
            Sleep, 500
            Send, {End}
            Sleep, 300
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 300
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 500
            Send, ^r
            Sleep, 200
            Click, 240, 533
            Sleep, 500
            Run, brave.exe --new-window "http://192.168.0.11/digexp/documentos/editar"
            Sleep, 500
        WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos ARRIBA a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 0, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva%
        }
    }

    GuardarYNuevo() ;REVISAR
    {
            Send, {Enter}
            Sleep, 300
            Click, -5, 485    ; Bajar barra pestaña Google
            Sleep, 300
            Click, 851, 146   ; Cargar imágenes (boton blue)
            Sleep, 1500
            Click, 480, 400   ; Ok (boton violeta)
            Sleep, 500
            Send, {End}
            Sleep, 300
            Click, 827, 454   ; Guardar (Boton verde) NUEVA COORD
            Sleep, 300
            Click, 494, 377   ; Guardar (Boton violeta)
            Sleep, 500
            Send, ^r
            Sleep, 200
            Click, 240, 538
            Sleep, 500
            Send, ^{F4}
            Run, brave.exe --new-window "http://192.168.0.11/digexp/documentos/editar"
            Sleep, 700
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos ARRIBA a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 0, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
            }
            Sleep, 200
            CoordMode, Mouse, Screen
            Sleep, 200
            Click, 315, 182
            Sleep, 500
            CoordMode, Mouse, Window
    }

    SubidaUploader()
    {
        ;SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
        Sleep, 100
        WinActivate, ahk_exe OmniPageUploader.exe
        WinWaitActive, ahk_exe OmniPageUploader.exe
        Click, 103, 201
        ; =========================================================================
        ;CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
        WinWait, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
        WinActivate, Carga completa ahk_exe OmniPageUploader.exe
        Sleep, 200
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

; ================================================================================================================================================
; SIN CARATULA
; ================================================================================================================================================

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A HACIENDA (SIN CARATULA)
; =========================================================================
NumpadDot::
    Click, 816, 433
    Sleep, 200
    SendInput, HAC{ENTER}
    Sleep, 100
    Click, 670, 175  ;Seleccionar alcance
    Sleep, 200
    SendInput, 99
    Sleep, 100
    Click, 880, 300   ; Seleccionar caratula
    return

; =========================================================================
; CREAR FORMULARIO 29 EN HACIENDA (SIN CARATULA)
; =========================================================================
;(+)
NumpadAdd::
    ; =========================================================================
    CrearExpNuevoYEscaneo()
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 100
            Send, !{Tab}
            Send, {Alt Up}
            Sleep, 500
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
            Sleep, 100
    ; =========================================================================
    CopiarYPegarFormulario()
    ; =========================================================================
    Send, {NumpadMult}
    Return

; =========================================================================
; CREAR FORMULARIO 29 EN CONTADURIA (SIN CARATULA)
; =========================================================================
;(*)
NumpadMult::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYRepetir2()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, PA{ENTER}
            Sleep, 100
            Send, !{Tab}
            Send, {Alt Up}
            Sleep, 500
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
            Sleep, 100
    ; =========================================================================
    CopiarYPegarFormulario()
    ; =========================================================================
    Send, {NumpadDiv}
    Return

; =========================================================================
; CREAR FORMULARIO 29 EN PATRIMONIO (SIN CARATULA)
; =========================================================================
;(/)
NumpadDiv::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYNuevo()
    ; =========================================================================
    Clipboard := Caratula ; El beneficiario se carga en el portapapeles
    Return

; ================================================================================================================================================
; CON CARATULA
; ================================================================================================================================================

; =========================================================================
; CAMBIAR EL TIPO DE EXPEDIENTE A HACIENDA (CON CARATULA)
; =========================================================================
RCtrl & NumpadDot::
    Click, 816, 453
    Sleep, 200
    SendInput, HAC{ENTER}
    Sleep, 100
    Click, 880, 300   ; Seleccionar caratula
    return

; =========================================================================
; CREAR EXP EN HACIENDA (CON CARATULA)
; =========================================================================
;(CTRL +)
RCtrl & NumpadAdd::
    ; =========================================================================
    CrearExpNuevoYEscaneo()
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratula()
    ; =========================================================================
    Send, {RCtrl}{NumpadMult}
    Return

; =========================================================================
; CREAR EXP EN CONTADURIA (CON CARATULA)
; =========================================================================
;(CTRL *)
RCtrl & NumpadMult::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYRepetir2()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, PA{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratula()
    ; =========================================================================
    Send, {NumpadDiv}
    Return

; =========================================================================
; CREAR FORMULARIO 29 EN HACIENDA (CON CARATULA)
; =========================================================================
|::
    ; =========================================================================
    CrearExpNuevoMismaIMG()
    ; =========================================================================
    CerrarEscaneo()
    ; =========================================================================
    Bucle2()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 300
            Click, 670, 182  ;Seleccionar alcance
            Sleep, 200
            SendInput, 99
            Sleep, 100
            Send, !{Tab}
            Sleep, 500
            WinGet, IDVentanaActiva, ID, A
            if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
            Sleep, 100
    ; =========================================================================
    CopiarYPegarFormulario()
    ; =========================================================================
    Send, {NumpadMult}
    Return

; ================================================================================================================================================
; CON CARATULA Y SUB FORMULARIO
; ================================================================================================================================================

; =========================================================================
; CREAR EXP EN HACIENDA (CON CARATULA Y SUB FORMULARIO)
; =========================================================================
LCtrl & F1::
    ; =========================================================================
    CrearExpNuevoYEscaneo()
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYRepetir()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, CONTAD{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratulaFormulario()
    ; =========================================================================
    Send, {LCtrl}{F2}
    Return

; =========================================================================
; CREAR EXP EN CONTADURIA (CON CARATULA Y SUB FORMULARIO)
; =========================================================================
LCtrl & F2::
    ; =========================================================================
    CrearExpNuevoMismaIMG_inyect()
    ; =========================================================================
    GuardarYRepetir2()
    ; =========================================================================
            Sleep, 200
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, PA{ENTER}
            Sleep, 300
            Send, !{Tab}
            Sleep, 500
    WinGet, IDVentanaActiva, ID, A
        if (IDVentanaActiva) {
            ; Forzamos a que se restaure por si está maximizada
            WinRestore, ahk_id %IDVentanaActiva%
            ; La movemos abajo a la izquierda
            WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
            ; La mantiene al frente y enfocada
            WinActivate, ahk_id %IDVentanaActiva% 
    }
    ; =========================================================================
    CopiarYPegarCaratulaFormulario()
    ; =========================================================================
    Send, {NumpadDiv}
    Return

; =================================================================================================================================================
; SUBIDA MANUAL
; =================================================================================================================================================

    F1::
        ; =========================================================================
        CrearExpNuevoYEscaneo()
        ; =========================================================================
        AbrirEscaneo()
    Return

    F2::
    SubidaUploader()
    Return

    F3::
    GuardarYRepetir()
        ; =========================================================================
                Sleep, 200
                Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
                Sleep, 200
                SendInput, CONTAD{ENTER}
                Sleep, 300
                Click, 670, 182  ;Seleccionar alcance
                Sleep, 200
                SendInput, 99
                Sleep, 100
                Send, !{Tab}
                Sleep, 500
                WinGet, IDVentanaActiva, ID, A
                if (IDVentanaActiva) {
                ; Forzamos a que se restaure por si está maximizada
                WinRestore, ahk_id %IDVentanaActiva%
                ; La movemos abajo a la izquierda
                WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
                ; La mantiene al frente y enfocada
                WinActivate, ahk_id %IDVentanaActiva% 
        }
                Sleep, 100
        ; =========================================================================
        CopiarYPegarFormulario()
    Return

    F4::
    CrearExpNuevoMismaIMG()
        ; =========================================================================
        CerrarEscaneo()
        ; =========================================================================
        Bucle2()
        ; =========================================================================
        SubidaUploader()
    Return

    F8::
    GuardarYRepetir2()
        ; =========================================================================
                Sleep, 200
                Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
                Sleep, 200
                SendInput, PA{ENTER}
                Sleep, 300
                Click, 670, 182  ;Seleccionar alcance
                Sleep, 200
                SendInput, 99
                Sleep, 100
                Send, !{Tab}
                Sleep, 500
                WinGet, IDVentanaActiva, ID, A
                if (IDVentanaActiva) {
                ; Forzamos a que se restaure por si está maximizada
                WinRestore, ahk_id %IDVentanaActiva%
                ; La movemos abajo a la izquierda
                WinMove, ahk_id %IDVentanaActiva%,, -7, 516, 974, 523
                ; La mantiene al frente y enfocada
                WinActivate, ahk_id %IDVentanaActiva% 
        }
                Sleep, 100
        ; =========================================================================
        CopiarYPegarFormulario()
    Return

    F9::
    GuardarYNuevo()
    Return

