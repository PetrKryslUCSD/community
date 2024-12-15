os: windows
win.title: /[*]ansi-term[*].* - GNU Emacs/
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
where: insert("pwd")

# Copy / paste in vterm terminal
copy:
    key(ctrl-c ctrl-t)
    edit.copy()
    key(ctrl-c ctrl-t)
paste:
    edit.paste()

git status: "git status\n"
git pull: "git pull\n"
git push: "git push\n"
git commit: 
    insert("git commit -m\"\"")
    key(left)
        