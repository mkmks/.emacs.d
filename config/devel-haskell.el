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
  :hook (haskell-mode . lsp)
  :custom
  (lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  (lsp-haskell-server-path "/home/viv/.cabal/bin/haskell-language-server"))

(provide 'devel-haskell)
;;; devel-haskell.el ends here
