;; package --- Summary
;; Commentary:
;;      ___           ___           ___
;;     /\  \         /\  \         /\  \
;;    /::\  \        \:\  \       /::\  \
;;   /:/\:\  \        \:\  \     /:/\:\  \
;;  /:/  \:\  \   _____\:\  \   /:/  \:\  \
;; /:/__/ \:\__\ /::::::::\__\ /:/__/ \:\__\
;; \:\  \ /:/  / \:\~~\~~\/__/ \:\  \ /:/  /
;;  \:\  /:/  /   \:\  \        \:\  /:/  /
;;   \:\/:/  /     \:\  \        \:\/:/  /
;;    \::/  /       \:\__\        \::/  /
;;     \/__/         \/__/         \/__/
;;                  EMACS
;;
;; Emacs configuration file - generated by Zach Maas for Emacs 25.2
;; Configured for use on Linux, vc using git

;; TODO:
;; See README

;;; Code:

;; Setup Garbage Collection Threshold for Speed
(setq gc-cons-threshold (* 50 1024 1024))

;; Start timer for startup
(defconst emacs-start-time (current-time))

;; Configure package archives
(setq package-archives '(
												 ("gnu" . "https://elpa.gnu.org/packages/")
												 ("org" . "https://orgmode.org/elpa/")
												 ("marmalade" . "https://marmalade-repo.org/packages/")
												 ("melpa" . "https://melpa.org/packages/")))

(setq gnutls-min-prime-bits 4096)
(setq tls-checktrust t)

(package-initialize)
(setq package-enable-at-startup nil)
(savehist-mode t)

