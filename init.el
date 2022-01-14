;;;; This is my .emacs. There are many like it, but this one is mine.

(setq shell-file-name "/bin/sh")

(require 'package)

(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package vs-light-theme
  :config
  (load-theme 'vs-light t))

(use-package emacs
  :init
  (unbind-key "C-x l" global-map)
  (unbind-key "C-x t" global-map)
  (setq use-package-always-defer t
	backup-directory-alist `((".*" . ,temporary-file-directory))
	auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
	frame-title-format '((:eval (if (projectile-project-p)
					(concat "[" (projectile-project-name) "]/"
						(file-relative-name buffer-file-name
								    (projectile-project-root)))
				      (buffer-name (current-buffer))))
			     (vc-mode vc-mode) " (%m)"))
  (when (daemonp)
    (exec-path-from-shell-initialize))
  :diminish visual-line-mode hi-lock-mode)

(use-package autorevert
  :diminish auto-revert-mode)

(use-package company
  :diminish company-mode)

(use-package tramp
  :init
  (setq tramp-backup-directory-alist backup-directory-alist))

(use-package pretty-mode)

(use-package pixel-scroll-precision-mode)

;;;; APPS

(defun mu4e-goodies-detach-view-to-window ()
  "Detach the current mu4e-view buffer from header to a new window."
  (interactive)
  (when (string= (buffer-name (current-buffer)) mu4e~view-buffer-name)
    (rename-buffer (mu4e-msg-field mu4e~view-msg :subject) t)
    (setq mu4e~view-buffer nil)
    (split-window-below)
    (mu4e-view mu4e~view-msg)))

(use-package mu4e
  :commands
  (mu4e)
  :init
  (defun mu4e~draft-open-file (path)
    "Open the the draft file at PATH."
    (if mu4e-compose-in-new-frame
	(find-file-other-frame path)
      (find-file path))
    (mime-to-mml))
  :bind (:map mu4e-view-mode-map ("'" . mu4e-goodies-detach-view-to-window))
  :config
  (use-package mu4e-maildirs-extension)
  (use-package mu4e-conversation)
  (mu4e-maildirs-extension))

(use-package nov
  :config
  (push '("\\.epub\\'" . nov-mode) auto-mode-alist))

(use-package smudge
  :config
  (setq smudge-transport 'connect))

(use-package telega
  :config
  (setq telega-use-images t))

;;;; PROJECT MANAGEMENT

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package flycheck-haskell)

(use-package flycheck-rust
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package helm
  :diminish helm-mode
  :bind (("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf)
	 ("M-x" . helm-M-x))
  :config
  (use-package helm-ghc)
  (use-package helm-projectile)
  (helm-projectile-on))

(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch)))

(use-package projectile
  :bind (("C-x p" . projectile-commander)))

(use-package restclient)

(use-package which-key
  :diminish which-key-mode)

(use-package direnv)

(use-package multi-vterm
  :bind (("C-x t" . multi-vterm)))

;;;; PROGRAMMING LANGUAGES

(use-package nix-mode
  :mode "\\.nix\\'")

(load-file (let ((coding-system-for-read 'utf-8))
	     (shell-command-to-string "agda-mode locate")))

;(load "ProofGeneral/generic/proof-site")

(use-package haskell-mode)

(use-package haskell-interactive
  :init
  (unbind-key "M-." interactive-haskell-mode-map))

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

(use-package sql)

(use-package sql-clickhouse)

(use-package protobuf-mode)

(use-package toml-mode)

(use-package rustic)

(use-package cargo)

;;;; LANGUAGE SERVER PROTOCOL

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-x l")
  :hook
  (haskell-mode . lsp)
  (haskell-literate-mode . lsp)
  (scala-mode . lsp)
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
  (setq lsp-prefer-flymake nil))

(use-package lsp-haskell)

(use-package lsp-metals)

(use-package lsp-typescript)

(use-package lsp-ui)

(use-package lsp-treemacs
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))

(use-package posframe)

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

(use-package company-lsp)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)
