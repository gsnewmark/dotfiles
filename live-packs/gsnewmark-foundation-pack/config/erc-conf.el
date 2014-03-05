(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; Highlight nicks in ERC
(live-add-pack-lib "erc-hl-nicks")
(require 'erc-hl-nicks)
