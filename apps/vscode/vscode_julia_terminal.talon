app: vscode
# Looks for special string in window title.
# NOTE: This requires you to add a special setting to your VSCode settings.json
# See [our vscode docs](./README.md#terminal)
# "window.title": "${activeEditorShort}${separator}${rootName}${separator}${profileName}${separator}focus:${focusedView}",
win.title: /focus:Terminal/
code.language: julia
-
# Julia terminal
tag(): terminal
tag(): user.generic_unix_shell

[funky] include: include("\(")

# Petr Krysl 2024
# Julia package commands. 

package envy: 
    insert('using Pkg; Pkg.activate("."); Pkg.instantiate(); ') 

package revise: 
    insert("using Revise; ") 

package test: 
    insert('using Pkg; Pkg.test(); ') 

package update: 
    insert('using Pkg; Pkg.update(); ') 

package status: 
    insert('using Pkg; Pkg.status(); ') 

package build: 
    insert('using Pkg; Pkg.build(); ') 

package precompile: 
    insert('using Pkg; Pkg.precompile(); ') 

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