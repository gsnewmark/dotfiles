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

c.aliases['pocket'] = 'jseval --quiet !function(){var e=function(t,n,r,o,a){var c,f,i=[1821164,3796156,2087206,9104461,3458541,2658722,3733737,5219248,4180149,5171216],d=(o=o||0,0),h=(n=n||[],r=r||0,{a:97,b:98,c:99,d:100,e:101,f:102,g:103,h:104,i:105,j:106,k:107,l:108,m:109,n:110,o:111,p:112,q:113,r:114,s:115,t:116,u:117,v:118,w:119,x:120,y:121,z:122,A:65,B:66,C:67,D:68,E:69,F:70,G:71,H:72,I:73,J:74,K:75,L:76,M:77,N:78,O:79,P:80,Q:81,R:82,S:83,T:84,U:85,V:86,W:87,X:88,Y:89,Z:90,0:48,1:49,2:50,3:51,4:52,5:53,6:54,7:55,8:56,9:57,"/":47,":":58,"?":63,"=":61,"-":45,_:95,"&":38,$:36,"!":33,".":46});(a=a||0)&&0!=a||(t=i[0]+t);for(var l=0;l<t.length;l++){var m=h[(c=t)[f=l]]?h[c[f]]:c.charCodeAt(f);1*!m&&(m=3);var p=m*(i[o]+m*i[d%i.length]);n[r]=(n[r]?n[r]+p:p)+a+d;var u=p%50;if(n[u]){var v=n[r];n[r]=n[u],n[u]=v}d+=p,r=50==r?0:r+1,o=o==i.length-1?0:o+1}if(282==a){var g="";for(l=0;l<n.length;l++)g+=String.fromCharCode(n[l]%25+97);return i=function(){},g+"160eea979c"}return e(d+"",n,r,o,a+1)},t=document,n=t.location.href,r=t.title,o=e(n),a=t.createElement("script");a.type="text/javascript",a.src="https://getpocket.com/b/r4.js?h="+o+"&u="+encodeURIComponent(n)+"&t="+encodeURIComponent(r),e=o=function(){},(t.getElementsByTagName("head")[0]||t.documentElement).appendChild(a)}();'

config.bind('zp', 'pocket')

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

c.fonts.monospace = '"Fantasque Sans Mono", "M+ 1mn", Menlo, Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Liberation Mono", "Courier New", Courier, monospace, Fixed, Consolas, Terminal'
c.fonts.completion.category = 'bold 10pt monospace'
c.fonts.completion.entry = '10pt monospace'
c.fonts.tabs = '10pt monospace'
c.fonts.statusbar = '10pt monospace'
c.fonts.downloads = '10pt monospace'
c.fonts.hints = 'bold 12px monospace'
c.fonts.debug_console = '10pt monospace'
