(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook
          (lambda ()
            (auto-fill-mode)))

;; key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; clocking time spent on tasks (to persist time between sessions)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-log-done t)
;(setq org-startup-indented t)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")

;; Possible state sequences for TODOs
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")
        (sequence "BUG" "|" "FIXED")
        (sequence "FEATURE" "|" "ADDED")
        (sequence "READING" "|" "READ")
        (sequence "HW TODO" "|" "HW DONE")
        (sequence "IDEA" "|" "WORKING ON")))

;; org-mode agenda
(setq org-agenda-files
      (list (concat org-directory "/gtd.org")))

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

;; org-babel
(require 'ob)
(require 'ob-tangle)
(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (clojure . t)))
(require 'ob-clojure)

(eval-after-load "ob-clojure"
  '(defun org-babel-execute:clojure (body params)
     "Execute a block of Clojure code with Babel and nREPL."
     (require 'nrepl)
     (let ((result (nrepl-eval (org-babel-expand-body:clojure body params))))
       (car (read-from-string (plist-get result :value))))))

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-babel-evaluate nil)
(setq org-src-window-setup 'current-window)
