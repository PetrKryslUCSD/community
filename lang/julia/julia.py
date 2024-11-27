from talon import Module, Context, actions, ui, imgui, settings

mod = Module()

ctx = Context()

ctx.matches = r"""
code.language: julia
"""

ctx.tags = [
"user.code_imperative",
"user.code_comment_line",
"user.code_comment_block_c_like",
"user.code_comment_documentation",
"user.code_data_bool",
"user.code_functions",
"user.code_functions_gui",
"user.code_libraries",
"user.code_libraries_gui",
"user.code_operators_array",
"user.code_operators_assignment",
"user.code_operators_bitwise",
"user.code_operators_math",
]

ctx.lists['user.code_libraries'] = {
    'linear algebra': 'LinearAlgebra',
    'fine tools': 'FinEtools',
    'are pack': 'Arpack',
    'revise': 'Revise',
}

ctx.lists['user.code_functions'] = {
    "abs": "abs",
    "axes": "axes",
    "all run": "allrun",
    "broadcast": "broadcast",
    "change folder": "cd",
    "collect": "collect",
    "conn as array": "connasarray",
    "conjugate": "conj",
    "copy to": "copyto!",
    "correlation": "cor",
    "cosine": "cos",
    "count": "count",
    "covariance": "cov",
    "deep copy": "deepcopy",
    "det": "det",
    "dict": "Dict",
    "diff": "diff",
    "difference": "diff",
    "display": "display",
    "dot": "dot",
    "each index": "eachindex",
    "eigen": "eigen",
    "ell type": "eltype",
    "enumerate": "enumerate",
    "figure": "figure",
    "fill in place": "fill!",
    "fill": "fill",
    "find all": "findall",
    "for each": "foreach",
    "get": "get",
    "has key": "haskey",
    "hoe cat": "hcat",
    "imag": "imag",
    "include": "include",
    "is a prox": "isapprox",
    "isempty": "is empty",
    "join path": "joinpath",
    "last index": "lastindex",
    "first index": "firstindex",
    "len": "length",
    "length": "length",
    "log": "log",
    "max": "max",
    "maximum": "maximum",
    "mean": "mean",
    "min": "min",
    "minimum": "minimum",
    "norm": "norm",
    "one": "one",
    "open": "open",
    "fun": "phun",
    "pairs": "pairs",
    "parse": "parse",
    "plot": "plot",
    "print": "print",
    "print line": "println",
    "push": "push!",
    "rand": "rand",
    "random": "rand",
    "lynn space": "range",
    "range": "range",
    "round": "round",
    "real": "real",
    "reshape": "reshape",
    "scatter": "scatter",
    "similar": "similar",
    "sine": "sin",
    "size": "size",
    "sort": "sort",
    "squirt": "sqrt",
    "square root": "sqrt",
    "squeeze": "squeeze",
    "sub set": "subset",
    "subset": "subset",
    "sum": "sum",
    "summary": "summary",
    "time": "time",
    "time nano": "time_ns",
    "trace": "tr",
    "transpose": "transpose",
    "type of": "typeof",
    "unique": "unique",
    "vee cat": "vcat",
    "vec": "vec",
    "vector": "vec",
    "view": "view",
    "zero": "zero",
    "zeros": "zeros",
    "zip": "zip",
}

ctx.lists['user.code_type'] = {
    'float sixty four': 'Float64',
    'int sixty four': 'i64',
    'boolean': 'Bool',
    'string': 'string',
}

@ctx.action_class('user')
class UserActions:
    def code_operator_lambda():
        actions.insert('() -> ')
        actions.edit.left()
        actions.edit.left()

    def code_operator_subscript():
        actions.insert('[]')
        actions.edit.left()

    def code_operator_increment():
        actions.insert(' += 1')

    def code_operator_assignment():
        actions.insert(' = ')

    def code_operator_subtraction():
        actions.insert(' - ')

    def code_operator_subtraction_assignment():
        actions.insert(' -= ')

    def code_operator_addition():
        actions.insert(' + ')

    def code_operator_addition_assignment():
        actions.insert(' += ')

    def code_operator_multiplication():
        actions.insert(' * ')

    def code_operator_multiplication_assignment():
        actions.insert(' *= ')

    def code_operator_exponent():
        actions.insert('.pow()');
        actions.edit.left();

    def code_operator_division():
        actions.insert(' / ')

    def code_operator_division_assignment():
        actions.insert(' /= ')

    def code_operator_modulo():
        actions.insert(' % ')

    def code_operator_modulo_assignment():
        actions.insert(' %= ')

    def code_operator_equal():
        actions.insert(' == ')

    def code_operator_not_equal():
        actions.insert(' != ')

    def code_operator_greater_than():
        actions.insert(' > ')

    def code_operator_greater_than_or_equal_to():
        actions.insert(' >= ')

    def code_operator_less_than():
        actions.insert(' < ')

    def code_operator_less_than_or_equal_to():
        actions.insert(' <= ')

    def code_operator_and():
        actions.insert(' && ')

    def code_operator_or():
        actions.insert(' || ')

    def code_operator_bitwise_and():
        actions.insert(' & ')

    def code_operator_bitwise_or():
        actions.insert(' | ')

    def code_operator_bitwise_exclusive_or():
        actions.insert(' ^ ')

    def code_operator_bitwise_left_shift():
        actions.insert(' << ')

    def code_operator_bitwise_left_shift_assignment():
        actions.insert(' <<= ')

    def code_operator_bitwise_right_shift():
        actions.insert(' >> ')

    def code_operator_bitwise_right_shift_assignment():
        actions.insert(' >>= ')

    def code_operator_object_accessor():
        actions.insert('.')

    def code_state_switch():
        actions.insert('match ')

    def code_block():
        actions.insert('{\n\n}')
        actions.edit.left()
        actions.edit.up()
        actions.key('tab')

    def code_import():
        actions.insert('import ')

    def code_comment_line_prefix():
        actions.insert('#')

    def code_comment_documentation():
        actions.insert('""" ')

    def code_insert_true():
        actions.insert('true')

    def code_insert_false():
        actions.insert('false')

    def code_state_if():
        actions.insert('if ')

    def code_state_else():
        actions.insert('else ')

    def code_state_else_if():
        actions.insert('else if ')

    def code_state_return():
        actions.insert('return ')

    def code_insert_function(text: str, selection: str):
        actions.user.paste(f'{text}({selection or ""})')
        actions.edit.left()

    def code_private_function(text: str):
        actions.insert('')
        formatter = settings.get('user.code_private_function_formatter')
        function_name = actions.user.formatted_text(text, formatter)
        actions.user.code_insert_function(function_name, None)

    def code_public_function(text: str):
        actions.insert('s')
        formatter = settings.get('user.code_public_function_formatter')
        function_name = actions.user.formatted_text(text, formatter)
        actions.user.code_insert_function(function_name, None)

    def code_default_function(text: str):
        actions.user.code_private_function(text)

    def code_insert_type_annotation(type: str):
        actions.insert(f'::{type}')

    def code_insert_return_type(type: str):
        actions.insert(f' -> {type}')

    def code_state_for():
        actions.insert('for ')

    def code_state_while():
        actions.insert('while ')

    def code_state_return():
        actions.insert('return ')
