#Requires AutoHotkey v2.0.2
#SingleInstance Force

ToolTip("AutoHotkey " . A_PtrSize*8 . "bit version")
SetTimer () => ToolTip(), -5000

Komorebic(cmd) {
    ToolTip cmd
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

; Manipulate windows
#m::Komorebic("toggle-monocle")
#t::Komorebic("toggle-monocle")

^#r:: {
    Komorebic("retile")
    reload
}

#enter:: {
   RunWait "wt.exe"
   Sleep 200
   Komorebic("promote")
}

#w:: {
   RunWait "firefox.exe"
   Sleep 200
   Komorebic("promote")
}

+#enter::Komorebic("promote")
#q::Komorebic("close")

;; Move windows across workspaces
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")

;; Workspaces       Win+1234567
#1::Komorebic("focus-workspace 0")
#2::Komorebic("focus-workspace 1")
#3::Komorebic("focus-workspace 2")
#4::Komorebic("focus-workspace 3")
#5::Komorebic("focus-workspace 4")
#6::Komorebic("focus-workspace 5")
#7::Komorebic("focus-workspace 6")
#8::Komorebic("focus-workspace 7")

;; Resize windows    Win+Shift+hjkl
#+l::Komorebic("resize-axis horizontal increase")
#+h::Komorebic("resize-axis horizontal decrease")
#+k::Komorebic("resize-axis vertical increase")
#+j::Komorebic("resize-axis vertical decrease")

; Focus windows Win+hjkl
#h::Komorebic("focus left")
#j::Komorebic("focus down")
#k::Komorebic("focus up")
#l::Komorebic("focus right")


;!m::Komorebic("minimize")
;
;
;!+[::Komorebic("cycle-focus previous")
;!+]::Komorebic("cycle-focus next")
;
;; Move windows
;!+h::Komorebic("move left")
;!+j::Komorebic("move down")
;!+k::Komorebic("move up")
;!+l::Komorebic("move right")
;
;; Stack windows
;!Left::Komorebic("stack left")
;!Down::Komorebic("stack down")
;!Up::Komorebic("stack up")
;!Right::Komorebic("stack right")
;!;::Komorebic("unstack")
;![::Komorebic("cycle-stack previous")
;!]::Komorebic("cycle-stack next")
;
;
;
;; Window manager options
;!+r::Komorebic("retile")
;!p::Komorebic("toggle-pause")
;
;; Layouts
;!x::Komorebic("flip-layout horizontal")
;!y::Komorebic("flip-layout vertical")
;
;
