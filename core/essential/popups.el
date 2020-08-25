;;; Popups -- Summary:
;;; Commentary:
;; configuration of popups and management for Emacs
;;; generated by Zach Maas

;;; Code:

;; Shackle manages popups aggressively
;; This is the most important item here
(use-package shackle
	:straight t
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
					("*Ilist*" :popup t :align right :size 0.2)
					("*prodigy*" :select t :popup t)
					("*Flycheck errors*" :other t :popup t :select t
					 :align below :size 0.2)
					("*Synonyms List*" :other t :select t)
          ("*quickrun*" :popup t :select t)
          ("*evil-jumps*" :same t)
          ("*evil-marks*" :same t)
					("*compilation*" :popup t :select t)
					("*golint*" :size 0.5 :noselect t)
					("\\`\\*e?shell" :regexp t :popup t)
					("\\`\\*e?shell" :regexp t :frame t)
          (magit-status-mode :select t :inhibit-window-quit t :same t)
					(magit-log-mode :select t :size 0.5 :inhibit-window-quit t)
					(magit-diff-mode :size 0.5 :inhibit-window-quit t)
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
	:straight	t
	:diminish undo-tree-mode
	:config
	(general-define-key
	 :states 'motion
	 :keymaps '(undo-tree-visualizer-mode-map
							undo-tree-visualizer-selection-mode-map)
	 "k" 'undo-tree-visualize-undo
	 "j" 'undo-tree-visualize-redo
	 "h" 'undo-tree-visualize-switch-branch-right
	 "l" 'undo-tree-visualize-switch-branch-left
	 "t" 'undo-tree-visualizer-toggle-timestamps)
	(setq undo-tree-visualizer-timestamps t)
	(setq undo-tree-visualizer-diff t)
	(global-undo-tree-mode t))

;; Ranger is a vimish file-manager
;; We bind it to -,	like dirvish.vim
(use-package ranger
	:disabled t
	:straight t
	:config
	(setq ranger-show-dotfiles t
				ranger-show-hidden t
				ranger-dont-show-binary t
				ranger-max-preview-size 10
				ranger-cleanup-on-disable t
				ranger-cleanup-eagerly t)
	(ranger-override-dired-mode nil))

;; Small dired improvements
(use-package dired+
	:straight (dired+ :host github :repo "emacsmirror/dired-plus")
	:config
	(diredp-toggle-find-file-reuse-dir 1))

;; Install everything from dired-hacks
(mapc (lambda (x) (use-package x
								:straight (dired-hacks
													 :host github
													 :repo "Fuco1/dired-hacks")))
		 '(dired-narrow dired-open dired-rainbow dired-ranger))

(setq dired-listing-switches "-alhv")
(setq dired-dwim-target t)
(setq dired-clean-up-buffers-too t)
(add-hook 'dired-mode-hook #'auto-revert-mode)
(defun ono/dired-open-current-dir ()
	"Opens the current directory in dired."
	(interactive)
	(dired "."))
(general-define-key
 :states 'normal
 :keymaps '(dired-mode-map)
 "-" 'dired-up-directory
 "h" 'dired-up-directory
 "l" 'dired-find-alternate-file)

;; Better tree navigation of buffers
(use-package imenu-list
	:straight t
	:config
	(setq imenu-auto-rescan t))

;; (use-package treemacs
;; 	:straight t
;; 	:init
;; 	(use-package treemacs-evil
;; 		:straight t)
;; 	(use-package treemacs-projectile
;; 		:straight t)
;; 	:config
;; 	(setq treemacs-follow-after-init          t
;; 				treemacs-width                      25
;; 				treemacs-indentation                2
;; 				treemacs-git-integration            t
;; 				treemacs-collapse-dirs              3
;; 				treemacs-silent-refresh             nil
;; 				treemacs-change-root-without-asking nil
;; 				treemacs-sorting                    'alphabetic-desc
;; 				treemacs-show-hidden-files          t
;; 				treemacs-never-persist              nil
;; 				treemacs-is-never-other-window      nil
;; 				treemacs-goto-tag-strategy          'refetch-index)

;; 	(treemacs-follow-mode t)
;; 	(treemacs-filewatch-mode t))

(use-package all-the-icons
	:straight t
	;; Make sure to run all-the-icons-install-fonts
	)

;; popups.el ends here
