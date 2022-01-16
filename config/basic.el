(use-package vs-light-theme
  :config
  (load-theme 'vs-light t))

(use-package emacs
  :init
  (when (daemonp)
    (exec-path-from-shell-initialize))
  :custom
  (use-package-always-defer t)
  (auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
  (backup-directory-alist `((".*" . ,temporary-file-directory)))
  (global-auto-revert-mode t)
  (global-linum-mode t)
  (global-visual-line-mode t)
  (pixel-scroll-precision-mode t)
  (which-key-mode t)
  :diminish visual-line-mode hi-lock-mode auto-revert-mode which-key-mode)

(use-package shackle
  :custom
  (shackle-default-rule '(:frame t)))
;  (shackle-display-buffer-frame-function 'sway-shackle-display-buffer-frame))

(use-package sway
  :config
  (sway-socket-tracker-mode)
  (sway-undertaker-mode)
  (sway-x-focus-through-sway-mode))

(use-package nov
  :mode ("\\.epub\\'" . nov-mode))

(use-package smudge
  :custom
  (setq smudge-transport 'connect))

(use-package telega
  :custom
  (setq telega-use-images t))

(provide 'basic)
;;; basic.el ends here
