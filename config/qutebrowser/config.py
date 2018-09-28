c.auto_save.session = True

c.confirm_quit = ['downloads',]

c.completion.shrink = True

c.content.cache.size = 52428800
c.content.default_encoding = 'utf-8'
c.content.plugins = True

c.downloads.position = 'bottom'

c.editor.command = ['emacsclient "{}"',]

c.hints.scatter = False

c.input.partial_timeout = 10000

c.tabs.background = True
c.tabs.select_on_remove = 'prev'

c.url.searchengines['go'] = 'https://www.google.com.ua/search?q={}'
c.url.searchengines['trans'] = 'https://translate.google.com/#auto/en/{}'
c.url.searchengines['so'] = 'https://stackoverflow.com/search?q={}'
c.url.searchengines['gh'] = 'https://github.com/search?q={}&type=Everything'

# Colors

solarized_base03 = '#002b36'
solarized_base02 = '#073642'
solarized_base01 = '#586e75'
solarized_base1 = '#93a1a1'
solarized_base2 = '#eee8d5'
solarized_base3 = '#fdf6e3'
solarized_yellow = '#b58900'
solarized_orange = '#cb4b16'
solarized_red = '#dc322f'
solarized_magenta = '#d33682'
solarized_blue = '#268bd2'
solarized_cyan = '#2aa198'
solarized_green = '#859900'

c.colors.completion.fg = solarized_base1
c.colors.completion.even.bg = solarized_base02
c.colors.completion.odd.bg = solarized_base02
c.colors.completion.category.fg = solarized_base1
c.colors.completion.category.bg = solarized_base03
c.colors.completion.category.border.top = solarized_base03
c.colors.completion.category.border.bottom = solarized_base03
c.colors.completion.item.selected.fg = solarized_base3
c.colors.completion.item.selected.bg = solarized_blue
c.colors.completion.item.selected.border.top = solarized_base03
c.colors.completion.item.selected.border.bottom = solarized_base03
c.colors.completion.match.fg = solarized_base3
c.colors.completion.scrollbar.fg = solarized_base02
c.colors.completion.scrollbar.bg = solarized_base03
c.colors.statusbar.command.bg = solarized_base02
c.colors.statusbar.command.fg = solarized_base3
c.colors.statusbar.passthrough.bg = solarized_base02
c.colors.statusbar.passthrough.fg = solarized_cyan
c.colors.statusbar.normal.fg = solarized_base1
c.colors.statusbar.normal.bg = solarized_base02
c.colors.statusbar.insert.bg = solarized_green
c.colors.statusbar.insert.fg = solarized_base3
c.colors.statusbar.caret.bg = solarized_magenta
c.colors.statusbar.caret.selection.bg = solarized_base3
c.colors.statusbar.caret.fg = solarized_base3
c.colors.statusbar.caret.selection.fg = solarized_base3
c.colors.statusbar.progress.bg = solarized_base03
c.colors.statusbar.url.success.http.fg = solarized_green
c.colors.statusbar.url.success.https.fg = solarized_green
c.colors.statusbar.url.error.fg = solarized_orange
c.colors.statusbar.url.warn.fg = solarized_yellow
c.colors.statusbar.url.hover.fg = solarized_cyan
c.colors.tabs.odd.fg = solarized_base1
c.colors.tabs.odd.bg = solarized_base03
c.colors.tabs.even.fg = solarized_base1
c.colors.tabs.even.bg = solarized_base03
c.colors.tabs.selected.odd.fg = solarized_base3
c.colors.tabs.selected.odd.bg = solarized_blue
c.colors.tabs.selected.even.fg = solarized_base3
c.colors.tabs.selected.even.bg = solarized_blue
c.colors.downloads.bar.bg = solarized_base02
c.colors.downloads.start.fg = solarized_base01
c.colors.downloads.start.bg = solarized_cyan
c.colors.downloads.stop.bg = solarized_green
c.colors.downloads.error.fg = solarized_base01
c.colors.downloads.error.bg = solarized_red
c.colors.webpage.bg = solarized_base2
c.colors.messages.error.fg = solarized_base1
c.colors.messages.error.bg = solarized_red
c.colors.messages.warning.fg = solarized_base1
c.colors.messages.warning.bg = solarized_orange
c.colors.messages.info.fg = solarized_base1
c.colors.messages.info.bg = solarized_base02
c.colors.prompts.fg = solarized_base1
c.colors.prompts.bg = solarized_base02

# Fonts

c.fonts.monospace = '"Iosevka Term", "M+ 1mn", Menlo, Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Liberation Mono", "Courier New", Courier, monospace, Fixed, Consolas, Terminal'
c.fonts.completion.category = 'bold 11pt monospace'
c.fonts.completion.entry = '11pt monospace'
c.fonts.tabs = '11pt monospace'
c.fonts.statusbar = '11pt monospace'
c.fonts.downloads = '11pt monospace'
c.fonts.hints = 'bold 11pt monospace'
c.fonts.debug_console = '11pt monospace'
