app: xplorer2
-
tag(): user.file_manager
action(user.file_manager_go_back):
    key("alt-left")
action(user.file_manager_go_forward):
    key("alt-right")
action(user.file_manager_open_parent):
    key("alt-backspace")
    
^go <user.letter>$: user.file_manager_open_volume("{letter}:")
go app data: user.file_manager_open_directory("%AppData%")
go drop box: user.file_manager_open_directory("Dropbox")
go program files: user.file_manager_open_directory("%programfiles%")

# Petr Krysl 2021
# Q: Could I also ask about the title bar of the window: could I set it to whatever I want?
# A: There is a registry tweak called DPF_NOTITLE, you can look it up in a file 
# called REGISTRY.TXT in the xplorer2 installation folder, but to turn it on 
# requires registry editing after you quit xplorer2. For more information 
# see REGISTRY.TXT file

peek:
    key(alt-q)

    
