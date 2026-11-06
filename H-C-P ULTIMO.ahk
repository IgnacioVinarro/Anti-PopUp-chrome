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
    NumLock::ExitApp

; =========================================================================
; PESTAÑA SELECCIONADA A EXP CREAR
; =========================================================================
    F12::NuevoExp()

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
        Click, 627, 152
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
    }::EnviarCaratula("MUNICIPALIDAD DE MALVINAS ARGENTINAS")
    RCtrl & }::EnviarCaratula("CONSEJO ESCOLAR DE MALVINAS ARGENTINAS")
    RCtrl & F1::EnviarCaratula("BANCO PROVINCIA")
    RCtrl & F2::EnviarCaratula("EMBOTELLADORA DEL PLATA S.A.")
    RCtrl & F3::EnviarCaratula("PROVINCIA SEGUROS S.A.")
    RCtrl & F4::EnviarCaratula("COLLOVA LUIS CARMELO")
    RCtrl & F5::EnviarCaratula("JOSE Y JULIO FRONTANI S.H.")
    RCtrl & F6::EnviarCaratula("BANCO DE LA NACION ARGENTINA")
    RCtrl & F7::EnviarCaratula("MALDONADO MIGUEL ANGEL")
    RCtrl & F8::EnviarCaratula("PIETROWSKI REGINA Y/O VERON MARCELO")
    RCtrl & F9::EnviarCaratula("PONTI CLAUDIO HECTOR")
    RCtrl & F10::EnviarCaratula("SOLMEDICA S.A.")
    RCtrl & F11::EnviarCaratula("COOP. TELEFONICA GRAN BOURG")

; =========================================================================================================================================================================================================================
; INICIO SCRIPT
; =========================================================================================================================================================================================================================

