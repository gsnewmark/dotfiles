(live-add-pack-lib "sbt-mode")
(require 'sbt-mode)

(add-hook 'sbt-mode-hook
          '(lambda ()
             (setq compilation-skip-threshold 1)
             (local-set-key (kbd "C-a") 'comint-bol)
             (local-set-key (kbd "M-RET") 'comint-accumulate)))

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
