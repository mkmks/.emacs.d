(use-package TeX
  :custom
  (TeX-PDF-mode t)
  (TeX-command-extra-options "-shell-escape")
  (TeX-engine 'luatex)
  (TeX-parse-self t)
  (TeX-view-program-selection '(((output-dvi has-no-display-manager)
				 "dvi2tty")
				((output-dvi style-pstricks)
				 "dvips and gv")
				(output-pdf "Zathura")
				(output-html "xdg-open"))))

(use-package org
  :custom
  (org-agenda-files '("~/Documents/notes"))
  (org-capture-templates
   '(("n" "Something I thought or heard" entry
      (file "")
      "" :prepend t)))
  (org-default-notes-file "~/Documents/notes.org")
  (org-directory "~/Documents/notes")
  (org-reverse-note-order t))

(use-package ellama
  :bind ("C-c e" . ellama)
  :hook (org-ctrl-c-ctrl-c-final . ellama-chat-send-last-message))

(provide 'write)
;;; write.el ends here
