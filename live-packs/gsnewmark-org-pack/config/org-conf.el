(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook
          (lambda ()
            (auto-fill-mode)))

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")

;; clocking time spent on tasks (to persist time between sessions)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-log-done t)

;; refile configuration
(setq org-refile-targets '((nil :maxlevel . 5)
                           (org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)
(setq org-refile-allow-creating-parent-nodes 'confirm)

;; archive configuration
(setq org-archive-location (concat org-directory "/archive.org::* From %s"))

;; Possible state sequences for TODOs
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")
        (sequence "BUG" "|" "FIXED")
        (sequence "FEATURE" "|" "ADDED")
        (sequence "READING" "|" "READ")
        (sequence "HW TODO" "|" "HW DONE")))

;; org-mode agenda
(setq org-agenda-files
      (list (concat org-directory "/gtd.org")
            (concat org-directory "/reading-review.org")))

;; org-capture default file
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; org-capture templates
(setq org-capture-templates
      '(
        ("t" "Todo" entry
         (file+headline (concat org-directory "/gtd.org") "Unsorted Tasks")
         "* TODO %^{Description}\n  Added: %U\n%?")
        ("n" "Note" entry
         (file+headline org-default-notes-file "Quick notes")
         "* %^{Description}\n  Added: %U\n%?")
        ("j" "Journal" entry
         (file+datetree (concat org-directory "/journal.org"))
         "* %^{Description}\n  Added: %U\n%?")))

;; List of additional LaTeX packages
(require 'org-latex)
(add-to-list 'org-latex-packages-alist '("" "cmap" t))
(add-to-list 'org-latex-packages-alist '("english,ukrainian" "babel" t))

;; required for odt export
(require 'ox-odt)
