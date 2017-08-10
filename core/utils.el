;;; Emacs-Utilities -- Summary:
;;; Commentary:
;; configuration of utility packages for Emacs
;;; generated by Zach Maas
;;; TODO - Setup projectile for project management

;;; Code:

;; look at those buffers - ibuffer work
(global-set-key (kbd "C-x C-b") 'ibuffer)
(use-package ibuffer-vc
  :ensure t
	:config
	(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-vc-set-filter-groups-by-vc-root)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic)))))

(use-package ranger
	:ensure t
	:config
	(ranger-override-dired-mode t))

;; eyebrowse - allows us to have more than one working window
(use-package eyebrowse
	:ensure t
	:config
	(add-hook 'after-init-hook #'eyebrowse-mode))

(use-package persp-mode
	:ensure t
	:diminish persp-mode
	:config
  (setq wg-morph-on nil) ;; switch off animation
  (setq persp-autokill-buffer-on-remove 'kill-weak)
  (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

;; expands selected regions
(use-package expand-region
	:ensure t
	:config
	(global-set-key (kbd "C-=") 'er/expand-region))

;; give our buffers unique names
(use-package uniquify
	:config
	(setq uniquify-buffer-name-style 'forward))

;; magit - super great git porcelain for version control
(use-package magit
	:ensure t
	:defer t
	:config
	(use-package evil-magit
		:ensure t))

;; projectile - easy navigation inside projects
(use-package projectile
	:ensure t
	:diminish projectile-mode
	:config
	(add-hook 'after-init-hook #'projectile-mode)
	(setq projectile-completion-system 'ivy))

(use-package shackle
	:ensure t
	:init
	(add-hook 'after-init-hook 'shackle-mode)
	(setq shackle-lighter "")
  (setq shackle-select-reused-windows nil) ; default nil
  (setq shackle-default-alignment 'below) ; default below
  (setq shackle-default-size 0.4) ; default 0.5
	(setq shackle-rules
				'(("*undo-tree*" :size 0.25 :align right)
					("*Help*" :select t :inhibit-window-quit t :other t)
          ("*Completions*" :size 0.3 :align t )
					("*Messages*" :select nil :inhibit-window-quit t :other t )
          (magit-status-mode :select t :inhibit-window-quit t :same t)
					(magit-log-mode :select t :inhibit-window-quit t :same t)
					("\\`\\*output.*?\\*\\'" :regexp t :size 0.4)
					(shackle-default-rule '(:select t))
					))
	:config
	(add-hook 'after-init-hook 'shackle-mode)
	)

;; clipmon - add system clipboard contents to kill ring
(use-package clipmon
	:ensure t
	:diminish clipmon-mode
	:config
	(add-hook 'after-init-hook #'clipmon-mode)
	(add-to-list 'savehist-additional-variables 'kill-ring)
	(savehist-mode t))

;; tramp - for remote file access
(use-package tramp
	:ensure t
	:defer t)

;; neotree - file tree like VIM's nerdtree
(use-package neotree
	:ensure t
	:init
	(use-package all-the-icons
		:ensure t
		;; Make sure to run all-the-icons-install-fonts
		)
	:config
	(add-hook 'neotree-mode-hook
						(lambda ()
							(define-key evil-normal-state-local-map (kbd "h") 'neotree-select-up-node)
							(define-key evil-normal-state-local-map (kbd "l") 'neotree-enter)
							(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
							(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
							(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
							(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
	(setq neo-smart-open t)
	(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
	(global-set-key [f8] 'neotree-toggle))

;; Clunky way to do sudoedit on linux - bound to C-x C-r
(defun sudo-edit (&optional arg)
	(interactive "P")
	(if (or arg (not buffer-file-name))
			(find-file (concat "/sudo:root@localhost:"
												 (ido-read-file-name "Find file(as root): ")))
		(find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(global-set-key (kbd "C-x C-r") 'sudo-edit)

;; Enable undo-tree mode globally
(use-package undo-tree
	:ensure t
	:diminish undo-tree-mode
	:config
	(setq undo-tree-visualizer-timestamps t)
	(setq undo-tree-visualizer-diff t)
	(global-undo-tree-mode t))

;; visual-regexp - gives us visual indication of regexps in the buffer as we make them
(use-package visual-regexp
	:ensure t
	:defer t
	:init
	:config
	(define-key global-map (kbd "C-c r") 'vr/replace)
	(define-key global-map (kbd "C-c q") 'vr/query-replace))

; go to characters quickly and easily
(global-set-key (kbd "C-;") 'avy-goto-char)

;; zap to char - lets us kill all text up to the next instance of a character
(use-package zzz-to-char
	:ensure t
	:defer t
	:config
	(global-set-key (kbd "M-z") #'zzz-to-char))

;; use the arrowkeys to move buffers - need a better solution using VIM keybinds
(when (fboundp 'windmove-default-keybindings)
	(windmove-default-keybindings))

(use-package dumb-jump
	:ensure t)

(use-package ace-window
	:ensure t)

;; sometimes we forget keybinds - this gives us a reminder
(use-package which-key
	:ensure t
	:diminish which-key-mode
	:config
	(which-key-setup-side-window-bottom)
	(setq which-key-idle-delay 0.5)
	(which-key-mode t))

;;; zm-utils.el ends here
