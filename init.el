;;;; This is my .emacs. There are many like it, but this one is mine.

(add-to-list 'load-path "~/.config/emacs/config")

(require 'basic)
(require 'devel)
(require 'mail)
(require 'write)

(setq custom-file "~/.config/emacs/config/custom.el")
(load custom-file)

(provide 'init)
;;; init.el ends here

