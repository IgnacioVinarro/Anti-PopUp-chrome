#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

SetTimer(RevisarAviso, 1000)

RevisarAviso() {
    chromeId := WinExist("ahk_exe chrome.exe")
    if !chromeId
        return

    try {
        WinActivate(chromeId)
        if !WinWaitActive(chromeId, , 1)
            return

        chrome := UIA.ElementFromHandle(chromeId, True)
        btn := chrome.FindFirstByName("Aceptar")
        if btn.Exists
            btn.Click("left")
    }
}