;;; Make sure we have use-package
(unless (package-installed-p 'use-package)
	(package-install 'use-package))
(require 'use-package)

(use-package auto-compile
	:ensure t
	:config
	(add-hook 'after-init-hook #'auto-compile-mode)
	(auto-compile-on-save-mode t)
	(auto-compile-on-load-mode t))

(setq load-prefer-newer t)

;; Paradox for better package viewing
(use-package paradox
	:ensure t
	:config
	(paradox-enable))

;; No splash screen
(require 'diminish)

;; Set reasonable defaults for startup
(setq inhibit-startup-message t)
(setq-default fill-column 80)
(setq-default tab-width 2)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Make font-lock work better in the background
(setq jit-lock-defer-time nil
      ;; jit-lock-stealth-nice 0.1
      jit-lock-stealth-time 1
      jit-lock-stealth-verbose nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq line-move-visual t)

(setq backup-directory-alist '(("." . "~/.emacsbackups")))

(setq auth-sources
			'((:source "~/.emacs.d/secrets/.authinfo.gpg")))

(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font Light 10"))
(set-face-attribute 'default t :font "Iosevka Nerd Font Light 10")
;; Default font should be Iosevka Nerd Font Light, 10pt

;; Prevents us from fat fingering and accidentally closing emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Load from init files
(load-file "~/.emacs.d/personal.el")
(load-file "~/.emacs.d/core/evil.el")
(load-file "~/.emacs.d/core/ivy.el")
(load-file "~/.emacs.d/core/hydras.el")
(load-file "~/.emacs.d/core/completions.el")
(load-file "~/.emacs.d/core/error-checks.el")
(load-file "~/.emacs.d/core/style-checks.el")
(load-file "~/.emacs.d/core/utils.el")
(load-file "~/.emacs.d/core/shell.el")

;; Load various app configurations
(load-file "~/.emacs.d/apps/mail.el")
(load-file "~/.emacs.d/apps/irc.el")


;; Theming configuration files
(load-file "~/.emacs.d/core/themes.el")
(load-file "~/.emacs.d/core/appearance.el")

;; Load language specific configurations
;; Inspiration from spacemacs
(load-file "~/.emacs.d/lang/latex.el")
(load-file "~/.emacs.d/lang/org.el")
(load-file "~/.emacs.d/lang/lisp.el")
(load-file "~/.emacs.d/lang/clojure.el")
(load-file "~/.emacs.d/lang/python.el")
(load-file "~/.emacs.d/lang/go.el")
(load-file "~/.emacs.d/lang/r.el")
(load-file "~/.emacs.d/lang/md.el")
(load-file "~/.emacs.d/lang/c++.el")

(daytime-space-theme)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote ((dvi . source-specials) (pdf . synctex))))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-selection
	 (quote
		(((output-dvi has-no-display-manager)
			"dvi2tty")
		 ((output-dvi style-pstricks)
			"dvips and gv")
		 (output-dvi "xdvi")
		 (output-pdf "Zathura")
		 (output-html "xdg-open"))))
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(company-flx-mode t)
 '(custom-safe-themes
	 (quote
		("3e8ea6a37f17fd9e0828dee76b7ba709319c4d93b7b21742684fadd918e8aca3" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "2cf7f9d1d8e4d735ba53facdc3c6f3271086b6906c4165b12e4fd8e3865469a6" "7a6bc9de067a7a0aa00272812d45087eec02c3befdf2b54c291578210ce7baca" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-avy-mode nil)
 '(evil-snipe-mode t)
 '(fci-rule-color "#383838")
 '(global-hl-line-mode t)
 '(minimap-mode nil)
 '(package-selected-packages
	 (quote
		(auto-save-buffers-enhanced vlf bookmark+ shrink-whitespace ws-butler editorconfig synosaurus smart-tab company-statistics eshell-prompt-extras keychain-environment ess yaml-mode eziam-theme evil-nerd-commenter evil-nderd-commenter virtualenvwrapper anaconda counsel-dash latex-extra all-the-icons-ivy tao-theme smooth-scrolling ggtags function-args markdown-mode irony paradox circe tiny auto-yasnippet quickrun dashboard moe-theme geiser slime yasnippet evil-mu4e org-plus-contrib persp-mode fireplace evil-multiedit plan9-theme shackle all-the-icons nlinum-relative git-gutter-fringe ranger company-go go-mode interleave cider evil-snipe evil-goggles cyberpunk-theme evil-smartparens company-flx highlight-parentheses spaceline spacemacs-theme ibuffer-vc dumb-jump smex general clipmon ivy-hydra ivy-bibtex zzz-to-char flyspell-correct-ivy counsel-projectile counsel markdown-mode+ auctex-latexmk company-math company-bibtex langtool eyebrowse rainbow-mode writegood-mode olivetti flyspell-correct redtick evil-org org-bullets sublimity telephone-line projectile auto-dim-other-buffers ace-window evil-escape highlight-thing sr-speedbar focus evil-magit pdf-tools crosshairs hydra column-enforce-mode neotree ipython company-anaconda auto-virtualenv linum-relative company-quickhelp highlight-indent-guides indent-guide company-jedi whitespace-cleanup-mode which-key visual-regexp use-package symon smartparens slime-company rainbow-delimiters powerline-evil magit latex-preview-pane highlight-tail highlight-symbol highlight-numbers flycheck-pos-tip fancy-narrow expand-region evil-vimish-fold evil-avy evil-anzu color-identifiers-mode auto-package-update auto-highlight-symbol auto-compile aggressive-indent ace-popup-menu)))
 '(paradox-github-token t)
 '(safe-local-variable-values (quote ((o-byte-compile . t))))
 '(send-mail-function (quote smtpmail-send-it))
 '(vc-annotate-background "#F6F6F6")
 '(vc-annotate-color-map
	 (quote
		((20 . "#C3C3C3")
		 (40 . "#9E9E9E")
		 (60 . "#9E9E9E")
		 (80 . "#616161")
		 (100 . "#616161")
		 (120 . "#3C3C3C")
		 (140 . "#3C3C3C")
		 (160 . "#252525")
		 (180 . "#252525")
		 (200 . "#252525")
		 (220 . "#171717")
		 (240 . "#171717")
		 (260 . "#171717")
		 (280 . "#0E0E0E")
		 (300 . "#0E0E0E")
		 (320 . "#0E0E0E")
		 (340 . "#090909")
		 (360 . "#090909"))))
 '(vc-annotate-very-old-color "#3C3C3C")
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Useful snippet to print startup time
(unless noninteractive
	(let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
		(message "Loading %s...done (%.3fs)" load-file-name elapsed))

	(add-hook 'after-init-hook
						`(lambda ()
							 (let ((elapsed (float-time (time-subtract (current-time)
																												 emacs-start-time))))
								 (message "Loading %s...done (%.3fs) [after-init]"
													,load-file-name elapsed)))
						t))

(provide 'init)

;;; init.el ends here
