(live-add-pack-lib "scala-mode2")
(require 'scala-mode2)

(live-add-pack-lib "ensime/elisp")
(require 'ensime)

(custom-set-variables
 '(scala-indent:default-run-on-strategy scala-indent:reluctant-strategy))

(add-hook 'scala-mode-hook
          '(lambda ()
             (ensime-scala-mode-hook)
             (local-set-key (kbd "RET")
                            '(lambda ()
                               (interactive)
                               (newline-and-indent)
                               (scala-indent:insert-asterisk-on-multiline-comment)))
             (local-set-key (kbd "C-M-j") 'join-line)
             (local-set-key (kbd "<backtab>")
                            'scala-indent:indent-with-reluctant-strategy)))
(add-hook 'scala-mode-hook 'flyspell-prog-mode)
