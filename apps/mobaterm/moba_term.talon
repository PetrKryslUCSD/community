os: windows
and app.name: MobaXterm
os: windows
and app.exe: mobaxterm.exe
-
# makes the commands in generic_terminal available
tag(): terminal 

# activates the implementation of the commands/functions in generic_terminal
tag(): user.generic_windows_shell

# makes commands for certain applications available
# you can deactivate them if you do not use the application
tag(): user.git
tag(): user.anaconda
# tag(): user.kubectl

go home: 
    insert("cd /drives/c/Users/pkonl/")
go work in progress: 
    insert("cd /drives/c/Users/pkonl/Documents/00WIP")
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

paste:
    key(shift-insert)

recall:
    key(ctrl-r)

list all long:
    insert("ls -al ")
tale follow:
    insert("tail -f ")

git status: 
    insert("git status")
git pull: 
    insert("git pull")

show queue:    insert("squeue ")
submit batch:    insert("sbatch ")
cancel job:    insert("scancel ")

        