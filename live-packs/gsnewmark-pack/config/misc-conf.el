;; Different general emacs conf.
(setq-default tab-width 4)
(setq-default fill-column 78)

;; line numbers
(global-linum-mode t)

;; highlight current line (unless terminal mode)
(if (display-graphic-p)
    (global-hl-line-mode))

;; whitespace config
(setq whitespace-style '(face lines trailing))
(setq-default whitespace-line-column fill-column)
(global-whitespace-mode t)

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

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; X clipboard compatibility
(setq x-select-enable-clipboard t)
(load-file "~/.live-packs/gsnewmark-pack/lib/xclip.el")

;; Set font
(add-to-list 'default-frame-alist '(font . "Menlo-10:bold"))

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
