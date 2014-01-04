(live-add-pack-lib "quack")
(live-add-pack-lib "geiser/elisp")

(setq scheme-program-name "mzscheme")
(setq geiser-active-implementations '(racket))

(require 'geiser)

(add-hook 'scheme-mode-hook
          '(lambda ()
             (require 'quack)
             (setq quack-fontify-style 'emacs)))
