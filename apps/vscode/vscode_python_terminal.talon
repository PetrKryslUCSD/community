app: vscode
# Looks for special string in window title.
# NOTE: This requires you to add a special setting to your VSCode settings.json
# See [our vscode docs](./README.md#terminal)
win.title: /focus:Terminal/
code.language: python
-
# Python terminal
tag(): terminal

py run: insert("py ")
py test: insert("py test.py")