os: windows
win.title: /[*]julia.*[*] - GNU Emacs/
-
# Julia terminal
tag(): terminal

# Petr Krysl 2024
# Julia package commands. Emacs running in WSL.

julia: insert("julia --project=. ")

# Package operations
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

# Commands for changing
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