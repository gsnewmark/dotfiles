;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; UI

(setq doom-theme 'doom-nord)

(setq doom-font (font-spec :family "Iosevka Term" :size 12.0)
      doom-variable-pitch-font (font-spec :family "Source Sans Pro")
      doom-unicode-font (font-spec :family "Source Sans Pro")
      doom-big-font (font-spec :family "Iosevka Term" :size 18.0))

(setq which-key-idle-delay 0.4)

(setq display-line-numbers-type nil)

(setq doom-modeline-major-mode-icon t)

(custom-set-faces
 '(ein:cell-input-area ((t (:background "#3B4252" :foreground "#ECEFF4")))))

;; VCS

(setq ediff-split-window-function 'split-window-horizontally)

;; Org Mode

(after! org
  (setq org-directory "~/Dropbox/org"
        org-todo-keywords '((sequence "TODO" "|" "DONE")
                            (sequence "BUG" "|" "FIXED")
                            (sequence "FEATURE" "|" "ADDED")
                            (sequence "READING" "|" "READ"))
        org-refile-targets '((nil :maxlevel . 5)
                             (org-agenda-files :maxlevel . 3))
        org-refile-use-outline-path 'file
        org-refile-allow-creating-parent-nodes 'confirm
        org-archive-location (concat org-directory "/archive.org::* From %s")
        org-agenda-files (list (concat org-directory "/gtd.org")
                               (concat org-directory "/reading-review.org"))
        org-default-notes-file (concat org-directory "/notes.org")
        org-capture-templates '(("t" "Todo" entry
                                 (file+headline (concat org-directory "/gtd.org") "Unsorted Tasks")
                                 "* TODO %^{Description}\n  Added: %U\n%?")
                                ("n" "Note" entry
                                 (file+headline org-default-notes-file "Quick notes")
                                 "* %^{Description}\n  Added: %U\n%?")
                                ("j" "Journal" entry
                                 (file+datetree (concat org-directory "/journal.org"))
                                 "* %^{Description}\n  Added: %U\n%?"))
        org-startup-indented nil
        org-imenu-depth 5
        org-log-done 'time
        org-tags-column -80)

  (add-hook! :append 'org-mode-hook (org-indent-mode -1)))

;; Clojure

(after! cider
  (add-hook 'cider-mode-hook 'subword-mode)
  (setq clojure-align-forms-automatically t
        cider-repl-result-prefix ""))

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
(remove-hook 'flyspell-mode-hook #'+flyspell|immediately)

(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode
            sql-mode
            clojure-mode
            cider-mode))

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

(map! :after ein
      :map ein:notebook-mode-map
      :localleader
      "," #'+ein-hydra/body)

(map! :after clojure-mode
      :map cider-mode-map
      :localleader
      :prefix "r" "x" #'gsnewmark/clojure-reset-reloaded-repl)

(map! :after cider-mode
      :map cider-repl-mode-map
      :localleader
      "x" #'gsnewmark/clojure-reset-reloaded-repl)

(map! :after python
      :map python-mode-map
      :localleader
      :prefix ("c" . "conda")
      :desc "List environments" "l" #'conda-env-list
      :desc "Activate environment" "a" #'conda-env-activate
      :desc "Deactivate environment" "d" #'conda-env-deactivate)

(after! lispy
  (define-key lispy-mode-map-lispy "[" 'lispy-brackets)
  (define-key lispy-mode-map-lispy "]" 'lispy-brackets)
  (define-key lispy-mode-map-lispy "}" 'lispy-braces)
  (define-key lispy-mode-map-lispy ")" 'lispy-parens))
