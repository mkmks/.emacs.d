(use-package company
  :diminish company-mode)

(use-package flycheck
  :custom
  (global-flycheck-mode t))

(use-package helm
  :diminish helm-mode
  :bind (("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf)
	 ("M-x" . helm-M-x))
  :config
  (helm-projectile-on)
  :custom
  (helm-mode t)
  (helm-boring-buffer-regexp-list '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*GNU Emacs" "\\*Completions" "\\*Quail Completions" "\\*fsm-debug" "\\*Help" "\\*Apropos")))

(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch))
  :custom
  (magit-define-global-key-bindings t)
  (magit-diff-refine-hunk 'all))

(use-package projectile
  :bind (("C-x p" . projectile-commander))
  :config
  (setq frame-title-format '((:eval (if (projectile-project-p)
					(concat "[" (projectile-project-name) "]/"
						(file-relative-name buffer-file-name
								    (projectile-project-root)))
				      (buffer-name (current-buffer))))
			     (vc-mode vc-mode) " (%m)"))
  :custom
  (projectile-completion-system 'helm)
  (projectile-globally-ignored-modes '("erc-mode" "help-mode" "completion-list-mode" "Buffer-menu-mode" "gnus-.*-mode" "occur-mode" "rcirc-mode"))
  (projectile-mode-line '(:eval (format " [%s]" (projectile-project-name))))
  (projectile-mode t))

(use-package direnv
  :hook
  (flycheck-before-syntax-check . direnv-update-environment)
  (lsp-before-open-hook . direnv-update-environment)
  :custom
  (direnv-always-show-summary nil)
  (direnv-mode t))

(use-package vterm
  :custom
  (vterm-buffer-name-string "%s")
  (vterm-shell "fish"))

(use-package multi-vterm
  :init (unbind-key "C-x t" global-map)
  :bind (("C-x t" . multi-vterm)))

(use-package tramp
  :init
  (setq tramp-backup-directory-alist backup-directory-alist)
  :custom
  (tramp-default-method "ssh")
  (tramp-syntax 'default))

(use-package lsp-mode
  :init
  (unbind-key "C-x l" global-map)
  (setq lsp-keymap-prefix "C-x l")
  :hook
  (java-mode . lsp)
  (python-mode . lsp)
  (tex-mode . lsp)
  (latex-mode . lsp)
  (sh-mode . lsp)
  (typescript-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands
  (lsp lsp-deferred)
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
  :custom
  (lsp-file-watch-threshold 10000)
  (lsp-headerline-breadcrumb-segments '(symbols))
  (lsp-prefer-flymake nil)
  :custom-face
  (lsp-ui-sideline-symbol ((t (:background "blue" :foreground "grey" :box (:line-width -1 :color "grey") :height 0.99)))))

(use-package lsp-ui
  :custom
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-symbol nil))

(use-package lsp-treemacs
  :custom
  (lsp-treemacs-sync-mode t))

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

(use-package nix-mode
  :mode "\\.nix\\'")

(load-file (let ((coding-system-for-read 'utf-8))
	     (shell-command-to-string "agda-mode locate")))

(use-package agda
  :custom
  (agda2-highlight-level 'interactive))

(provide 'devel)
;;; devel.el ends here