; ==============================================================================================================================================
; FUNCIONES GLOBALES
; ==============================================================================================================================================
    EnviarCaratula(texto) {
        SendInput, %texto%
        Sleep, 50
        Send, {<}
    }

    NuevoExp(){
        SendInput, ^l
        Sleep, 100
        SendInput, http://192.168.0.11/digexp/documentos/editar{ENTER}
        Sleep, 700
        Click, 330, 180
    }

    CopiarTexto() {
        Clipboard := ""
        Send, ^c
        ClipWait, 0.2, 1
        return Trim(Clipboard)
    }

    PegarSiExiste(texto) {
        if (texto != "") {
            Clipboard := texto
            Send, ^v
            Sleep, 50
        }
    }

    CopiarFormulario(tabsAño := 2, incluirCuerpo := false) {
        global
        ; --- COPIAR EXPEDIENTE ---
        Click, 333, 181
        Send, ^a
        Expediente := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR AÑO ---
        Año := CopiarTexto()
        Send, {Tab %tabsAño%} ; Usa 1 o 2 tabs según el argumento ingresado
        Sleep, 100

        ; --- COPIAR ALCANCE ---
        Alcance := CopiarTexto()
        if (incluirCuerpo) {
        Send, {Tab}
        }
        Sleep, 100

        ; --- COPIAR CUERPO ---
        if (incluirCuerpo) {
        Cuerpo := CopiarTexto()
        Sleep, 100
        }

        ; --- COPIAR CARATULA ---
        Click, 918, 306
        Send, ^a ; Selecciona todo el contenido del campo actual
        Caratula := CopiarTexto()
        Sleep, 100

        ; --- BAJAR FORMULARIO ---
        Send, {Ctrl Up}
        Click, 923, 336
        Send, {End}

        ; --- COPIAR RECIBO DE PAGO ---
        Click, 623, 151
        Send, ^a ; Selecciona todo el contenido del campo actual
        ReciboDePago := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR FACTURA ---
        Factura := CopiarTexto()
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

        ; --- COPIAR FECHA ---
        Send, ^a ; Selecciona todo el contenido del campo actual
        Fecha := CopiarTexto()
        Sleep, 100

        ; --- COPIAR SOLICITUD DE PEDIDO ---
        Click, 341, 270
        Send, ^a ; Selecciona todo el contenido del campo actual
        SolicitudDePedido := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR SOLICITUD DE GASTOS ---
        SolicitudDeGastos := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR ORDEN DE COMPRA ---
        OrdenDeCompra := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR ALTA PROVISORIA ---
        AltaProvisoria := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR COMPROMISO ---
        Compromiso := CopiarTexto()
        Send, {Tab}
        Sleep, 100

        ; --- COPIAR DEVENGADO ---
        Devengado := CopiarTexto()
        Sleep, 100
    }
    PegarFormulario(incluirCuerpo := false){
        global
        ; =========================================================================
        ; PEGADO
        ; =========================================================================
        ; --- PEGAR EXPEDIENTE ---
        Click, 333, 181
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
        if (incluirCuerpo){
        Send, {Tab}
        }
        Sleep, 100

        ; --- PEGAR CUERPO ---
        if (incluirCuerpo) {
        PegarSiExiste(Cuerpo)
        Sleep, 100
        }

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

        ; --- PEGAR RECIBO DE PAGO ---
        Click, 623, 151
        Send, ^a
        PegarSiExiste(ReciboDePago)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR FACTURA ---
        PegarSiExiste(Factura)
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

        ; --- PEGAR FECHA ---
        Clipboard := Fecha
        fechaLimpia := RegExReplace(Clipboard, "\D", "")
        Sleep, 150
        SendInput, %fechaLimpia%
        Sleep, 150

        ; --- PEGAR SOLICITUD DE PEDIDO ---
        Click, 341, 270
        Send, ^a ; Selecciona todo el contenido del campo actual
        Clipboard := SolicitudDePedido
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR SOLICITUD DE GASTOS ---
        Clipboard := SolicitudDeGastos
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR ORDEN DE COMPRA ---
        PegarSiExiste(OrdenDeCompra)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR ALTA PROVISORIA ---
        PegarSiExiste(AltaProvisoria)
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR COMPROMISO ---
        Clipboard := Compromiso
        Send, ^v
        Send, {Tab}
        Sleep, 100

        ; --- PEGAR DEVENGADO ---
        Clipboard := Devengado
        Send, ^v
        Sleep, 100
    }

    CopiarCaratula() {
        global
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
        Send, {Tab 2}
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
    }
    PegarCaratula(){
        global
        ; =========================================================================
        ; PEGADO
        ; =========================================================================
        ; --- PEGAR EXPEDIENTE ---
        Click, 333, 181
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
    }

    GuardarFormulario(){
        Click, 827, 454   ; Guardar (botón verde)
        Sleep, 500
        Click, 494, 377   ; Guardar (botón violeta)
        Sleep, 300
        Click, 468, 354   ; Ir a imagenes
        Sleep, 200
    }

    RedirigirFormulario(tipoExpediente := "") {        
        ; Si se pasa un tipo de expediente, abre nueva pestaña y selecciona el tipo
        if (tipoExpediente != "") {
            Send, ^t
            Sleep, 100
            SendInput, http://192.168.0.11/digexp/documentos/editar{Enter}
            Sleep, 700
            Click, 816, 453   ; Seleccionar tipo de expediente (Menú desplegable)
            Sleep, 200
            SendInput, %tipoExpediente%{ENTER}
            Sleep, 100
        }
    }

    TipoCopiado(funcionCopiado, funcionPegado) {
        Click, 914, 452 ; Deseleccionar últ. campo subido
        Sleep, 100
        Send, {Home}
        Sleep, 100

        if IsObject(funcionCopiado) {
        funcionCopiado.Call()
        } else {
        %funcionCopiado%()
        }

        GuardarFormulario()
        
        RedirigirFormulario("CONTAD") ; Pasa "CONTAD" como texto con comillas

        if IsObject(funcionPegado) {
        funcionPegado.Call()
        } else {
        %funcionPegado%()
        }

        GuardarFormulario()
        
        RedirigirFormulario("PAT")    ; Pasa "PAT" como texto con comillas

        if IsObject(funcionPegado) {
        funcionPegado.Call()
        } else {
        %funcionPegado%()
        }
        
        GuardarFormulario()
        
        PegarEnUploader()
    }

    PegarEnUploader(){
        Send, ^1
        Sleep, 200
        Click, 594, 120   ; Copiar
        Sleep, 100
        Click, 1695, 143  ; Pegar (Uploader)
        Sleep, 100
    }


    AbrirEscaneo()
    {
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
            Click, 100, 630   ; Dig (Omnipage)
            Sleep, 100
            Click, 19, 106    ; Si procesar todas las páginas (Omnipage)
            Sleep, 400
            Click, 160, 226  ; Aceptar (Omnipage)
            Sleep, 200
            if WinExist("ahk_exe omnipage19.exe") {
            WinWaitActive, ahk_exe TwainClientU.exe, , 6
            WinActivate, ahk_exe TwainClientU.exe
            Sleep, 200
            Click, 480, 20    ; Cerrar (Nuance escaner)
        } else {
            MsgBox, 48, Error, TwainClientU.exe no está abierto.
        }
    }

    SubidaUploader(){
        ;SUBIR IMÁGENES AL UPLOADER AUTOMÁTICAMENTE
        Sleep, 100
        WinActivate, ahk_exe Uploader.exe
        WinWaitActive, ahk_exe Uploader.exe
        Click, 141, 281
        ; =========================================================================
        ;CARGAR IMÁGENES AL SISTEMA AUTOMÁTICAMENTE
        WinWait, Carga completa ahk_exe Uploader.exe
        Sleep, 200
        WinActivate, Carga completa ahk_exe Uploader.exe
        Sleep, 200
    }

    Bucle1(){
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

    Bucle2(){
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

    GuardarYNuevo() {
        Send, {Enter}
        Sleep, 300
        Click, -5, 485    ; Bajar barra pestaña Google

        Loop, 3 { 
            Sleep, 300
            Click, 851, 146   ; Cargar imágenes (botón azul)
            Sleep, 1500
            Click, 480, 400   ; OK (botón violeta)
            Sleep, 500
            Send, {End}
            Sleep, 300
            Click, 827, 454   ; Guardar (botón verde)
            Sleep, 300
            Click, 494, 377   ; Guardar (botón violeta)
            Sleep, 500
            
            if (A_Index < 3) {
                Send, ^{F4}
            }
        }
        NuevoExp()
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
    TipoCopiado("CopiarFormulario", "PegarFormulario")
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYNuevo()
    ; =========================================================================
    Clipboard := Caratula ; El beneficiario se carga en el portapapeles
    ; =========================================================================
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
;(*)
NumpadMult::
    ; =========================================================================
    TipoCopiado("CopiarCaratula", "PegarCaratula")
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYNuevo()
    ; =========================================================================
    Return

; =========================================================================
; CREAR FORMULARIO 29 EN HACIENDA (CON CARATULA)
; =========================================================================
|::
    ; =========================================================================
    TipoCopiado("CopiarFormulario", "PegarFormulario")
    ; =========================================================================
    CerrarEscaneo()
    ; =========================================================================
    Bucle2()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYNuevo()
    ; =========================================================================
    Return

; ================================================================================================================================================
; CON CARATULA Y SUB FORMULARIO
; ================================================================================================================================================

; =========================================================================
; CREAR EXP EN HACIENDA (CON CARATULA Y SUB FORMULARIO)
; =========================================================================
;(/)
NumpadDiv::
    ; =========================================================================
    fnCopiar := Func("CopiarFormulario").Bind(2, true)
    fnPegar  := Func("PegarFormulario").Bind(true)
    TipoCopiado(fnCopiar, fnPegar)
    ; =========================================================================
    AbrirEscaneo()
    ; =========================================================================
    Bucle1()
    ; =========================================================================
    SubidaUploader()
    ; =========================================================================
    GuardarYNuevo()
    ; =========================================================================
    Return

; ================================================================================================================================================
; MENÚ DE PUNTO DE PARTIDA SEGURO (RECUPERACIÓN)
; ================================================================================================================================================
RCtrl & NumpadAdd::
        Menu, PuntosDePartida, Add, 1. Copiar datos, Copiar_Datos
        Menu, PuntosDePartida, Add, 2. Pegar datos, Pegar_Datos
        Menu, PuntosDePartida, Add, 3. Pegar en Contaduria, Pegar_Contaduria
        Menu, PuntosDePartida, Add, 4. Pegar en Patrimonio, Pegar_Patrimonio
        Menu, PuntosDePartida, Add, 5. Escanear (OmniPage), Escanear
        Menu, PuntosDePartida, Add, 6. Subir al Uploader, Subir_Uploader
        Menu, PuntosDePartida, Add, 7. Guardar imagenes (Servidor), Guardar_Imágenes
        Menu, PuntosDePartida, Show
    return

    ; --- SUB-RUTINAS SEGÚN LA OPCIÓN SELECCIONADA ---

    Copiar_Datos:
        CopiarFormulario(1)
    return

    Pegar_Datos:
        PegarFormulario()
    return

    Pegar_Contaduria:
        ; =========================================================================
        RedirigirFormulario("CONTAD") ; Pasa "CONTAD" como texto con comillas
        ; =========================================================================
        PegarFormulario()
        ; =========================================================================
        GuardarFormulario()
        ; =========================================================================

    Pegar_Patrimonio:
        ; =========================================================================
        RedirigirFormulario("PAT")    ; Pasa "PAT" como texto con comillas
        ; =========================================================================
        PegarFormulario()
        ; =========================================================================
        GuardarFormulario()
        ; =========================================================================

    Escanear:
        ; =========================================================================
        PegarEnUploader()
        ; =========================================================================
        AbrirEscaneo()
        ; =========================================================================
        Bucle1()
        ; =========================================================================

    Subir_Uploader:
        ; =========================================================================
        SubidaUploader()
        ; =========================================================================

    Guardar_Imágenes:
        ; =========================================================================
        GuardarYNuevo()
        ; =========================================================================
        Clipboard := Caratula ; El beneficiario se carga en el portapapeles
        ; =========================================================================
    return