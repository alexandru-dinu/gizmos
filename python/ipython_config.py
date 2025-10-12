try:
    from IPython.core import ultratb

    ultratb.VerboseTB._tb_highlight = "bg:ansired"
except Exception as e:
    print(f"Error patching bg color for tracebacks: {e}")

c = get_config()

c.InteractiveShell.colors = "Linux"
c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.highlight_matching_brackets = True
c.TerminalInteractiveShell.term_title = True
c.InteractiveShellApp.exec_lines = []
