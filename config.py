"""
Configuration example for ``ptpython``.
Copy this file to ~/.ptpython/config.py
"""
from __future__ import unicode_literals
from prompt_toolkit.keys import Keys
from pygments.token import Keyword, Name, Comment, String, Error, Text, \
          Number, Operator, Generic, Whitespace, Punctuation, Other, Literal
from ptpython.layout import CompletionVisualisation

__all__ = (
    'configure',
)


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.
    :param repl: `PythonRepl` instance.
    """
    # Show function signature (bool).
    repl.show_signature = True

    # Show docstring (bool).
    repl.show_docstring = False

    # Show the "[Meta+Enter] Execute" message when pressing [Enter] only
    # inserts a newline instead of executing the code.
    repl.show_meta_enter_message = True

    # Show completions. (NONE, POP_UP, MULTI_COLUMN or TOOLBAR)
    repl.completion_visualisation = CompletionVisualisation.POP_UP

    # When CompletionVisualisation.POP_UP has been chosen, use this
    # scroll_offset in the completion menu.
    repl.completion_menu_scroll_offset = 0

    # Show line numbers (when the input contains multiple lines.)
    repl.show_line_numbers = True

    # Show status bar.
    repl.show_status_bar = True

    # When the sidebar is visible, also show the help text.
    repl.show_sidebar_help = True

    # Highlight matching parethesis.
    repl.highlight_matching_parenthesis = True

    # Line wrapping. (Instead of horizontal scrolling.)
    repl.wrap_lines = True

    # Mouse support.
    repl.enable_mouse_support = True

    # Complete while typing. (Don't require tab before the
    # completion menu is shown.)
    repl.complete_while_typing = True

    # Vi mode.
    repl.vi_mode = False

    # Paste mode. (When True, don't insert whitespace after new line.)
    repl.paste_mode = False

    # Use the classic prompt. (Display '>>>' instead of 'In [1]'.)
    repl.prompt_style = 'classic'  # 'classic' or 'ipython'

    # History Search.
    # When True, going back in history will filter the history on the records
    # starting with the current input. (Like readline.)
    # Note: When enable, please disable the `complete_while_typing` option.
    #       otherwise, when there is a completion available, the arrows will
    #       browse through the available completions instead of the history.
    repl.enable_history_search = False

    # Enable auto suggestions. (Pressing right arrow will complete the input,
    # based on the history.)
    repl.enable_auto_suggest = False

    # Enable open-in-editor. Pressing C-X C-E in emacs mode or 'v' in
    # Vi navigation mode will open the input in the current editor.
    repl.enable_open_in_editor = True

    # Enable system prompt. Pressing meta-! will display the system prompt.
    # Also enables Control-Z suspend.
    repl.enable_system_bindings = True

    # Ask for confirmation on exit.
    repl.confirm_exit = True

    # Enable input validation. (Don't try to execute when the input contains
    # syntax errors.)
    repl.enable_input_validation = True

    # Install custom colorscheme named 'my-colorscheme' and use it.
    repl.install_ui_colorscheme('my-colorscheme', _custom_ui_colorscheme)
    repl.use_ui_colorscheme('my-colorscheme')

    # Add custom key binding for PDB.
    @repl.add_key_binding(Keys.ControlB)
    def _(event):
        ' Pressing Control-B will insert "pdb.set_trace()" '
        event.cli.current_buffer.insert_text('\nimport pdb; pdb.set_trace()\n')

    # Typing ControlE twice should also execute the current command.
    # (Alternative for Meta-Enter.)
    @repl.add_key_binding(Keys.ControlE, Keys.ControlE)
    def _(event):
        b = event.current_buffer
        if b.accept_action.is_returnable:
            b.accept_action.validate_and_handle(event.cli, b)

    """
    # Custom key binding for some simple autocorrection while typing.
    corrections = {
        'impotr': 'import',
        'pritn': 'print',
    }
    @repl.add_key_binding(' ')
    def _(event):
        ' When a space is pressed. Check & correct word before cursor. '
        b = event.cli.current_buffer
        w = b.document.get_word_before_cursor()
        if w is not None:
            if w in corrections:
                b.delete_before_cursor(count=len(w))
                b.insert_text(corrections[w])
        b.insert_text(' ')
    """

BACKGROUND = "#272822"
CURRENT_LINE = "#383830"
SELECTION = "#49483e"
FOREGROUND = "#f9f8f5"
COMMENT = "#75715e"
RED = "#f92672"
ORANGE = "#fd971f"
YELLOW = "#f4bf75"
GREEN = "#a6e22e"
AQUA = "#a1efe4"
BLUE = "#66d9ef"
PURPLE = "#ae81ff"

_custom_ui_colorscheme = {
    # No corresponding class for the following:
    Text:                      FOREGROUND,  # class:  ''
    Whitespace:                "",          # class: 'w'
    Error:                     RED,         # class: 'err'
    Other:                     "",          # class 'x'

    Comment:                   COMMENT,   # class: 'c'
    Comment.Multiline:         "",        # class: 'cm'
    Comment.Preproc:           "",        # class: 'cp'
    Comment.Single:            "",        # class: 'c1'
    Comment.Special:           "",        # class: 'cs'

    Keyword:                   PURPLE,    # class: 'k'
    Keyword.Constant:          "",        # class: 'kc'
    Keyword.Declaration:       "",        # class: 'kd'
    Keyword.Namespace:         AQUA,      # class: 'kn'
    Keyword.Pseudo:            "",        # class: 'kp'
    Keyword.Reserved:          "",        # class: 'kr'
    Keyword.Type:              YELLOW,    # class: 'kt'

    Operator:                  AQUA,      # class: 'o'
    Operator.Word:             "",        # class: 'ow' - like keywords

    Punctuation:               FOREGROUND,  # class: 'p'

    Name:                      FOREGROUND,  # class: 'n'
    Name.Attribute:            BLUE,        # class: 'na' - to be revised
    Name.Builtin:              "",          # class: 'nb'
    Name.Builtin.Pseudo:       "",          # class: 'bp'
    Name.Class:                YELLOW,      # class: 'nc' - to be revised
    Name.Constant:             RED,         # class: 'no' - to be revised
    Name.Decorator:            AQUA,        # class: 'nd' - to be revised
    Name.Entity:               "",          # class: 'ni'
    Name.Exception:            RED,         # class: 'ne'
    Name.Function:             BLUE,        # class: 'nf'
    Name.Property:             "",          # class: 'py'
    Name.Label:                "",          # class: 'nl'
    Name.Namespace:            YELLOW,      # class: 'nn' - to be revised
    Name.Other:                BLUE,        # class: 'nx'
    Name.Tag:                  AQUA,        # class: 'nt' - like a keyword
    Name.Variable:             RED,         # class: 'nv' - to be revised
    Name.Variable.Class:       "",          # class: 'vc' - to be revised
    Name.Variable.Global:      "",          # class: 'vg' - to be revised
    Name.Variable.Instance:    "",          # class: 'vi' - to be revised

    Number:                    ORANGE,    # class: 'm'
    Number.Float:              "",        # class: 'mf'
    Number.Hex:                "",        # class: 'mh'
    Number.Integer:            "",        # class: 'mi'
    Number.Integer.Long:       "",        # class: 'il'
    Number.Oct:                "",        # class: 'mo'

    Literal:                   ORANGE,    # class: 'l'
    Literal.Date:              GREEN,     # class: 'ld'

    String:                    GREEN,       # class: 's'
    String.Backtick:           "",          # class: 'sb'
    String.Char:               FOREGROUND,  # class: 'sc'
    String.Doc:                COMMENT,     # class: 'sd' - like a comment
    String.Double:             "",          # class: 's2'
    String.Escape:             ORANGE,      # class: 'se'
    String.Heredoc:            "",          # class: 'sh'
    String.Interpol:           ORANGE,      # class: 'si'
    String.Other:              "",          # class: 'sx'
    String.Regex:              "",          # class: 'sr'
    String.Single:             "",          # class: 's1'
    String.Symbol:             "",          # class: 'ss'

    Generic:                   "",                    # class: 'g'
    Generic.Deleted:           RED,                   # class: 'gd',
    Generic.Emph:              "italic",              # class: 'ge'
    Generic.Error:             "",                    # class: 'gr'
    Generic.Heading:           "bold " + FOREGROUND,  # class: 'gh'
    Generic.Inserted:          GREEN,                 # class: 'gi'
    Generic.Output:            "",                    # class: 'go'
    Generic.Prompt:            "bold " + COMMENT,     # class: 'gp'
    Generic.Strong:            "bold",                # class: 'gs'
    Generic.Subheading:        "bold " + AQUA,        # class: 'gu'
    Generic.Traceback:         "",                    # class: 'gt'
}
