;; Enable autocomplete
(dolist (mode '(prog-mode groovy-mode))
  (add-to-list 'ac-modes mode))

;; Enable auto-fill
(add-hook 'prog-mode-hook
          (lambda ()
            (auto-fill-mode)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (auto-fill-mode)))

;; Enable auto-indent
(electric-indent-mode +1)
