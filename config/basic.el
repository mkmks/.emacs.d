(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package emacs
  :init
  (when (daemonp)
    (exec-path-from-shell-initialize))
  :hook
  (conf-mode . display-line-numbers-mode)
  (prog-mode . display-line-numbers-mode)
  (text-mode . display-line-numbers-mode)
  :custom
  (use-package-always-defer t)
  (custom-file "~/.config/emacs/config/custom.el")
  (default-input-method "russian-computer")

  (gc-cons-threshold 100000000)
  (read-process-output-max (* 1024 1024))

  (inhibit-startup-screen t)
  (blink-cursor-mode nil)
  (menu-bar-mode nil)
  (mode-line-format nil)
  (tool-bar-mode nil)
  (pixel-scroll-mode t)
  (pixel-scroll-precision-mode t)
  
  (auto-save-default nil)
  (auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
  (backup-directory-alist `((".*" . ,temporary-file-directory)))
  (make-backup-files nil)

  (column-number-mode t)
;  (global-display-line-numbers-mode t)
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
  (default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 88 :width normal :foundry "ADBO" :family "JetBrains Mono"))))
  :diminish
  visual-line-mode hi-lock-mode auto-revert-mode which-key-mode)

(use-package ivy
  :diminish
  :custom
  (ivy-mode t))

(use-package counsel
  :diminish
  :custom
  (counsel-mode t))

(use-package swiper
  :bind
  (("C-s" . swiper-isearch)
   ("C-r" . swiper-isearch-backward)))

(use-package frames-only-mode
  :custom
  (frames-only-mode t))

(use-package nov
  :mode ("\\.epub\\'" . nov-mode))

(use-package smudge
  :custom
  (setq smudge-transport 'connect))

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
