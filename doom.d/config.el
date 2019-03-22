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

;; Make Magit status fill whole frame
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

(setq git-link-use-commit t)

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

(after! cider-mode
  (add-hook 'cider-mode-hook 'subword-mode))

(setq clojure-align-forms-automatically t)

(defun gsnewmark/clojure-reset-reloaded-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (cider-interactive-eval
     "(reset)")))

;; Rust

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook
          (lambda ()
            (setq-local flycheck-checker 'rust-clippy)
            (setq-local flycheck-check-syntax-automatically '(mode-enabled save))))

;; Go

(after! go-mode
  (setq gomft-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save))

;; Misc.

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")

(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(remove-hook 'flyspell-mode-hook #'+spellcheck|immediately)

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

(after! org
  (map! :map org-mode-map
        :localleader
        :desc "Archive Subtree" :m "a" #'org-archive-subtree))

(after! ein
  (map! :map ein:notebook-mode-map
        :localleader
        :map ein:notebook-mode-map "," #'+ein-hydra/body))

(after! clojure-mode
  (map! (:localleader
          (:map cider-mode-map
            (:prefix "r" "x" #'gsnewmark/clojure-reset-reloaded-repl)))))
