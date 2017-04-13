;;; Appearance-Configuration -- Summary:
;;; Commentary:
;;; configuration of appearance packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Make all symbols pretty
(global-prettify-symbols-mode t)

;; Don't use external dialog boxes
(setq use-dialog-box nil)

;; Configure visual line mode for text modes
(add-hook 'text-mode-hook #'visual-line-mode)

;; Show trailing whitespace
(setq-default show-trailing-whitespace t)

;; Show current line
(add-hook 'after-init-hook #'global-hl-line-mode)

;; Focus for automatic code narrowing
(use-package focus
	:ensure t
	:defer t)

;; olivetti is a tool for focused writing
(use-package olivetti
	:ensure t
	:defer t)

;; rainbow-mode, for hex codes
(use-package rainbow-mode
	:ensure t
	:diminish rainbow-mode
	:config
	(add-hook 'after-init-hook #'rainbow-mode))

;; Trying out telephone line instead of powerline
;(use-package telephone-line
;	:ensure t
;	:config
;	(setq telephone-line-lhs
;        '((evil   . (telephone-line-evil-tag-segment))
;          (accent . (telephone-line-vc-segment
;                     telephone-line-process-segment))
;          (nil    . (telephone-line-minor-mode-segment
;                     telephone-line-buffer-segment))))
;	(setq telephone-line-rhs
;        '((nil    . (telephone-line-misc-info-segment))
;          (accent . (telephone-line-major-mode-segment))
;          (evil   . (telephone-line-airline-position-segment))))
;	(setq telephone-line-primary-left-separator telephone-line-cubed-left)
;	(setq telephone-line-primary-right-separator telephone-line-cubed-right)
;	(setq telephone-line-secondary-left-separator telephone-line-cubed-hollow-left)
;	(setq telephone-line-secondary-right-separator telephone-line-cubed-hollow-right)
;	(telephone-line-mode t)
;	(column-number-mode t))

(use-package spaceline-config
  :ensure spaceline
	:init
  (setq powerline-default-separator 'bar)
	:config
	(spaceline-spacemacs-theme))

;; tiny system monitor, helpful when we spend all of our time here
(use-package symon
	:ensure t
	:config
	(add-hook 'after-init-hook 'symon-mode))
;; highlight symbols when we are over them - so pretty
(use-package highlight-thing
	:ensure t
	:diminish highlight-thing-mode
	:config
	(global-highlight-thing-mode t))

;; subtle lines to show our tab level in code
(use-package highlight-indent-guides
	:ensure t
	:diminish highlight-indent-guides-mode
	:config
	(setq highlight-indent-guides-method 'character)
	(add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

;; all code identifiers get pretty colors
(use-package color-identifiers-mode
	:ensure t
	:diminish color-identifiers-mode
	:config
	(add-hook 'after-init-hook 'global-color-identifiers-mode))

;; make our delimiters rainbows! much easier to see sexps
(use-package rainbow-delimiters
	:ensure t
	:diminish rainbow-delimiters-mode
	:config
	(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
	(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error))

;; highlights numbers, not that complicated
(use-package highlight-numbers
	:ensure t
	:diminish highlight-numbers-mode
	:config
	(add-hook 'prog-mode-hook #'highlight-numbers-mode)
	(add-hook 'prog-mode-hook #'show-paren-mode))

(use-package highlight-parentheses
  :ensure t
  :diminish highlight-parentheses-mode
	:config
	(add-hook 'prog-mode-hook #'highlight-parentheses-mode))

	;; make builtin popup menus use ace instead of the builtin option
		(use-package ace-popup-menu
		:ensure t
		:diminish ace-popup-menu-mode
		:config
		(add-hook 'after-init-hook #'ace-popup-menu-mode))

;; automatically dim other buffers
(use-package auto-dim-other-buffers
	:ensure t
	:diminish auto-dim-other-buffers-mode
	:config
	(add-hook 'after-init-hook #'auto-dim-other-buffers-mode)
	)

;; prettyify fonts
(setq font-lock-maximum-decoration t)

;; relative line numbers, makes it much easier to use evil features
(use-package linum-relative
	:ensure t
	:diminish linum-relative-mode
	:config
	(add-hook 'after-init-hook #'linum-relative-global-mode))

;;; zm-appearance.el ends here
