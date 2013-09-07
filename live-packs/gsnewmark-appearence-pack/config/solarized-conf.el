(live-add-pack-lib "solarized-emacs")
(add-to-list 'custom-theme-load-path
             (concat (live-pack-lib-dir) "solarized-emacs"))
(custom-set-variables
 '(solarized-use-variable-pitch nil))
(load-theme 'solarized-dark t)
