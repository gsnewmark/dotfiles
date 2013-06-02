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
