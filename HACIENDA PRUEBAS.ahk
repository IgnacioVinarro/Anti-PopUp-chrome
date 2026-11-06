; ==================================================================================================================================================
; CONFIGURACIÓN INICIAL (Obligatoria para que funcione bien)
; ==================================================================================================================================================
    #NoEnv
    #SingleInstance Force
    SetWorkingDir %A_ScriptDir%
    SetTitleMatchMode, 2          ; Permite buscar partes del título (ej. "Documentos")
    MsgBox, 64, Script Listo, El script se ha iniciado correctamente.
    Return

; ==================================================================================================================================================
; CONFIGURACIÓN ADICIONAL (Opcional)
; ==================================================================================================================================================

; =========================================================================
; BOTÓN DE S.O.S. (EMERGENCIA)
; =========================================================================
    ; Si los clics se vuelven locos, presiona BLOQ NUM para cerrar el script de inmediato
    NumLock::ExitApp

; =========================================================================
; COPIAR A PARTIR DE ACÁ
; =========================================================================

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

CopiarYPegarFormulario()
{
    ; =========================================================================
    ; VARIABLES
    ; =========================================================================
    global Expediente := ""
    global Año := ""
    global Alcance := ""
    global Caratula := ""
    global OrdenDeCompra := ""
    global Factura := ""
    global Fecha := ""
    global Devengado := ""
    global OrdenDePago := ""
    global OrdenDeCancelacion := ""
    global ReciboDePago := ""
    global Compromiso := ""
    global AltaProvisoria := ""
    global SolicitudDePedido := ""
    global SolicitudDeGastos := ""
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
return