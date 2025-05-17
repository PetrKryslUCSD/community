os: windows
and win.title: /^.* - Spyder$/i
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs
tag(): user.command_search

flip comment: key(ctrl-1)
repeat line: key(ctrl-alt-down)
scoot down: key(alt-down)
scoot up: key(alt-up)
enter array: key(ctrl-m)
assign: insert(" = ")
completion: key(ctrl-space)

auto format: key(ctrl-alt-i)

run file: key(f5)
debug file: key(ctrl-f5)
step [over]: key(ctrl-f10)
step in: key(ctrl-f11)
step out: key(ctrl-shift-f11)
continue: key(ctrl-f12)

search in files: key(alt-shift-f)
last edit: key(ctrl-alt-shift-left)

go any: key(ctrl-p)
go docs: key(ctrl-i)
