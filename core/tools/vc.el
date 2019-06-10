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
		:ensure t)
	(use-package magit-todos
		:disabled t
		:after magit
		:init
		(use-package a
			:ensure t)
		:ensure t
		:config
		(add-hook 'magit-mode-hook 'magit-todos-mode))
	(use-package gist
		:ensure t))

(use-package magithub
	:ensure t
	:config
	(magithub-feature-autoinject t)
	(setq magithub-clone-default-directory "~/builds/"))

(use-package forge
	:ensure t)

;; (use-package git-timemachine
;; 	:ensure t
;; 	:config
;; 	(eval-after-load 'git-timemachine
;; 		'(progn
;; 			 (evil-make-overriding-map git-timemachine-mode-map 'normal)
;; 			 ;; force update evil keymaps after git-timemachine-mode loaded
;; 			 (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))))

;; (use-package smeargle
;; 	:ensure t)

(use-package evil-ediff
	:ensure t
	:config
	(setq ediff-window-setup-function 'ediff-setup-windows-plain
				ediff-split-window-function 'split-window-horizontally
				ediff-diff-options "-w"))

;; projectile - easy navigation inside projects
(use-package projectile
	:ensure t
	:diminish projectile-mode
	:config
	(add-hook 'after-init-hook #'projectile-mode)
  (add-to-list 'projectile-globally-ignored-files ".tern-port")
  (add-to-list 'projectile-globally-ignored-files "GTAGS")
  (add-to-list 'projectile-globally-ignored-files "GPATH")
  (add-to-list 'projectile-globally-ignored-files "GRTAGS")
  (add-to-list 'projectile-globally-ignored-files "GSYMS")
  (add-to-list 'projectile-globally-ignored-files ".DS_Store")
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
