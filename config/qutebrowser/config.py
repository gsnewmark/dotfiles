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

nord_base03 = '#2E3440'
nord_base02 = '#3B4252'
nord_base01 = '#A3BE8C'
nord_base1 = '#8FBCBB'
nord_base2 = '#E5E9F0'
nord_base3 = '#ECEFF4'
nord_yellow = '#EBCB8B'
nord_orange = '#BF616A'
nord_red = '#BF616A'
nord_magenta = '#B48EAD'
nord_blue = '#81A1C1'
nord_cyan = '#88C0D0'
nord_green = '#A3BE8C'
nord_fade = '#4C566A'

c.colors.completion.fg = nord_base3
c.colors.completion.even.bg = nord_base03
c.colors.completion.odd.bg = nord_base03
c.colors.completion.category.fg = nord_base3
c.colors.completion.category.bg = nord_base03
c.colors.completion.category.border.top = nord_base03
c.colors.completion.category.border.bottom = nord_base03
c.colors.completion.item.selected.fg = nord_base3
c.colors.completion.item.selected.bg = nord_fade
c.colors.completion.item.selected.border.top = nord_base03
c.colors.completion.item.selected.border.bottom = nord_base03
c.colors.completion.match.fg = nord_cyan
c.colors.completion.scrollbar.fg = nord_base02
c.colors.completion.scrollbar.bg = nord_base03
c.colors.statusbar.command.bg = nord_base02
c.colors.statusbar.command.fg = nord_base3
c.colors.statusbar.passthrough.bg = nord_base02
c.colors.statusbar.passthrough.fg = nord_cyan
c.colors.statusbar.normal.fg = nord_base1
c.colors.statusbar.normal.bg = nord_base02
c.colors.statusbar.insert.bg = nord_green
c.colors.statusbar.insert.fg = nord_base3
c.colors.statusbar.caret.bg = nord_magenta
c.colors.statusbar.caret.selection.bg = nord_base3
c.colors.statusbar.caret.fg = nord_base3
c.colors.statusbar.caret.selection.fg = nord_base3
c.colors.statusbar.progress.bg = nord_base03
c.colors.statusbar.url.success.http.fg = nord_green
c.colors.statusbar.url.success.https.fg = nord_green
c.colors.statusbar.url.error.fg = nord_orange
c.colors.statusbar.url.warn.fg = nord_yellow
c.colors.statusbar.url.hover.fg = nord_cyan
c.colors.tabs.bar.bg = nord_base03
c.colors.tabs.odd.fg = nord_base3
c.colors.tabs.odd.bg = nord_base03
c.colors.tabs.even.fg = nord_base3
c.colors.tabs.even.bg = nord_base03
c.colors.tabs.selected.odd.fg = nord_base3
c.colors.tabs.selected.odd.bg = nord_fade
c.colors.tabs.selected.even.fg = nord_base3
c.colors.tabs.selected.even.bg = nord_fade
c.colors.downloads.bar.bg = nord_base02
c.colors.downloads.start.fg = nord_base3
c.colors.downloads.start.bg = nord_base02
c.colors.downloads.stop.fg = nord_base03
c.colors.downloads.stop.bg = nord_green
c.colors.downloads.error.fg = nord_base3
c.colors.downloads.error.bg = nord_red
c.colors.webpage.bg = nord_base2
c.colors.messages.error.fg = nord_base3
c.colors.messages.error.bg = nord_red
c.colors.messages.warning.fg = nord_base1
c.colors.messages.warning.bg = nord_orange
c.colors.messages.info.fg = nord_base1
c.colors.messages.info.bg = nord_base02
c.colors.prompts.fg = nord_base1
c.colors.prompts.bg = nord_base02

# Fonts

c.fonts.monospace = '"Iosevka Term Medium", "M+ 1mn", Menlo, Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Liberation Mono", "Courier New", Courier, monospace, Fixed, Consolas, Terminal'
c.fonts.completion.category = 'bold 12pt monospace'
c.fonts.completion.entry = '12pt monospace'
c.fonts.tabs = '12pt monospace'
c.fonts.statusbar = '12pt monospace'
c.fonts.downloads = '12pt monospace'
c.fonts.hints = 'bold 12pt monospace'
c.fonts.debug_console = '12pt monospace'
