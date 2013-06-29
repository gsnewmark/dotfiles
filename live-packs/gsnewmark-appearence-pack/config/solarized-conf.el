(live-add-pack-lib "solarized-emacs")
(add-to-list 'custom-theme-load-path
             (concat (live-pack-lib-dir) "solarized-emacs"))
(load-theme 'solarized-light t)
