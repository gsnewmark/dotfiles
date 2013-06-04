(live-add-pack-lib "Emacs-Groovy-Mode")

(require 'groovy-mode)

(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)
             (require 'grails-mode)
             (grails-mode)))
