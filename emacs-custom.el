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
 '(auto-compile-on-save-mode t)
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
		(plan9-theme package-safe-delete darktooth-theme visual-fill-column imenu-anywhere company-auctex intero multi-compile evil-lispy auto-save-buffers-enhanced vlf bookmark+ shrink-whitespace ws-butler editorconfig synosaurus smart-tab company-statistics eshell-prompt-extras keychain-environment ess yaml-mode eziam-theme evil-nerd-commenter evil-nderd-commenter virtualenvwrapper anaconda counsel-dash latex-extra all-the-icons-ivy tao-theme smooth-scrolling ggtags function-args markdown-mode irony paradox circe tiny auto-yasnippet quickrun dashboard moe-theme geiser slime yasnippet evil-mu4e org-plus-contrib persp-mode fireplace evil-multiedit shackle all-the-icons nlinum-relative git-gutter-fringe ranger company-go go-mode interleave cider evil-snipe evil-goggles cyberpunk-theme evil-smartparens company-flx highlight-parentheses spaceline spacemacs-theme ibuffer-vc dumb-jump smex general clipmon ivy-hydra ivy-bibtex zzz-to-char flyspell-correct-ivy counsel-projectile counsel markdown-mode+ auctex-latexmk company-math company-bibtex langtool eyebrowse rainbow-mode writegood-mode olivetti flyspell-correct redtick evil-org org-bullets sublimity telephone-line projectile auto-dim-other-buffers ace-window evil-escape highlight-thing sr-speedbar focus evil-magit pdf-tools crosshairs hydra column-enforce-mode neotree ipython company-anaconda auto-virtualenv linum-relative company-quickhelp highlight-indent-guides indent-guide company-jedi whitespace-cleanup-mode which-key visual-regexp use-package symon smartparens slime-company rainbow-delimiters powerline-evil magit latex-preview-pane highlight-tail highlight-symbol highlight-numbers flycheck-pos-tip fancy-narrow expand-region evil-vimish-fold evil-avy evil-anzu color-identifiers-mode auto-package-update auto-highlight-symbol auto-compile aggressive-indent ace-popup-menu)))
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
 '(window-numbering-mode nil)
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
