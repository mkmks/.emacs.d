(use-package vs-light-theme
  :config
  (load-theme 'vs-light t))

(use-package emacs
  :init
  (when (daemonp)
    (exec-path-from-shell-initialize))
  :custom
  (use-package-always-defer t)
  (custom-file "~/.emacs.d/config/custom.el")
  (default-input-method "russian-computer")

  (gc-cons-threshold 100000000)
  (read-process-output-max (* 1024 1024))

  (inhibit-startup-screen t)
  (blink-cursor-mode nil)
  (menu-bar-mode nil)
  (tool-bar-mode nil)
  (pixel-scroll-precision-mode t)
  
  (auto-save-default nil)
  (auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
  (backup-directory-alist `((".*" . ,temporary-file-directory)))
  (make-backup-files nil)

  (column-number-mode t)
  (global-linum-mode t)
  (global-visual-line-mode t)
  (indicate-empty-lines t)
  (size-indication-mode t)
  (visual-line-fringe-indicators '(left-curly-arrow nil))
  
  (electric-pair-mode t)
  (show-paren-mode t)
  (show-paren-style 'expression)

  (fill-column 100)
  (global-auto-revert-mode t)
  (recentf-mode t)
  (which-function-mode nil)
  (which-key-mode t)
  :custom-face
  (default ((t (:inherit nil :extend nil :stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 88 :width normal :foundry "ADBO" :family "Source Code Pro"))))
  :diminish visual-line-mode hi-lock-mode auto-revert-mode which-key-mode)

;; (use-package shackle
;;   :custom
;;   (shackle-default-rule '(:frame t)))
;; ;  (shackle-display-buffer-frame-function 'sway-shackle-display-buffer-frame))

;; (use-package sway
;;   :custom
;;   (pop-up-frames 'graphic-only)
;;   :config
;;   (sway-socket-tracker-mode)
;;   (sway-undertaker-mode)
;;   (sway-x-focus-through-sway-mode))

(use-package frames-only-mode
  :custom
  (frames-only-mode t))

(use-package nov
  :mode ("\\.epub\\'" . nov-mode))

(use-package smudge
  :custom
  (setq smudge-transport 'connect))

(use-package slack
  :commands (slack-start)
  :config
  (slack-register-team
   :name "concordium"
   :token (auth-source-pick-first-password
	   :host "concordium.slack.com"
	   :user "nf@mkmks.org")
   :cookie (auth-source-pick-first-password
	    :host "concordium.slack.com"
	    :user "nf@mkmks.org^cookie")))

(use-package telega
  :custom
  (setq telega-use-images t))

(use-package hledger-mode
  :mode ("\\.journal\\'" "\\.hledger\\'")
  :commands hledger-enable-reporting
  :init
  (add-hook 'hledger-mode-hook
            (lambda ()
              (make-local-variable 'company-backends)
              (add-to-list 'company-backends 'hledger-company))))

(provide 'basic)
;;; basic.el ends here
