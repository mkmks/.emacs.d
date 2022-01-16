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
  :commands
  (mu4e)
  :init
  (defun mu4e~draft-open-file (path)
    "Open the the draft file at PATH."
    (if mu4e-compose-in-new-frame
	(find-file-other-frame path)
      (find-file path))
    (mime-to-mml))
  :bind (:map mu4e-view-mode-map ("'" . mu4e-goodies-detach-view-to-window))
  :config
  (mu4e-maildirs-extension)
  :custom
  (mu4e-attachment-dir "/home/viv/Downloads")
  (mu4e-bookmarks '(("flag:unread AND NOT flag:list AND NOT flag:trashed AND NOT maildir:/Archive AND NOT maildir:/Spam" "Unread new messages" 117)
		    ("flag:unread AND flag:list AND NOT flag:trashed AND NOT maildir:/Archive AND NOT maildir:/Spam" "Unread mailing lists" 108)
		    ("date:today..now AND NOT maildir:/Spam" "Today's messages" 116)
		    ("date:7d..now AND NOT maildir:/Spam" "Last 7 days" 119)
		    ("mime:image/* AND NOT maildir:/Spam" "Messages with images" 112)
		    ("flag:attach AND NOT maildir:/Spam" "Messages with attachments" 97)))
  (mu4e-change-filenames-when-moving t)
  (mu4e-compose-complete-only-personal t)
  (mu4e-compose-dont-reply-to-self t)
  (mu4e-compose-in-new-frame t)
  (mu4e-compose-signature nil)
  (mu4e-confirm-quit nil)
  (mu4e-drafts-folder "/Drafts")
  (mu4e-get-mail-command "mbsync -a")
  (mu4e-maildir "/home/viv/Mail/fastmail")
  (mu4e-maildirs-extension-use-bookmarks t)
  (mu4e-refile-folder "/Archive")
  (mu4e-sent-folder "/Sent")
  (mu4e-trash-folder "/Trash")
  (mu4e-user-mail-address-list '("nf@mkmks.org"))
  (mu4e-view-show-images t))

(provide 'mail)
;;; mail.el ends here
