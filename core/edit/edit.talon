# Compound of action(select, clear, copy, cut, paste, etc.) and modifier(word,
# line, etc.) commands for editing text.
# eg: "select line", "clear all"
# For overriding or creating aliases for specific actions, this function will
# also accept strings, e.g. `user.edit_command("delete", "wordLeft")`.
# See edit_command_modifiers.py to discover the correct string for the modify argument,
# and `edit_command_actions.py` `simple_action_callbacks` to find strings for the action argument.
<user.edit_action> <user.edit_modifier>: user.edit_command(edit_action, edit_modifier)

# Zoom
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_reset()

# Searching
find it: edit.find()
next one: edit.find_next()

# Navigation

# The reason for these spoken forms is that "page up" and "page down" are globally defined as keys.
scroll up: edit.page_up()
scroll down: edit.page_down()

# go left, go left left down, go 5 left 2 down
# go word left, go 2 words right
go <user.navigation_step>+: user.perform_navigation_steps(navigation_step_list)

go line start | head: edit.line_start()
go line end | tail: edit.line_end()

# Petr Krysl 2020-2026: I like these shorter versions: skip, way, up, down, left, right
(go word left | skip left):
    edit.word_left()
(go word right | skip right):
    edit.word_right()
[go] way left:
    edit.line_start()
    edit.line_start()
[go] way right:
    edit.line_end()
[go] way down:
    edit.file_end()
[go] way up:
    edit.file_start()

go top: edit.file_start()
go bottom: edit.file_end()

go page up: edit.page_up()
go page down: edit.page_down()

# Selecting

# Petr Krysl 2023-2026: I like these shorter versions
(select word left | ex left):
    edit.extend_word_left()
(select word right | ex right):
    edit.extend_word_right()
(select way left | ex way left):
    edit.extend_line_start()
(select way right | ex way right):
    edit.extend_line_end()
(select up | ex up):
    edit.extend_line_up()
(select down | ex down):
    edit.extend_line_down()

# Indentation
indent [more]: edit.indent_more()
indent less | out dent: edit.indent_less()

# Copy
# Petr Krysl, 2026
copy [that]: edit.copy()

# Cut
cut [that]: edit.cut()

# Paste
paste [that]: edit.paste()
(pace | paste) enter:
    edit.paste()
    key(enter)
paste match: edit.paste_match_style()

# Duplication
clone that: edit.selection_clone()
# clone line: edit.line_clone()
# This is getting confused with go to line, Petr Krysl, 2025
repeat line: edit.line_clone()

# Insert new line
# Petr Krysl, 2026 -- interfered with my own commands
# new line above: edit.line_insert_up()
# new line below | slap: edit.line_insert_down()

# Insert padding with optional symbols
padding: user.insert_between(" ", " ")
(pad | padding) <user.symbol_key>+:
    insert(" ")
    user.insert_many(symbol_key_list)
    insert(" ")

# Undo/redo
nope: edit.undo()
redo that: edit.redo()

# Save
# Petr Krysl, 2026
[file] save: edit.save()
[file] save all: edit.save_all()

[go] line mid: user.line_middle()

# Petr Krysl 2020-2026: I prefer to insert the enter where the cursor is.
slap:
    key(enter)




