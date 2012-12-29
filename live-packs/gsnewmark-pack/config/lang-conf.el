;; ActionScript
(add-hook 'actionscript-mode-hook
          (lambda ()
            (rainbow-delimiters-mode)))
(add-to-list 'ac-modes 'actionscript-mode)

;; Python
(add-hook 'python-mode-hook
          (lambda ()
            (rainbow-delimiters-mode)))
(add-to-list 'ac-modes 'python-mode)

;; Markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (flyspell-mode)
            (auto-fill-mode)))
