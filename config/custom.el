(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-width 80)
 '(TeX-PDF-mode t)
 '(TeX-command-extra-options "-shell-escape")
 '(TeX-engine 'luatex)
 '(TeX-parse-self t)
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open")))
 '(agda2-fontset-name nil)
 '(agda2-highlight-level 'interactive)
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(c-default-style
   '((c-mode . "k&r")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu")))
 '(column-number-mode t)
 '(custom-file "~/.emacs.d/config/custom.el")
 '(default-input-method "russian-computer")
 '(electric-pair-mode t)
 '(epg-gpg-program "gpg2")
 '(fill-column 80)
 '(font-use-system-font t)
 '(fringe-mode '(nil . 0) nil (fringe))
 '(gdb-many-windows t)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-agenda-files '("~/Documents/notes"))
 '(org-capture-templates
   '(("n" "Something I thought or heard" entry
      (file "")
      "" :prepend t)))
 '(org-default-notes-file "~/Documents/notes/inbox.org")
 '(org-directory "~/Documents/notes")
 '(org-reverse-note-order t)
 '(recentf-mode t)
 '(show-paren-mode t)
 '(show-paren-style 'expression)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(url-queue-timeout 30)
 '(vc-follow-symlinks t)
 '(vhdl-upper-case-attributes t)
 '(vhdl-upper-case-constants nil)
 '(vhdl-upper-case-keywords t)
 '(vhdl-upper-case-types t)
 '(visual-line-fringe-indicators '(left-curly-arrow nil))
 '(which-function-mode nil)
 '(windmove-wrap-around t)
 '(woman-fill-frame t)
 '(woman-use-own-frame nil)
 '(word-wrap t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 88 :width normal :foundry "ADBO" :family "Source Code Pro"))))
 '(lsp-ui-sideline-symbol ((t (:background "blue" :foreground "grey" :box (:line-width -1 :color "grey") :height 0.99)))))

(provide 'custom)
;;; custom.el ends here
