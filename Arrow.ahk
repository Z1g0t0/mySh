#SingleInstance Force
SetWorkingDir %A_ScriptDir%
if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%" ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  first.

; Habilita debug de teclas digitadas
; #InstallKeybdHook

; ABNT2 - Remapeia IJKL arrows com Alt
;
; Segure o shift direito do teclado e as seguinte teclas:
; I - Cima
; J - Esquerda
; K - Baixo
; L - Direita

Alt & k:: Send {Blind}{Alt up}{Up}
Alt & h:: Send {Blind}{Alt up}{Left}
Alt & j:: Send {Blind}{Alt up}{Down}
Alt & l:: Send {Blind}{Alt up}{Right}

RAlt & k:: Send {Blind}{RAlt up}{Up}
RAlt & h:: Send {Blind}{RAlt up}{Left}
RAlt & j:: Send {Blind}{RAlt up}{Down}
RAlt & l:: Send {Blind}{RAlt up}{Right}

<^>!h:: Send {Blind}{^Left}
<^>!l:: Send {Blind}{^Right}
