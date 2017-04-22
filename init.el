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
(desktop-save-mode t)
(savehist-mode t)

;;; Make sure we have use-package
(unless (package-installed-p 'use-package)
	(package-install 'use-package))
(require 'use-package)

(use-package auto-compile
	:config
	(auto-compile-on-save-mode)
	(auto-compile-on-load-mode))

(setq load-prefer-newer t)

(use-package auto-package-update
	:ensure t
	:defer t
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

(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline 11"))
(set-face-attribute 'default t :font "Source Code Pro for Powerline 11")
;; Default font should be adobe source code pro powerline

;; Load from init files
(load-file "~/.emacs.d/personal.el")
(load-file "~/.emacs.d/core/evil.el")
(load-file "~/.emacs.d/core/ivy.el")
(load-file "~/.emacs.d/core/hydras.el")
(load-file "~/.emacs.d/core/completions.el")
(load-file "~/.emacs.d/core/error-checks.el")
(load-file "~/.emacs.d/core/style-checks.el")
(load-file "~/.emacs.d/core/utils.el")

;; Theming configuration files
(load-file "~/.emacs.d/core/themes.el")
(load-file "~/.emacs.d/core/appearance.el")

;; Load language specific configurations
;; These are hooked in to only load on mode loading
;; Inspiration from spacemacs
(load-file "~/.emacs.d/modes/latex-tools.el")
(load-file "~/.emacs.d/modes/org-tools.el")
(load-file "~/.emacs.d/modes/lisp-tools.el")
(load-file "~/.emacs.d/modes/python-tools.el")

(daytime-theme)

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
 '(company-flx-mode t)
 '(custom-safe-themes
	 (quote
		("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(global-hl-line-mode t)
 '(package-selected-packages
	 (quote
		(evil-smartparens company-flx highlight-parentheses spaceline spacemacs-theme ibuffer-vc dumb-jump smex general clipmon magithub ivy-hydra ivy-bibtex zzz-to-char flyspell-correct-ivy counsel-projectile counsel markdown-mode+ auctex-latexmk company-math company-bibtex langtool eyebrowse rainbow-mode writegood-mode olivetti flyspell-correct redtick evil-org org-bullets sublimity telephone-line projectile auto-dim-other-buffers ace-window evil-escape highlight-thing golden-ratio sr-speedbar focus evil-magit pdf-tools crosshairs evil-quickscope hydra column-enforce-mode neotree ipython company-anaconda auto-virtualenv linum-relative company-quickhelp highlight-indent-guides indent-guide company-jedi whitespace-cleanup-mode which-key visual-regexp use-package symon smartparens slime-company rainbow-delimiters powerline-evil magit latex-preview-pane highlight-tail highlight-symbol highlight-numbers flycheck-pos-tip fancy-narrow expand-region evil-vimish-fold evil-god-state evil-avy evil-anzu color-identifiers-mode auto-package-update auto-highlight-symbol auto-compile aggressive-indent ace-popup-menu)))
 '(safe-local-variable-values (quote ((o-byte-compile . t))))
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
