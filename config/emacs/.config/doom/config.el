;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Ivan Kryvoruchko"
      user-mail-address "gsnewmark@pm.me")

;; UI

(setq doom-theme 'doom-nord)

(setq doom-font (font-spec :family "Iosevka" :size 12.0)
      doom-variable-pitch-font (font-spec :family "Source Sans Pro")
      ;; TODO switch to Noto Color Emoji when Emacs gets ability to show it
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
(setq org-roam-directory (concat org-directory "/notes"))
(setq deft-directory org-roam-directory)

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
  (set-popup-rule! "^\\*cider-repl" :side 'right :size 0.33 :quit nil)

  ;; workaround for a somewhat broken completions navigation when using Cider
  ;; https://github.com/hlissner/doom-emacs/issues/1335
  (add-hook 'company-completion-started-hook 'ans/set-company-maps)
  (add-hook 'company-completion-finished-hook 'ans/unset-company-maps)
  (add-hook 'company-completion-cancelled-hook 'ans/unset-company-maps)

  (defun ans/unset-company-maps (&rest unused)
    (general-def
      :states 'insert
      :keymaps 'override
      "<up>" nil
      "<down>" nil
      "C-j" nil
      "C-k" nil
      "RET" nil
      [return] nil))

  (defun ans/set-company-maps (&rest unused)
    (general-def
      :states 'insert
      :keymaps 'override
      "<down>" 'company-select-next
      "<up>" 'company-select-previous
      "C-j" 'company-select-next
      "C-k" 'company-select-previous
      "RET" 'company-complete
      [return] 'company-complete)))

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
