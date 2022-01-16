(use-package flycheck-rust
  :hook
  (flycheck-mode . flycheck-rust-setup))

(use-package cargo
  :custom
  (cargo-mode-command-build "build --release --features static")
  (cargo-path-to-bin "cargo"))

(use-package lsp-rust
  :custom
  (lsp-rust-server 'rls))

(provide 'devel-rust)
;;; devel-rust.el ends here
