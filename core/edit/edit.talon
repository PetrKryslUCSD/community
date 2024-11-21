# Compound of action(select, clear, copy, cut, paste, etc.) and modifier(word, line, etc.) commands for editing text.
# eg: "select line", "clear all"
<user.edit_action> <user.edit_modifier>: user.edit_command(edit_action, edit_modifier)

# Zoom
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_reset()

# Searching
(find it | search): edit.find()
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

# Petr Krysl 2020-2023: I like these shorter versions: skip, way, up, down, left, right
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

go page up: edit.page_up()
go page down: edit.page_down()

# Selecting

# Petr Krysl 2023: I like these shorter versions
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
(indent less | out dent): edit.indent_less()

# Delete
clear left: edit.delete()
clear right: user.delete_right()

clear up:
    edit.extend_line_up()
    edit.delete()

clear down:
    edit.extend_line_down()
    edit.delete()

clear word left:
    edit.extend_word_left()
    edit.delete()

clear word right:
    edit.extend_word_right()
    edit.delete()

# Copy
copy that: edit.copy()
copy word left: user.copy_word_left()
copy word right: user.copy_word_right()

#to do: do we want these variants, seem to conflict
# copy left:
#      edit.extend_left()
#      edit.copy()
# copy right:
#     edit.extend_right()
#     edit.copy()
# copy up:
#     edit.extend_up()
#     edit.copy()
# copy down:
#     edit.extend_down()
#     edit.copy()

# Cut
cut that: edit.cut()
cut word left: user.cut_word_left()
cut word right: user.cut_word_right()

#to do: do we want these variants
# cut left:
#      edit.select_all()
#      edit.cut()
# cut right:
#      edit.select_all()
#      edit.cut()
# cut up:
#      edit.select_all()
#     edit.cut()
# cut down:
#     edit.select_all()
#     edit.cut()

# Paste
# Petr Krysl, 2022
copy: edit.copy() 
cut: edit.cut() 
paste: edit.paste() 
paste match: edit.paste_match_style()

# Duplication
clone that: edit.selection_clone()
clone line: edit.line_clone()

# Insert new line. Disable Petr Krysl 2024
#new line above: edit.line_insert_up()
#new line below | slap: edit.line_insert_down()

# Insert padding with optional symbols
(pad | padding): user.insert_between(" ", " ")
(pad | padding) <user.symbol_key>+:
    insert(" ")
    user.insert_many(symbol_key_list)
    insert(" ")

# Undo/redo  # Petr Krysl, 2024
nope: edit.undo() 
redo that: edit.redo()

# Save Petr Krysl, 2024
[file] save: edit.save()
[file] save all: edit.save_all()

[go] line mid: user.line_middle()

# Petr Krysl 2020: I prefer to insert the enter where the cursor is.
slap:
    #edit.line_end()
    key(enter)


