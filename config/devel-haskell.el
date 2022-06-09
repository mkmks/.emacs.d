(use-package flycheck-haskell
  :custom
  (flycheck-haskell-stack-ghc-executable "stack --no-nix --system-ghc"))

(use-package haskell-mode
  :custom
  (haskell-font-lock-symbols nil)
  (haskell-indent-thenelse 1)
  (haskell-literate-default 'bird)
  (haskell-stylish-on-save t)
  :hook
  (haskell-mode . haskell-indentation-mode))

(use-package lsp-haskell
  :after lsp-mode
  :hook (haskell-mode . lsp))

(provide 'devel-haskell)
;;; devel-haskell.el ends here
