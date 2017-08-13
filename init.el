;https://github.com/zmaas/.emacs.d;; package --- Summary
;;; Commentary:
;;; Emacs configuration file - generated by Zach Maas for Emacs 25.2
;;; Configured for use on Linux, vc using git
;;;
;;; TODO:
;;; finish python development mode
;;; implement keybinds for commenting and more into leader mode
;;; General optimizations
;;; compile on frameswitch
;;; projectile mode and comment assists

;;; Code:

;; Setup Garbage Collection Threshold for Speed
;; (setq gc-cons-threshold 100000000)

;; Start timer for startup
(defconst emacs-start-time (current-time))

;; Configure package archives
(setq package-archives '(
												 ("gnu" . "http://elpa.gnu.org/packages/")
												 ("org" . "http://orgmode.org/elpa/")
												 ("marmalade" . "http://marmalade-repo.org/packages/")
												 ("melpa" . "http://melpa.org/packages/")))

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
	(auto-compile-on-save-mode t)
	(auto-compile-on-load-mode t))

(setq load-prefer-newer t)

;; Keep everything up to date
(use-package auto-package-update
	:ensure t
	:config
	(auto-package-update-maybe))

;; No splash screen
(require 'diminish)

;; Set reasonable defaults for startup
(setq inhibit-startup-message t)
(setq-default tab-width 2)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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

;; Load various app configurations
(load-file "~/.emacs.d/apps/mail.el")
(load-file "~/.emacs.d/apps/irc.el")


;; Theming configuration files
(load-file "~/.emacs.d/core/themes.el")
(load-file "~/.emacs.d/core/appearance.el")

;; Load language specific configurations
;; Inspiration from spacemacs
(load-file "~/.emacs.d/modes/latex-tools.el")
(load-file "~/.emacs.d/modes/org-tools.el")
(load-file "~/.emacs.d/modes/lisp-tools.el")
(load-file "~/.emacs.d/modes/clojure-tools.el")
(load-file "~/.emacs.d/modes/python-tools.el")
(load-file "~/.emacs.d/modes/go-tools.el")

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
		("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "2cf7f9d1d8e4d735ba53facdc3c6f3271086b6906c4165b12e4fd8e3865469a6" "7a6bc9de067a7a0aa00272812d45087eec02c3befdf2b54c291578210ce7baca" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-avy-mode nil)
 '(evil-snipe-mode t)
 '(fci-rule-color "#383838")
 '(global-hl-line-mode t)
 '(minimap-mode nil)
 '(package-selected-packages
	 (quote
		(circe tiny auto-yasnippet quickrun dashboard moe-theme geiser slime yasnippet evil-mu4e org-plus-contrib persp-mode spaceline-all-the-icons fireplace evil-multiedit plan9-theme shackle all-the-icons nlinum-relative git-gutter-fringe ranger company-go go-mode interleave cider evil-snipe evil-goggles cyberpunk-theme evil-smartparens company-flx highlight-parentheses spaceline spacemacs-theme ibuffer-vc dumb-jump smex general clipmon ivy-hydra ivy-bibtex zzz-to-char flyspell-correct-ivy counsel-projectile counsel markdown-mode+ auctex-latexmk company-math company-bibtex langtool eyebrowse rainbow-mode writegood-mode olivetti flyspell-correct redtick evil-org org-bullets sublimity telephone-line projectile auto-dim-other-buffers ace-window evil-escape highlight-thing golden-ratio sr-speedbar focus evil-magit pdf-tools crosshairs hydra column-enforce-mode neotree ipython company-anaconda auto-virtualenv linum-relative company-quickhelp highlight-indent-guides indent-guide company-jedi whitespace-cleanup-mode which-key visual-regexp use-package symon smartparens slime-company rainbow-delimiters powerline-evil magit latex-preview-pane highlight-tail highlight-symbol highlight-numbers flycheck-pos-tip fancy-narrow expand-region evil-vimish-fold evil-avy evil-anzu color-identifiers-mode auto-package-update auto-highlight-symbol auto-compile aggressive-indent ace-popup-menu)))
 '(safe-local-variable-values (quote ((o-byte-compile . t))))
 '(send-mail-function (quote smtpmail-send-it))
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
