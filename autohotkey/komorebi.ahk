#Requires AutoHotkey 2
#SingleInstance Force

CoordMode "ToolTip", "Screen"
CoordMode "Mouse", "Screen"
tipX := 750
tipY := 8

ToolTip "AutoHotkey " . A_PtrSize*8 . "bit", tipX, tipY
;SetTimer () => ToolTip(), -5000

KomoRunWait(cmd) {
    ToolTip "komorebic.exe " . cmd, tipX, tipY
    ;SetTimer () => ToolTip(), -5000
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

KomoRun(cmd) {
    ToolTip "komorebic.exe " . cmd, tipX, tipY
    ;SetTimer () => ToolTip(), -5000
    Run(format("komorebic.exe {}", cmd), , "Hide")
}

#q:: KomoRunWait("close")

;F2::  {
;      Run "pwsh Start-Komorebi.ps1"
;}

F2::  {
      KomoRun('start --config "C:\\Users\\morty\\.config\\komorebi\\komorebi.json" --bar --masir')
}

+F2:: KomoRunWait("stop  --bar --masir")

^#e:: {
    RunWait( format("nvim.exe {}", "C:\Users\morty\.config\autohotkey\komorebi.ahk") )
    reload
}


#r::   KomoRun("retile")

^#r::  { 
       KomoRunWait("retile")
       reload
}


#enter:: {
   ;KomoRunWait("preselect-direction left")
   ;Sleep 2000
   RunWait "wt.exe"
   Sleep 100
   KomoRunWait("promote")
}

#w:: {
   ;KomoRunWait("preselect-direction left")
   RunWait "firefox.exe"
   Sleep 300
   KomoRunWait("promote")
}

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


;; Move windows
;!+h::KomoRunWait("move left")
;!+j::KomoRunWait("move down")
;!+k::KomoRunWait("move up")
;!+l::KomoRunWait("move right")
;
;; Stack windows
;!Left::KomoRunWait("stack left")
;!Down::KomoRunWait("stack down")
;!Up::KomoRunWait("stack up")
;!Right::KomoRunWait("stack right")
;!;::KomoRunWait("unstack")
;![::KomoRunWait("cycle-stack previous")
;!]::KomoRunWait("cycle-stack next")
;
;
;
;; Window manager options
;!+r::KomoRunWait("retile")
;!p::KomoRunWait("toggle-pause")
;
;; Layouts
;!x::KomoRunWait("flip-layout horizontal")
;!y::KomoRunWait("flip-layout vertical")
;
;
;!m::KomoRunWait("minimize")
;
