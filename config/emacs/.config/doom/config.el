;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Ivan Kryvoruchko"
      user-mail-address "gsnewmark@pm.me")

;; UI

(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 13.0))

(setq which-key-idle-delay 0.4)

(setq display-line-numbers-type nil)

(setq ediff-split-window-function 'split-window-horizontally)

;; Clojure

(after! cider
  (add-hook 'cider-mode-hook 'subword-mode)
  (setq clojure-align-forms-automatically t
        cider-repl-result-prefix "")
  (set-popup-rule! "^\\*cider-repl" :side 'right :size 0.33 :quit nil))

(defun gsnewmark/clojure-reset-reloaded-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (cider-interactive-eval
     "(reset)")))

;; Misc.

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)

;; Bindings

(map!
 ;; Easier window movement (from https://github.com/hlissner/doom-emacs-private)
 (:map general-override-mode-map
   :n "C-h" 'evil-window-left
   :n "C-j" 'evil-window-down
   :n "C-k" 'evil-window-up
   :n "C-l" 'evil-window-right)

 (:map evil-treemacs-state-map
   "C-h" 'evil-window-left
   "C-l" 'evil-window-right)

 (:map org-agenda-mode-map
   "C-h" 'evil-window-left
   "C-l" 'evil-window-right))

(map! :after clojure-mode
      :map cider-mode-map
      :localleader
      :prefix "r" "x" #'gsnewmark/clojure-reset-reloaded-repl)

(map! :after cider-mode
      :map cider-repl-mode-map
      :localleader
      "x" #'gsnewmark/clojure-reset-reloaded-repl)

(map! :after smartparens
      :map smartparens-mode-map
      :leader
      :prefix ("k" . "smartparens")
      "s" #'sp-forward-slurp-sexp
      "b" #'sp-forward-barf-sexp
      "S" #'sp-backward-slurp-sexp
      "B" #'sp-backward-barf-sexp)
