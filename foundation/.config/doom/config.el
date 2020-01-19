;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; UI

(setq doom-theme 'doom-nord)

(setq doom-font (font-spec :family "Iosevka" :size 12.0)
      doom-variable-pitch-font (font-spec :family "Source Sans Pro")
      doom-unicode-font (font-spec :family "Source Sans Pro")
      doom-big-font (font-spec :family "Iosevka" :size 18.0))

(setq which-key-idle-delay 0.4)

(setq display-line-numbers-type nil)

(setq doom-modeline-major-mode-icon t)

(custom-set-faces
 '(ein:cell-input-area ((t (:background "#2E3440" :foreground nil)))))

;; VCS

(setq ediff-split-window-function 'split-window-horizontally)

;; Org Mode

(setq org-directory "~/Dropbox/org")
(after! org
  (setq org-archive-location (concat org-directory "/archive/archive.org::* From %s")
        org-refile-allow-creating-parent-nodes 'confirm
        org-startup-indented nil
        org-imenu-depth 5
        org-log-done 'time
        org-adapt-indentation nil
        +org-enable-centralized-exports nil)

  (add-to-list 'org-todo-keywords '(sequence "READING" "|" "READ")))

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

;; Rust

(add-hook 'rust-mode-hook
          (lambda ()
            (setq-local flycheck-checker 'rust-clippy)
            (setq-local flycheck-check-syntax-automatically '(mode-enabled save))))

;; Go

(after! go-mode
  (setq gomft-command "goimports"))

;; Python

(custom-set-variables
 '(conda-anaconda-home "~/.conda"))

;; Misc.

(add-hook 'text-mode-hook 'flyspell-mode)

;; Bindings

(map!
 ;; Easier window movement (from https://github.com/hlissner/doom-emacs-private)
 :n "C-h" 'evil-window-left
 :n "C-j" 'evil-window-down
 :n "C-k" 'evil-window-up
 :n "C-l" 'evil-window-right

 (:map evil-treemacs-state-map
   "C-h" 'evil-window-left
   "C-l" 'evil-window-right)

 (:map org-agenda-mode-map
   "C-h" 'evil-window-left
   "C-l" 'evil-window-right))

(map! :after org
      :map org-mode-map
      :localleader
      :desc "Archive Subtree" "a" #'org-archive-subtree
      "i" #'org-time-stamp-inactive)

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
