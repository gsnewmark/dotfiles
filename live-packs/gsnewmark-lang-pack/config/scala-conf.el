(live-add-pack-lib "scala-mode2")
(require 'scala-mode2)

(custom-set-variables
 '(scala-indent:default-run-on-strategy scala-indent:eager-strategy))

(add-hook 'scala-mode-hook
          '(lambda ()
             (local-set-key (kbd "RET")
                            '(lambda ()
                               (interactive)
                               (newline-and-indent)
                               (scala-indent:insert-asterisk-on-multiline-comment)))
             (local-set-key (kbd "<backtab>")
                            'scala-indent:indent-with-reluctant-strategy)
             (local-set-key (kbd "M-.") 'sbt-find-definitions)
             (local-set-key (kbd "C-x '") 'sbt-run-previous-command)
             (electric-pair-mode)))
(add-hook 'scala-mode-hook 'flyspell-prog-mode)

(setq scala-imenu-generic-expression
      '(("Methods"   "^\\( *\\(def\\) +.+\\)"     1)
        ("Values"    "^\\( *\\(val\\) +.+\\)"     1)
        ("Variables" "^\\( *\\(var\\) +.+\\)"     1)
        ("Objects"   "^\\( *\\(object\\) +.+\\)"  1)
        ("Classes"   "^\\( *\\(class\\) +.+\\)"   1)
        ("Types"     "^\\( *\\(type\\) +.+\\)"    1)))

(add-hook 'scala-mode-hook
          (lambda ()
            (set-fill-column 120)
            (setq imenu-generic-expression scala-imenu-generic-expression)))

(live-add-pack-lib "ensime-emacs")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
