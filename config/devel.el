(use-package company
  :custom
  (global-company-mode t)
  :diminish company-mode)

(use-package treesit)

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(use-package flycheck
  :custom
  (global-flycheck-mode t))

(use-package flycheck-eglot
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode t))

(use-package flycheck-haskell
  :custom
  (flycheck-haskell-stack-ghc-executable "stack --no-nix --system-ghc"))

(use-package flycheck-rust
  :hook
  (flycheck-mode . flycheck-rust-setup))

;; (use-package helm
;;   :diminish helm-mode
;;   :bind (("C-x b" . helm-buffers-list)
;; 	 ("C-x C-f" . helm-find-files)
;;          ("C-x C-r" . helm-recentf)
;; 	 ("M-x" . helm-M-x))
;;   :config
;;   (helm-projectile-on)
;;   :custom
;;   (helm-mode t)
;;   (helm-boring-buffer-regexp-list '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf" "\\*GNU Emacs" "\\*Completions" "\\*Quail Completions" "\\*fsm-debug" "\\*Help" "\\*Apropos"))

(use-package counsel-projectile
  :custom
  (counsel-projectile-mode t))

(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch))
  :custom
  (magit-define-global-key-bindings t)
  (magit-diff-refine-hunk 'all))

(use-package projectile
  :bind-keymap
  ("C-x p" . projectile-command-map)
  :config
  (setq frame-title-format
	'((:eval (if buffer-file-name
		     (if (and buffer-file-name (projectile-project-p))
			 (concat "[" (projectile-project-name) "]/"
				 (file-relative-name buffer-file-name
						     (projectile-project-root)))
		       "%f")
		   "%b"))
	  (vc-mode vc-mode) " (%m)"))
  :custom
  (projectile-completion-system 'ivy)
  (projectile-globally-ignored-modes '("erc-mode" "help-mode" "completion-list-mode" "Buffer-menu-mode" "gnus-.*-mode" "occur-mode" "rcirc-mode"))
  (projectile-mode-line '(:eval (format " [%s]" (projectile-project-name))))
  (projectile-mode t))

(use-package direnv
  :hook
  (flycheck-before-syntax-check . direnv-update-environment)
  :config
  (direnv-mode)
  :custom
  (direnv-always-show-summary nil))
  
(use-package nix-buffer)

(use-package vterm
  :init
  (unbind-key [next] pixel-scroll-precision-mode-map)
  (unbind-key [prior] pixel-scroll-precision-mode-map)
  :bind
  (:map vterm-mode-map
	("C-h" . vterm-send-backspace))
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

(use-package eglot
  :hook
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (cmake-mode . eglot-ensure)
  (mlir-mode . eglot-ensure)
  (sh-mode . eglot-ensure)
  
  (python-mode . eglot-ensure)
  (typescript-mode . eglot-ensure)
  (elm-mode . eglot-ensure)

  (haskell-mode . eglot-ensure)
  (java-mode . eglot-ensure)
  (scala-mode . eglot-ensure)
  (rustic-mode . eglot-ensure)
  (zig-mode . eglot-ensure)

  (tex-mode . eglot-ensure)
  (latex-mode . eglot-ensure))

(use-package copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-c M-f" . copilot-complete)
         :map copilot-completion-map
         ("C-g" . 'copilot-clear-overlay)
         ("M-p" . 'copilot-previous-completion)
         ("M-n" . 'copilot-next-completion)
         ("<tab>" . 'copilot-accept-completion)
         ("M-f" . 'copilot-accept-completion-by-word)
         ("M-<return>" . 'copilot-accept-completion-by-line)))

(use-package nix-mode
  :mode "\\.nix\\'")

(load-file (let ((coding-system-for-read 'utf-8))
	     (shell-command-to-string "agda-mode locate")))

(use-package agda
  :custom
  (agda2-highlight-level 'interactive))

(add-to-list 'load-path "~/repos/zama/concrete-open-source/third_party/llvm-project/llvm/utils/emacs/")
(add-to-list 'load-path "~/repos/zama/concrete-open-source/third_party/llvm-project/mlir/utils/emacs/")

(use-package llvm-mode)
(use-package mlir-mode
  :mode "\\.mlir\\'")
(use-package tablegen-mode
  :mode "\\.td\\'")


(use-package haskell-mode
  :custom
  (haskell-font-lock-symbols nil)
  (haskell-indent-thenelse 1)
  (haskell-literate-default 'bird)
  (haskell-stylish-on-save t)
  :hook
  (haskell-mode . haskell-indentation-mode))

(use-package cargo
  :custom
  (cargo-mode-command-build "build --release --features static")
  (cargo-path-to-bin "cargo"))

(use-package rust-mode
  :custom
  (rust-mode-treesitter-derive t))

(use-package rustic
  :after
  (rust-mode)
  :custom
  (rustic-lsp-client 'eglot))

(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false")))

(provide 'devel)
;;; devel.el ends here
