;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-theme 'doom-nord)

(setq doom-font (font-spec :family "Iosevka Term Medium" :size 12.0)
      doom-variable-pitch-font (font-spec :family "Source Sans Pro")
      doom-unicode-font (font-spec :family "Source Sans Pro")
      doom-big-font (font-spec :family "Iosevka Term Medium" :size 18.0))

(setq which-key-idle-delay 0.4)

(setq display-line-numbers-type nil)

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

(setq ediff-split-window-function 'split-window-horizontally)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "qutebrowser")

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
                                 "* %^{Description}\n  Added: %U\n%?")))

  ;; TODO doesn't seem to work, file still opens indented
  (setq org-startup-indented nil)
  (remove-hook! org-mode #'(org-indent-mode)))

;; Make Magit status fill whole frame
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
