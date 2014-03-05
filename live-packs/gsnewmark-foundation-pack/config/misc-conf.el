(setq-default tab-width 4)
(setq-default fill-column 78)

;; Add ukrainian input method
(set-input-method 'ukrainian-computer)
(setq current-input-method nil)

;; whitespace config
(setq whitespace-style '(face lines trailing))
(setq-default whitespace-line-column fill-column)
(global-whitespace-mode t)
(setq whitespace-global-modes '(not erc-mode))

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Sudo edit
(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; Workaround for auto completion in terminal modes
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))

;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))
