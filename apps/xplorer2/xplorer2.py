from talon import Context, Module, actions, imgui, settings, ui, app

import os

mod = Module()
apps = mod.apps

# An explanation on how to get the title set up:
# Petr Krysl 2021
# Q: Could I also ask about the title bar of the window: could I set 
# it to whatever I want?
# A: There is a registry tweak called DPF_NOTITLE, you can look it 
# up in a file called REGISTRY.TXT in the xplorer2 installation folder,
# but to turn it on requires registry editing after you quit xplorer2. 
apps.xplorer2 = """
os: windows
and app.name: /xplorer².*/
"""

ctx = Context()
ctx.matches = r"""
app: xplorer2
"""

user_path = os.path.expanduser("~")
directories_to_remap = {}
directories_to_exclude = {}

if app.platform == "windows":
    is_windows = True
    import ctypes

    GetUserNameEx = ctypes.windll.secur32.GetUserNameExW
    NameDisplay = 3

    size = ctypes.pointer(ctypes.c_ulong(0))
    GetUserNameEx(NameDisplay, None, size)

    nameBuffer = ctypes.create_unicode_buffer(size.contents.value)
    GetUserNameEx(NameDisplay, nameBuffer, size)
    one_drive_path = os.path.expanduser(os.path.join("~", "OneDrive"))

    # this is probably not the correct way to check for onedrive, quick and dirty
    if False: #os.path.isdir(os.path.expanduser(os.path.join("~", r"OneDrive\Desktop"))):
        print("Have OneDrive")
        default_folder = os.path.join("~", "Desktop")
        directories_to_remap = {
            "Desktop": os.path.join(user_path, "Desktop"),
            "Documents": os.path.join(user_path, "Documents"),
            "Downloads": os.path.join(user_path, "Downloads"),
            "Music": os.path.join(user_path, "Music"),
            "OneDrive": one_drive_path,
            "Pictures": os.path.join(one_drive_path, "Pictures"),
            "Videos": os.path.join(user_path, "Videos"),
        }
    else:
        print("Ignoring OneDrive")
        # todo use expanduser for cross platform support
        directories_to_remap = {
            "Desktop": os.path.join(user_path, "Desktop"),
            "Documents": os.path.join(user_path, "Documents"),
            "Downloads": os.path.join(user_path, "Downloads"),
            "Music": os.path.join(user_path, "Music"),
            "OneDrive": one_drive_path,
            "Pictures": os.path.join(user_path, "Pictures"),
            "Videos": os.path.join(user_path, "Videos"),
        }

    if nameBuffer.value:
        directories_to_remap[nameBuffer.value] = user_path

    directories_to_exclude = [
        "",
        "Run",
        "Task Switching",
        "Task View",
        "This PC",
        "File Explorer",
        "Program Manager",
    ]


@ctx.action_class("user")
class user_actions:
    def file_manager_current_path():
        path = ui.active_window().title

        if path in directories_to_remap:
            path = directories_to_remap[path]

        if path in directories_to_exclude:
            actions.user.file_manager_hide_pickers()
            path = ""

        return path

    def file_manager_terminal_here():
        actions.key("f10")

    def file_manager_show_properties():
        """Shows the properties for the file"""
        actions.key("alt-enter")

    def file_manager_open_directory(path: str):
        """opens the directory that's already visible in the view"""
        # xplorer2 has a special key for that (not ctrl-L!)
        actions.key("shift-tab")
        actions.insert(path)
        actions.key("enter")

    def file_manager_select_directory(path: str):
        """selects the directory"""
        actions.insert(path)

    def file_manager_new_folder(name: str):
        """Creates a new folder in a gui filemanager or inserts the command to do so for terminals"""
        # xplorer2 has a special key for that
        actions.key("home")
        actions.key("f8")
        actions.insert(name)

    def file_manager_open_file(path: str):
        """opens the file"""
        actions.key("home")
        actions.insert(path)
        actions.key("enter")

    def file_manager_select_file(path: str):
        """selects the file"""
        actions.key("home")
        actions.insert(path)

    def file_manager_open_volume(volume: str):
        """file_manager_open_volume"""
        actions.user.file_manager_open_directory(volume)
