code.language: python
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_comment_documentation
tag(): user.code_comment_line
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_common
tag(): user.code_keywords
tag(): user.code_libraries
tag(): user.code_libraries_gui
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_lambda
tag(): user.code_operators_math

settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

#python-specific grammars
dunder in it: "__init__"
state (def | deaf | deft): "def "
state try: "try:\n"
state except: "except "
state raise: "raise "
self taught: "self."
pie test: "pytest"
state pass: "pass"

[state] raise {user.python_exception}:
    user.insert_between("raise {python_exception}(", ")")
[state] except {user.python_exception}: "except {python_exception}:"

dock string: user.code_comment_documentation()
dock {user.python_docstring_fields}:
    insert("{python_docstring_fields}")
    edit.left()
dock type {user.code_type}: user.insert_between(":type ", ": {code_type}")
dock returns type {user.code_type}: user.insert_between(":rtype ", ": {code_type}")

toggle imports: user.code_toggle_libraries()
import <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)

from import: user.insert_between("from ", " import ")

# Petr Krysl 2025
completion: key(ctrl-space)
flip comment:
    key(ctrl-/)

assign: insert(" = ")

numpy | num pie: insert("numpy")

insert parameters:
    insert("Parameters")
    key(enter)
    insert("----------")
    
insert returns:
    insert("Returns")
    key(enter)
    insert("-------")

insert see also:
    insert("See Also")
    key(enter)
    insert("--------")

rest math: insert(":math:")
rest function: insert(":func:")
rest math paragraph: insert(".. math::")