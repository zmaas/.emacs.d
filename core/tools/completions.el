;;; Completion-Tools -- Summary:
;;; Commentary:
;;; configuration of completions for Emacs
;;; generated by Zach Maas

;;; comment

;; company - easy auto-completion of code for all modes and documentation integration
(use-package company
	:ensure t
	:defer t
	:init
	(use-package company-flx
		:ensure t
		:config
		(with-eval-after-load 'company
			(company-flx-mode t)))
	(use-package company-statistics
		:ensure t
		:diminish company-statistics-mode
		:config
		(add-hook 'after-init-hook #'company-statistics-mode))
	(use-package company-quickhelp
		:ensure t
		:config
		(company-quickhelp-mode 1)
		(setq company-quickhelp-delay 1))
	(use-package company-dabbrev
		:init
		(setq company-dabbrev-ignore-case nil
					;; don't downcase dabbrev suggestions
					company-dabbrev-code-other-buffers t
					company-tooltip-align-annotations t
					company-dabbrev-downcase nil))
	(use-package company-dabbrev-code
		:init
		(setq company-dabbrev-code-modes t
					company-dabbrev-code-ignore-case nil))
	:diminish company-mode
	:config
	(add-hook 'after-init-hook 'global-company-mode)
	;; Make it work more like	Vim's YCM, TAB cycling
	(company-tng-configure-default)
	;; More convenient bindings
	(setq company-minimum-prefix-length 3
				company-tooltip-limit 10
				company-idle-delay 0.5
				company-show-numbers t
				company-require-match 'never
				company-selection-wrap-around t
				company-tooltip-align-annotations t)

	(general-define-key
	 :keymaps 'company-active-map
	 "M-o" 'counsel-company
	 "M-o" 'counsel-company
	 "RET" 'company-complete-selection))

(use-package dabbrev
	:init
  (setq dabbrev-case-fold-search nil))

;; hippie-expand: better builtin expansion
(use-package hippie-exp
  :init
  ;; force hippie-expand completions to be case-sensitive
  (defadvice hippie-expand (around hippie-expand-case-fold activate)
    "Try to do case-sensitive matching (not effective with all functions)."
    (let ((case-fold-search nil))
      ad-do-it))

  :config
  (setq hippie-expand-try-functions-list
        '(;; Try to expand word "dynamically", searching the current buffer.
					try-expand-dabbrev
					try-expand-dabbrev-all-buffers
					try-expand-dabbrev-from-kill
          try-expand-all-abbrevs
					try-complete-file-name-partially
					try-complete-file-name
          try-expand-list
          try-expand-line)))

(use-package yasnippet
	:ensure t
	:diminish yas-global-mode yas-minor-mode
	:config
	(add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippet-snippets/")
	(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
	(defvar company-mode/enable-yas t
		"Enable yasnippet for all backends.")

	(defun company-mode/backend-with-yas (backend)
		(if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
				backend
			(append (if (consp backend) backend (list backend))
							'(:with company-yasnippet))))

	(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
	(yas-global-mode t))

;; auto-yasnippet, removing friction for repetitive tasks
(use-package auto-yasnippet
	:ensure t)

;; Tiny, for fast expansion of linear ranges
(use-package tiny
	:ensure t
	:config
	(tiny-setup-default))

;;; zm-completions.el ends here
