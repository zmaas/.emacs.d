;;; Popups -- Summary:
;;; Commentary:
;; configuration of popups and management for Emacs
;;; generated by Zach Maas

;;; Code:

;; Shackle manages popups aggressively
;; This is the most important item here
(use-package shackle
	:ensure t
	:init
	(add-hook 'after-init-hook 'shackle-mode)
	(setq shackle-lighter ""
				shackle-select-reused-windows t ; default nil
				shackle-default-alignment 'below ; default below
				shackle-default-size 0.4) ; default 0.5
	(setq shackle-rules
				'(("*undo-tree*" :size 0.25 :align right)
					("*Help*" :select t :other t)
          ("*Completions*" :size 0.3 :align t)
					("*Messages*" :select nil :other t)
					("*compile pdf-tools*" :select nil :ignore t)
					("*eww*" :select t :popup t :align below)
					("*Flycheck errors*" :other t :popup t :select t)
					("*Synonyms List*" :other t :select t)
          ("*quickrun*" :size 0.5 :align right)
					("*compilation*" :select t)
					("*golint*" :select t)
					("\\`\\*e?shell" :regexp t :popup t)
					("\\`\\*e?shell" :regexp t :frame t)
          (magit-status-mode :select t :inhibit-window-quit t :same t)
					(magit-log-mode :select t :size 0.5 :inhibit-window-quit t)
					(magit-diff-mode :inhibit-window-quit t :size 0.5 :align right)
					("\\`\\*output.*?\\*\\'" :regexp t :size 0.4)
          ("^\\*"  :regexp t :noselect t)
          ("^ \\*" :regexp t :noselect t)
					(shackle-default-rule '(:select t))))
	:config
	(add-hook 'after-init-hook 'shackle-mode))

;; Save window changes as we make them
(add-hook 'after-init-hook #'winner-mode)

;; Enable undo-tree mode globally
(use-package undo-tree
	:ensure	t
	:diminish undo-tree-mode
	:config
	(setq undo-tree-visualizer-timestamps t)
	(setq undo-tree-visualizer-diff t)
	(setq evil-want-fine-undo 'fine)
	(global-undo-tree-mode t))

;; Ranger is a vimish file-manager
(use-package ranger
	:ensure t
	:config
	(setq ranger-show-dotfiles t
				ranger-show-hidden t
				ranger-dont-show-binary t
				ranger-max-preview-size 10
				ranger-cleanup-on-disable t
				ranger-cleanup-eagerly t)
	(ranger-override-dired-mode t))

;; Better tree navigation of buffers
(use-package imenu-list
	:ensure t
	:config
	(setq imenu-auto-rescan t))

(use-package treemacs
	:ensure t
	:init
	(use-package treemacs-evil
		:ensure t)
	(use-package treemacs-projectile
		:ensure t)
	:config
	(setq treemacs-follow-after-init          t
				treemacs-width                      25
				treemacs-indentation                2
				treemacs-git-integration            t
				treemacs-collapse-dirs              3
				treemacs-silent-refresh             nil
				treemacs-change-root-without-asking nil
				treemacs-sorting                    'alphabetic-desc
				treemacs-show-hidden-files          t
				treemacs-never-persist              nil
				treemacs-is-never-other-window      nil
				treemacs-goto-tag-strategy          'refetch-index)

	(treemacs-follow-mode t)
	(treemacs-filewatch-mode t))

(use-package all-the-icons
	:ensure t
	;; Make sure to run all-the-icons-install-fonts
	)

;; popups.el ends here
