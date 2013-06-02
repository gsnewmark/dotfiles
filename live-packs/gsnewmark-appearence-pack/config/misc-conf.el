;; highlight current line (unless terminal mode)
(if (display-graphic-p)
    (global-hl-line-mode))

;; Set font
(add-to-list 'default-frame-alist '(font . "Inconsolata LGC-10"))
