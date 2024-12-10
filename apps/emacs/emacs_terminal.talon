os: windows
win.title: /[*]ansi-term[*] - GNU Emacs/
-
# Julia terminal
tag(): terminal

# Commands for changing folders
go <user.letter>:
    insert("cd {letter}")
go shift <user.letter>:
    Letter = user.formatted_text(letter, "ALL_CAPS")
    insert("cd {Letter}")
go selected:
    insert("cd ")    
    key(shift-insert)
go parent:
    insert("cd ..")
go dash:
    insert("cd -")

# Copy / paste in vterm terminal
copy:
    key(ctrl-c ctrl-t)
    edit.copy()
    key(ctrl-c ctrl-t)
paste:
    edit.paste()
        