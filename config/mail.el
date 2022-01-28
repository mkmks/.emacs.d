(setq user-mail-address "nf@mkmks.org")

(use-package message
  :custom
  (setq message-auto-save-directory nil
	message-citation-line-format "%A %d %B %Y, à %H:%M, %N a écrit:
"
	message-citation-line-function 'message-insert-formatted-citation-line
	message-directory "~/.emacs.d/message/"
	message-kill-buffer-on-exit t
	message-send-mail-function 'message-send-mail-with-sendmail))

(setq mm-coding-system-priorities '(utf8)
      mm-text-html-renderer 'shr)

(defun mu4e-goodies-detach-view-to-window ()
  "Detach the current mu4e-view buffer from header to a new window."
  (interactive)
  (when (string= (buffer-name (current-buffer)) mu4e~view-buffer-name)
    (rename-buffer (mu4e-msg-field mu4e~view-msg :subject) t)
    (setq mu4e~view-buffer nil)
    (split-window-below)
    (mu4e-view mu4e~view-msg)))

(use-package mu4e
  :commands (mu4e)
  :init (unbind-key "C-x m" global-map)
  :bind (("C-x m" . mu4e))
  :config
  (setq mu4e-contexts
	`(,(make-mu4e-context
	    :name "fastmail"
	    :match-func (lambda (msg) (when msg (string-match-p "^/fastmail" (mu4e-message-field msg :maildir))))
	    :vars '((user-mail-address . "nf@mkmks.org")
		    (user-full-name . "Nikita Frolov")
		    (mu4e-drafts-folder . "/fastmail/Drafts")
		    (mu4e-refile-folder . "/fastmail/Archive")
		    (mu4e-sent-folder   . "/fastmail/Sent")
		    (mu4e-trash-folder  . "/fastmail/Trash")))
	  ,(make-mu4e-context
	    :name "concordium"
	    :match-func (lambda (msg) (when msg (string-match-p "^/concordium" (mu4e-message-field msg :maildir))))
	    :vars '((user-mail-address . "nf@concordium.com")
		    (user-full-name . "Nikita Frolov")
		    (mu4e-drafts-folder . "/concordium/[Gmail]/Drafts")
		    (mu4e-refile-folder . "/concordium/[Gmail]/All Mail")
		    (mu4e-sent-folder   . "/concordium/[Gmail]/Sent Mail")
		    (mu4e-trash-folder  . "/concordium/[Gmail]/Bin")))))
  :init
  (defun mu4e~draft-open-file (path)
    "Open the the draft file at PATH."
    (if mu4e-compose-in-new-frame
	(find-file-other-frame path)
      (find-file path))
    (mime-to-mml))
  :bind (:map mu4e-view-mode-map ("'" . mu4e-goodies-detach-view-to-window))
  :config
;  (mu4e-maildirs-extension)
  :custom
  (mu4e-attachment-dir "/home/viv/Downloads")
  (mu4e-bookmarks '(( :name "Unread new messages"
		      :query "flag:unread AND NOT flag:list AND NOT flag:trashed"
		      :key ?i)
		    ( :name "Today's messages"
		      :query "date:today..now"
		      :key ?t)
		    ( :name "Last 7 days"
		      :query "date:7d..now AND NOT flag:list"
		      :key ?w)
		    ( :name "Unread mailing lists"
		      :query "flag:unread AND flag:list AND NOT flag:trashed"
		      :key ?l)		    
		    ( :name "Messages with images"
		      :query "mime:image/* AND NOT flag:list"
		      :key ?p)
		    ( :name "Messages with attachments"
		      :query "flag:attach AND NOT flag:list"
		      :key ?a)))
  (mu4e-change-filenames-when-moving t)
  (mu4e-compose-complete-only-personal t)
  (mu4e-compose-dont-reply-to-self t)
  (mu4e-compose-in-new-frame t)
  (mu4e-compose-signature nil)
  (mu4e-confirm-quit nil)
  (mu4e-get-mail-command "mbsync -a")
;  (mu4e-maildirs-extension-use-bookmarks t)
  (mu4e-user-mail-address-list '("nf@mkmks.org" "nf@concordium.com"))
  (mu4e-view-show-images t))

(provide 'mail)
;;; mail.el ends here
