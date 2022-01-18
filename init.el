;;;; This is my .emacs. There are many like it, but this one is mine.

(add-to-list 'load-path "~/.emacs.d/config")

(require 'basic)
(require 'devel)
(require 'devel-haskell)
(require 'devel-rust)
(require 'devel-scala)
(require 'mail)
(require 'write)

(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file)

(provide 'init)
;;; init.el ends here

