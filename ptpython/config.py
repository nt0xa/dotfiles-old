"""
Configuration example for ``ptpython``.

Copy this file to ~/.ptpython/config.py
"""
from __future__ import unicode_literals
from prompt_toolkit.keys import Keys
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.vi_state import InputMode
from prompt_toolkit.key_binding.input_processor import KeyPress
from pygments.token import Token, Comment, Generic, Number, Keyword, Name, Operator, String
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
    repl.show_meta_enter_message = False

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
    repl.vi_mode = True

    # Paste mode. (When True, don't insert whitespace after new line.)
    repl.paste_mode = False

    # Use the classic prompt. (Display '>>>' instead of 'In [1]'.)
    repl.prompt_style = 'classic'  # 'classic' or 'ipython'

    # Don't insert a blank line after the output.
    repl.insert_blank_line_after_output = False

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
    repl.confirm_exit = False

    # Enable input validation. (Don't try to execute when the input contains
    # syntax errors.)
    repl.enable_input_validation = True

    # Enable 24bit True color. (Not all terminals support this. -- maybe check
    # $TERM before changing.)
    repl.true_color = True

    # Install custom colorscheme named 'my-colorscheme' and use it.
    repl.install_ui_colorscheme('my-colorscheme', _custom_ui_colorscheme)
    repl.use_ui_colorscheme('my-colorscheme')

    # Emacs key bindings
    @repl.add_key_binding(Keys.ControlA, filter=ViInsertMode())
    def _(event):
        """
        Start of line.
        """
        buffer = event.current_buffer
        buffer.cursor_position += buffer.document.get_start_of_line_position(after_whitespace=False)

    @repl.add_key_binding(Keys.ControlB, filter=ViInsertMode())
    def _(event):
        """
        Character back.
        """
        buffer = event.current_buffer
        buffer.cursor_position += buffer.document.get_cursor_left_position(count=event.arg)

    @repl.add_key_binding(Keys.ControlE, filter=ViInsertMode())
    def _(event):
        """
        End of line.
        """
        buffer = event.current_buffer
        buffer.cursor_position += buffer.document.get_end_of_line_position()

    @repl.add_key_binding(Keys.ControlF, filter=ViInsertMode())
    def _(event):
        """
        Character forward.
        """
        buffer = event.current_buffer
        buffer.cursor_position += buffer.document.get_cursor_right_position(count=event.arg)

    @repl.add_key_binding(Keys.ControlN, filter=ViInsertMode())
    def _(event):
        """
        Character forward.
        """
        event.cli.input_processor.feed(KeyPress(Keys.Down))

    @repl.add_key_binding(Keys.ControlP, filter=ViInsertMode())
    def _(event):
        """
        Character forward.
        """
        event.cli.input_processor.feed(KeyPress(Keys.Up))

    @repl.add_key_binding('j', 'k', filter=ViInsertMode())
    def _(event):
        """
        Exit insert mode.
        """
        event.cli.vi_state.reset(InputMode.NAVIGATION)

    @repl.add_key_binding(Keys.ControlSpace, filter=ViInsertMode())
    def _(event):
        """
        Execute.
        """
        b = event.current_buffer
        if b.accept_action.is_returnable:
            b.accept_action.validate_and_handle(event.cli, b)

class Colors:
    dark0_hard     = '#1D2021'
    dark0          = '#282828'
    dark0_soft     = '#32302F'
    dark1          = '#3c3836'
    dark2          = '#504945'
    dark3          = '#665C54'
    dark4          = '#7C6F64'
    gray_245       = '#928374'
    gray_244       = '#928374'
    light0_hard    = '#F9F5D7'
    light0         = '#FBF1C7'
    light0_soft    = '#F2E5BC'
    light1         = '#EBDBB2'
    light2         = '#D5C4A1'
    light3         = '#BDAE93'
    light4         = '#A89984'
    bright_red     = '#FB4934'
    bright_green   = '#B8BB26'
    bright_yellow  = '#FABD2F'
    bright_blue    = '#83A598'
    bright_purple  = '#D3869B'
    bright_aqua    = '#8EC07C'
    bright_orange  = '#FE8019'
    neutral_red    = '#CC241D'
    neutral_green  = '#98971A'
    neutral_yellow = '#D79921'
    neutral_blue   = '#458588'
    neutral_purple = '#B16286'
    neutral_aqua   = '#689D6A'
    neutral_orange = '#D65D0E'
    faded_red      = '#9D0006'
    faded_green    = '#79740E'
    faded_yellow   = '#B57614'
    faded_blue     = '#076678'
    faded_purple   = '#8F3F71'
    faded_aqua     = '#427B58'
    faded_orange   = '#AF3A03'

# Custom colorscheme for the UI. See `ptpython/layout.py` and
# `ptpython/style.py` for all possible tokens.
_custom_ui_colorscheme = {
    String:        Colors.neutral_green,
    String.Symbol: Colors.neutral_orange,

    Number:        Colors.neutral_purple,

    Operator.Word: Colors.neutral_red,

    Name.Namespace: Colors.light0_soft, # module name
    Name.Function: Colors.neutral_aqua,
    Name.Builtin:  Colors.neutral_orange,

    Keyword: Colors.neutral_red, # import
    Keyword.Namespace: Colors.neutral_blue, # from
}
