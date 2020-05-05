;;; Emacs-Archives -- Summary:
;;; Commentary:
;;; Tell Emacs where our package archives are located
;;; generated by Zach Maas

;;; Code:

;; Configure package archives
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
												 ("org" . "https://orgmode.org/elpa/")
												 ("marmalade" . "https://marmalade-repo.org/packages/")
												 ("melpa" . "https://melpa.org/packages/")))

;; Force GNUtls to use real security
(setq gnutls-min-prime-bits 4096)
(setq tls-checktrust t)
(setq tls-program "openssl s_client -connect %h:%p -no_ssl3 -no_ssl2 -ign_eof -CAfile %t")

;; Use package.el
;; (package-initialize)
;; (setq package-enable-at-startup nil)

;; Bootstrap Quelpa
; (if (require 'quelpa nil t)
;     (quelpa-self-upgrade)
;   (with-temp-buffer
;     (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
;     (eval-buffer)))

;;; Make sure we have use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; (quelpa
;  '(quelpa-use-package
;    :fetcher github
;    :repo "quelpa/quelpa-use-package"))
(require 'use-package)
(require 'quelpa-use-package)

;; Load auto-compile for any future editing of elisp files
(use-package auto-compile
	:ensure t
	:config
	(add-hook 'after-init-hook #'auto-compile-mode)
	(auto-compile-on-save-mode t)
	(auto-compile-on-load-mode t))

;; Make sure to use quickstart (emacs 27 and above)
(setq package-quickstart t)

;; Make sure we have diminish
(use-package diminish
	:ensure t)

;; Always prefer newer files when loading
(setq load-prefer-newer t)

;; Paradox for better package viewing
(use-package paradox
	:ensure t
	:config
	(paradox-enable))

;; Custom functions
(defun ono-re-init ()
	"Reloads init.el after any changes that we have made."
	(interactive)
	(load user-init-file))

(defun ono-update-packages ()
	"Update all of our packages in ELPA and from QUELPA.
Then, runs the re-initialization sequence."
	(interactive)
	(package-refresh-contents)
	(paradox-upgrade-packages)
	(quelpa-self-upgrade)
	(quelpa-upgrade-all)
	(package-quickstart-refresh)
	(ono-re-init))

