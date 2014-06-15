(live-add-pack-lib "smart-mode-line")

(require 'smart-mode-line)

(setq sml/theme nil)
(sml/setup)

(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/name-width 35)
(setq sml/mode-width 'full)

(add-to-list 'sml/hidden-modes " AC")
(add-to-list 'sml/hidden-modes " WS")
(add-to-list 'sml/hidden-modes " Undo-Tree")
(add-to-list 'sml/hidden-modes " VHl")
(add-to-list 'sml/hidden-modes " SliNav")
(add-to-list 'sml/hidden-modes " Fill")
(add-to-list 'sml/hidden-modes " yas")
(add-to-list 'sml/hidden-modes " cljr")
(add-to-list 'sml/hidden-modes " G-+")
