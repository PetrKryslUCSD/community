code.language: julia
-
tag(): user.code_imperative
tag(): user.code_comment_line
tag(): user.code_comment_block_c_like
tag(): user.code_comment_documentation
tag(): user.code_data_bool
tag(): user.code_functions_common
tag(): user.code_libraries
tag(): user.code_libraries_gui
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_math

settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

# state unsafe: "unsafe "

state struct <user.text>:
    insert("struct ")
    insert(user.formatted_text(text, "PUBLIC_CAMEL_CASE"))

state enum <user.text>:
    insert("enum ")
    insert(user.formatted_text(text, "PUBLIC_CAMEL_CASE"))

toggle use: user.code_toggle_libraries()

state using: "using "
state import: "import "
end: 
    insert("end ")
    key(backspace)
state else: insert("else")
state comprehension:
    insert("[index_ for index_ in eachindex(collection)]")
    key(end left:7)
    key("ctrl-d")
state where:
    insert(" where { ")
    key(end left:1)
state for each index:
    insert("for _ in eachindex()")
    key(enter)
    insert("end ")
    key(backspace up)
    key(end left:1)
state for pairs:
    insert("for (, ) in pairs()")
    key(enter)
    insert("end ")
    key(backspace up)
    key(end left:1)
state for axes:
    insert("for _ in axes()")
    key(enter)
    insert("end ")
    key(backspace up)
    key(end left:1)
state function:
    insert("function ()")
    key(enter)
    insert("end ")
    key(backspace up)
    key(end left:2)
assign: insert(" = ")

of type: insert("::")
of subtype: insert("<:")
    
doc string: 
    key(home)
    key(enter up)
    insert("\"\"\"")
    key(end enter)
    key(end enter)
    insert("\"\"\"")
    key(up:1)
    insert("    ")
    key("ctrl-v")
    key(end enter)
    key(end enter)
    key(backspace)
test module:
    insert("module mbas001\n")
    insert("using Test\n")
    insert("function test()\n")
    insert("   @test 1 == 1\n")
    insert("   true\n")
    insert("end\n")
    insert("test()\n")
    insert("nothing\n")
    insert("end\n")

macro edit: insert("@edit ")
macro fusion: insert("@. ")
macro assert: insert("@assert ") 
macro history: insert("@history ") 
macro breakpoint: insert("@bp ") 
macro code warn type: insert("@code_warntype ")
macro elapsed: insert("@elapsed ")
macro in bounds: insert("@inbounds ")
macro show: insert("@show ")
macro spawn: insert("@spawn ")
macro threads: insert("@threads ")
macro sync: insert("@sync ")
macro test: insert("@test ")
macro time: insert("@time ") 
macro view: insert("@view ")
macro which: insert("@which ")
macro debug: 
    insert("@debug \"\"")
    key(left)
macro info: 
    insert("@info \"\"")
    key(left)
macro warn: 
    insert("@warn \"\"")
    key(left)
macro error: 
    insert("@error \"\"")
    key(left)
# Infiltrator
macro infiltrate: insert("@infiltrate ")
macro exit: insert("@exit ")
macro trace: insert("@trace ")
macro locals: insert("@locals ")
macro continue: insert("@continue ")

# Start REPL
start repl: user.vscode("Julia: Start REPL")

flip comment:
    key(ctrl-/)
tail comment:
    key(end)
    insert(" # ")

# Add missing operators Petr Krysl 2024
op pair: insert(" => ")
op stab: insert(" -> ")
op in: insert(" in ")

# Command to convert content in round brackets (parentheses) to content in square brackets.
round to square:
    key(ctrl-x)
    sleep(1000ms)
    key(delete)
    sleep(1000ms)
    key(backspace)
    sleep(1000ms)
    key("[")
    sleep(1000ms)
    key(ctrl-v)
    sleep(1000ms)
    key("]")

# Accommodate the nonsense with special copy and paste commands in the terminal Petr Krysl 2024
(repl|terminal) copy: key(ctrl-shift-c)
(repl|terminal) paste: key(ctrl-shift-v)

# Petr Krysl 2024
to folder:
    key(shift-alt-c)
    user.vscode("Terminal: Focus Next Terminal in Terminal Group")
    sleep(1000ms)
    insert("cd(dirname(raw\"\"))")
    key(left:3)
    key(ctrl-shift-v)
    key(end)


# Petr Krysl 2024

# Running 
eval: key(ctrl-enter)
eval move: key(shift-enter)

run file: 
    key(ctrl-s)
    sleep(1000ms)
    key(ctrl-alt-e)
    #user.vscode("Terminal: Focus Terminal")
    key(ctrl-`)
    sleep(1000ms)
    insert("include(basename(raw\"")
    key(shift-ctrl-v)
    insert("\"))")
    key(end)
run [with path]:
    key(ctrl-s)
    sleep(1000ms)
    key(shift-alt-c)
    #user.vscode("Terminal: Focus Terminal")
    key(ctrl-`)
    sleep(1000ms)
    insert("include(raw\"")
    key(shift-ctrl-v)
    insert("\")")
    key(end)