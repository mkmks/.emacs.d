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

(use-package lsp-metals
  :custom
  (lsp-metals-treeview-enable t)
  (lsp-metals-treeview-show-when-views-received t)
  (lsp-metals-show-implicit-conversions-and-classes t)
  (lsp-metals-show-inferred-type t)
  :hook (scala-mode . lsp))

(provide 'devel-scala)
;;; devel-scala.el ends here
