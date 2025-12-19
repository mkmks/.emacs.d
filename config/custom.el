(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-date-style 'european)
 '(calendar-week-start-day 1)
 '(copilot-idle-delay nil)
 '(electric-pair-mode t nil nil "Customized with use-package emacs")
 '(fill-column 80 nil nil "Customized with use-package emacs")
 '(markdown-command "pandoc -F mermaid-filter")
 '(mode-line-compact 'long)
 '(nov-variable-pitch nil)
 '(projectile-enable-caching t)
 '(vterm-max-scrollback 100000))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#1e1e2e" :foreground "#cdd6f4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 90 :width normal :foundry "ADBO" :family "JetBrains Mono"))))
 '(variable-pitch ((t nil)))
 '(variable-pitch-text ((t nil))))

(provide 'custom)
;;; custom.el ends here
