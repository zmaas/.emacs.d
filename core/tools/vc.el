;;; Version Control -- Summary:
;;; Commentary:
;; configuration of VC packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; magit - super great git porcelain for version control
(use-package magit
	:ensure t
	:config
	(use-package evil-magit
		:ensure t))

;; projectile - easy navigation inside projects
(use-package projectile
	:ensure t
	:diminish projectile-mode
	:config
	(add-hook 'after-init-hook #'projectile-mode)
	(setq projectile-completion-system 'ivy
				projectile-enable-caching (not noninteractive)
				projectile-indexing-method 'alien
				projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")
				projectile-globally-ignored-files '(".DS_Store" "Icon")))

;; Editorconfig, makes project styles easier
(use-package editorconfig
	:ensure t
	:diminish editorconfig-mode
	:config
	(add-hook 'after-init-hook #'editorconfig-mode))

;; special per-mode keybindings for	commit messages
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'with-editor-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "lc" '(with-editor-finish :which-key "Commit")
 "lk" '(with-editor-cancel :which-key "Abort"))

;; vc.el ends here