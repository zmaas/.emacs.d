;;; Emacs-Mail -- Summary:
;;; Commentary:
;; configuration of mu4e for Emacs
;;; generated by Zach Maas

;;; Code:

;; Note: mu4e custom bindings are under the [m]essages mode leader binding.
;; See evil-tools.el for details
(require 'mu4e)
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it)
(setq mu4e-change-filenames-when-moving t)

(use-package org-mu4e)

(use-package evil-mu4e
	:ensure t
	:config
	(evil-set-initial-state 'mu4e-main-mode 'emacs))

(use-package org-mime
	:ensure t
	:config
	(setq mail-user-agent 'mu4e-user-agent))

(setq mu4e-maildir "~/.mail/")

;; Store account personal settings in an untracked file
(load-file "~/.emacs.d/apps/mail-private.el")

;; Custom bookmarks
(add-to-list 'mu4e-bookmarks
             '("flag:unread AND date:today..now" "Todays Unread Email" ?i)
						 '("flag:unread AND date:7d..now" "This Week's Unread Email" ?o))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))


(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
(add-hook 'mu4e-view-mode-hook 'olivetti-mode)

;; use imagemagick for inline images when available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; Better rendering of html as very plain text.
(setq mu4e-html2text-command "pandoc -f html -t plain --columns=72 --wrap=auto")
;; Other options for rendering
;; (setq mu4e-html2text-command 'mu4e-shr2text)
;; (setq mu4e-html2text-command "html2text --unicode-snob --body-width=72")
;; (setq mu4e-html2text-command "w3m -T text/html")

;; Since we view as plain text, it's convenient to be able to open it
;; in our browser with all of the browser's security configuration.
(add-to-list 'mu4e-view-actions
						 '("ViewInBrowser" . mu4e-action-view-in-browser) t)


(setq-default
 mu4e-confirm-quit nil
 mu4e-view-show-images t
 mu4e-view-prefer-html nil
 mu4e-sent-messages-behavior 'delete
 mu4e-get-mail-command "mbsync -a"
 mu4e-completing-read-function 'completing-read
 message-kill-buffer-on-exit t)

(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'mu4e-compose-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ls" '(mml-secure-sign-pgpmime :which-key "PGP sign (mime)")
 "lS" '(mml-secure-sign-pgp :which-key "PGP sign (plain)")
 "le" '(mml-secure-encrypt-pgpmime :which-key "PGP encrypt (mime)")
 "lE" '(mml-secure-encrypt-pgp :which-key "PGP encrypt (plain)")
 "la" '(mml-attach-file :which-key "attach file")
 "lL" '(langtool-check :which-key "spellcheck")
 "ll" '(langtool-check-done :which-key "done spellcheck")
 "ld" '(ono-safe-send :which-key "send!"))

;; mail.el ends here
