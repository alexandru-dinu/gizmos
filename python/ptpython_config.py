"""
Configuration script for ``ptpython``.

Reference: https://github.com/prompt-toolkit/ptpython/blob/master/examples/ptpython_config/config.py
"""

import sys

from ptpython.layout import CompletionVisualisation

__all__ = ["configure"]


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """

    repl.vi_mode = True
    repl.prompt_style = "ipython"
    repl.enable_mouse_support = False

    repl.complete_while_typing = False
    # complete while typing must be disabled
    repl.enable_history_search = True
    # right arrow will complete the input (history-based)
    repl.enable_auto_suggest = True

    repl.insert_blank_line_after_input = True
    repl.insert_blank_line_after_output = True

    repl.enable_open_in_editor = True

    repl.enable_syntax_highlighting = True
    repl.use_code_colorscheme("monokai")
    repl.highlight_matching_parenthesis = True
    repl.show_line_numbers = True

    # (NONE, POP_UP, MULTI_COLUMN or TOOLBAR)
    repl.completion_visualisation = CompletionVisualisation.MULTI_COLUMN

    repl.show_signature = True
    repl.show_docstring = False

    # Don't try to execute when the input contains syntax errors.
    repl.enable_input_validation = True


print(f"Python: {sys.executable}\n")
