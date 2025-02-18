os: windows
and app.name: WinEdt 11
os: windows
and app.exe: /^winedt\.exe$/i
-

tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.tabs

action(app.tab_previous):
	key(ctrl-pageup)
action(app.tab_next):
	key(ctrl-pagedown)
action(code.toggle_comment):
	key(ctrl-q)
action(edit.line_clone):
	key(ctrl-d)
action(edit.line_swap_up):
	key(ctrl-shift-up)
action(edit.line_swap_down):
	key(ctrl-shift-down)
action(edit.indent_more): key(tab)
action(edit.indent_less): key(shift-tab)

search: key(ctrl-f)
next match: key(alt-f3)

go line: key(ctrl-g)
go line <number>:
    key(ctrl-g)
    insert("{number}")
    key(enter)

sark: key("alt-f11") 
ex mark: key(ctrl-shift-f11)

compile: key(shift-ctrl-p)

new paragraph: 
    key(enter:2)
latex equation [ref]: 
    insert("~()")
    key(left)
    insert("\\ref{")

latex ref: 
    insert("~\\ref{")
latex hyper [ref]: 
    insert("~\\href{")
    
latex citation: 
    insert("~\\cite{")
math roman:
    insert("\\mathrm{}")
    key(left:1)
math bold:
    insert("\\mathbf{}")
    key(left:1)
math underline:
    insert("\\underline{{}}")
    key(left:1)
bold math:
    insert("\\boldmath$$")
    key(left:1)
math box:
    insert("\\mbox{}")
    key(left:1)    
math big par:
    insert("\\left(\\right)")
    key(left:7)
math prime:
    insert("\\prime")
math partial:
    insert("\\partial")
math sub:
    insert("_{}")
    key(left:1)
math super:
    insert("^{}")
    key(left:1)
math big square:
    insert("\\left[\\right]")
    key(left:7)
math array:
    insert("\\begin{{array}}{{}}\\end{{array}}") 
    key(left:12)
latex begin:
    insert("\\begin{")
math fraction:
    insert("\\frac{{}}{{}}")
    key(left:3)

reflow: key(alt-shift-insert)

tit case: key(alt-up)
low case: key(ctrl-alt-down)
up case: key(ctrl-alt-up)

[book] mark set: key("alt-f11") 
[book] mark previous: key("ctrl-shift-backspace")  
[book] mark next: key("ctrl-shift-delete")  
