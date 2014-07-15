(live-add-pack-lib "scala-mode2")
(require 'scala-mode2)

(custom-set-variables
 '(scala-indent:default-run-on-strategy scala-indent:eager-strategy))

;; from https://github.com/tototoshi/dotemacs/blob/master/my-scala-config.el#L28
(setq scala-imenu-generic-expression
      '(("var" "\\(var +\\)\\([^(): ]+\\)" 2)
        ("val" "\\(val +\\)\\([^(): ]+\\)" 2)
        ("override def" "^[ \\t]*\\(override\\) +\\(def +\\)\\([^(): ]+\\)" 3)
        ("private def" "^[ \\t]*\\(private\\(\\[.*?\\]+\\)*\\) +\\(def +\\)\\([^(): ]+\\)" 4)
        ("protected def" "^[ \\t]*\\(protected\\(\\[.*?\\]+\\)*\\) +\\(def +\\)\\([^(): ]+\\)" 4)
        ("implicit def" "^[ \\t]*\\(implicit\\) +\\(def +\\)\\([^(): ]+\\)" 3)
        ("def" "^[ \\t]*\\(def +\\)\\([^(): ]+\\)" 2)
        ("trait" "\\(trait +\\)\\([^(): ]+\\)" 2)
        ("class" "^[ \\t]*\\(class +\\)\\([^(): ]+\\)" 2)
        ("case class" "^[ \\t]*\\(case class +\\)\\([^(): ]+\\)" 2)
        ("abstract class" "^[ \\t]*\\(abstract class +\\)\\([^(): ]+\\)" 2)
        ("object" "\\(object +\\)\\([^(): ]+\\)" 2)))

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
             (local-set-key (kbd "C-c M-j") 'ensime)
             (electric-pair-mode)
             (set-fill-column 120)
             (setq imenu-generic-expression scala-imenu-generic-expression)))
(add-hook 'scala-mode-hook 'flyspell-prog-mode)

(live-add-pack-lib "ensime-emacs")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
