(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook
          (lambda ()
            (auto-fill-mode)))

;; key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t)
(setq org-startup-indented t)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")

;; org-mode agenda
(setq org-agenda-files
      (list (concat org-directory "/USIC.org")
            (concat org-directory "/projects.org")
            (concat org-directory "/university.org")
            (concat org-directory "/todos.org")))

;; org-capture default file
(setq org-default-notes-file (concat org-directory "/captured.org"))

;; org-capture templates
(setq org-capture-templates
      '(
        ("t" "Todo" entry
         (file (concat org-directory "/todos.org"))
         "* TODO %^{Description}\n  Added: %U\n  File: %a\n  %?")
        ("n" "Note" entry
         (file+datetree org-default-notes-file)
         "* %^{Description}\n  Added: %U\n  File: %a\n  %?")
        ("j" "Journal" entry
         (file+datetree (concat org-directory "/journal.org"))
         "* %^{Description}\n  Added: %U\n  File: %a\n  %?")))
