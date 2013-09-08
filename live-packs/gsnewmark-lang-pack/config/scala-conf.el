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
             (local-set-key (kbd "C-M-j") 'join-line)
             (local-set-key (kbd "<backtab>")
                            'scala-indent:indent-with-reluctant-strategy)))

(add-hook 'scala-mode-hook 'flyspell-prog-mode)
