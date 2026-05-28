#Requires AutoHotkey 2
#SingleInstance Force

CoordMode "ToolTip", "Screen"
CoordMode "Mouse",   "Screen"
tipX := 720
tipY := 8

Run "pwsh -NoExit -WorkingDirectory C:\Users\morty\.config\komorebi -Command .\Start-Komorebi-current.ps1",,"Hide"

Info(string) {
   ToolTip string, tipX, tipY
}

Info "AutoHotkey " . A_PtrSize*8 . "bit " . A_ScriptName

KomoRunWait(cmd) {
   Info "RunWait komorebic.exe " . cmd
   RunWait(format("komorebic.exe {}", cmd),, "Hide" )
}

KomoRun(cmd) {
   cmdFrmt := format("komorebic.exe {}", cmd)
   Info "Run " . cmdFrmt
   Run(format("komorebic.exe {}", cmd), , "Hide")
}

F2:: {
   Info "Wrapper: Start-Komorebi-current.ps1"
   Run "pwsh -NoExit -WorkingDirectory C:\Users\morty\.config\komorebi -Command .\Start-Komorebi-current.ps1",,"Hide"
}

+F2:: {
   KomoRun('stop --bar --masir')
}

#enter:: {
   ;KomoRunWait("preselect-direction left")
   ;Sleep 2000
   Run "wt.exe"
   Sleep 200
   KomoRunWait("promote")
}

#w:: {
   ;KomoRunWait("preselect-direction left")
   Run "firefox.exe"
   Sleep 1000
   KomoRunWait("promote")
}

^Tab:: ToolTip ThisHotkey, tipX, TipY
+Tab:: ToolTip ThisHotkey, tipX, TipY
;#Tab:: ToolTip ThisHotkey, tipX, TipY
;#Tab:: {
;   ToolTip ThisHotkey, tipX, TipY
;   ;Send "!{Tab}"
;   AltTab
;}
;!Tab:: ToolTip ThisHotkey, tipX, TipY
;#Tab::AltTabMenu

^#r:: { 
   KomoRunWait("retile")    ; komorebic retile
   Sleep 1000               ; Wait 1000ms
   reload                   ; Reloads this script
}

#q:: KomoRunWait("close")
+#q:: Send "!{F4}"

; Ctrl+Win+e edit komorebi-current.ahk, then reload on exit.
^#e:: {
   Info "Edit: komorebi-current.ahk"
   RunWait( format("nvim.exe {}", "C:\Users\morty\.config\komorebi\komorebi-current.ahk") )
   reload
}


#r:: KomoRun("retile")

+#enter::KomoRunWait("promote")

;; Move windows across workspaces
#+1::KomoRunWait("move-to-workspace 0")
#+2::KomoRunWait("move-to-workspace 1")
#+3::KomoRunWait("move-to-workspace 2")
#+4::KomoRunWait("move-to-workspace 3")
#+5::KomoRunWait("move-to-workspace 4")
#+6::KomoRunWait("move-to-workspace 5")
#+7::KomoRunWait("move-to-workspace 6")
#+8::KomoRunWait("move-to-workspace 7")

;; Focus workspaces       Win+1234567
#1::KomoRunWait("focus-workspace 0")
#2::KomoRunWait("focus-workspace 1")
#3::KomoRunWait("focus-workspace 2")
#4::KomoRunWait("focus-workspace 3")
#5::KomoRunWait("focus-workspace 4")
#6::KomoRunWait("focus-workspace 5")
#7::KomoRunWait("focus-workspace 6")
#8::KomoRunWait("focus-workspace 7")

;; Resize window    Win+Shift+hjkl
#+l::KomoRunWait("resize-axis horizontal increase")
#+h::KomoRunWait("resize-axis horizontal decrease")
#+k::KomoRunWait("resize-axis vertical increase")
#+j::KomoRunWait("resize-axis vertical decrease")

;; Focus window Win+hjkl
#h::KomoRunWait("focus left")
#j::KomoRunWait("focus down")
#k::KomoRunWait("focus up")
#l::KomoRunWait("focus right")
#n::KomoRunWait("cycle-focus next")
#+n::KomoRunWait("cycle-focus previous")

;; Manipulate windows
#m::KomoRunWait("toggle-monocle")
#t::KomoRunWait("toggle-monocle")
