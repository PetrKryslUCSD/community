app: vscode
# Looks for special string in window title.
# NOTE: This requires you to add a special setting to your VSCode settings.json
# See [our vscode docs](./README.md#terminal)
win.title: /focus:Terminal/
code.language: python
-
# Python terminal
tag(): terminal

py run: insert("py ")
py test: insert("py test.py")

# Petr Krysl 2025
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

# Petr Krysl 2025
copy: key(shift-ctrl-c)
paste: key(shift-ctrl-v)