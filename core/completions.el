;;; Completion-Tools -- Summary:
;;; Commentary:
;;; configuration of completions for Emacs
;;; generated by Zach Maas

;;; Code:

;; company - easy auto-completion of code for all modes and documentation integration
(use-package company
	:ensure t
	:init
	(use-package company-flx
		:ensure t
		:config
		(with-eval-after-load 'company
			(company-flx-mode +1)))
	:diminish company-mode
	:config
	(add-hook 'after-init-hook 'global-company-mode)
	(setq company-minimum-prefix-length 2)
	(setq company-idle-delay 0.2)
	(define-key company-mode-map (kbd "C-:") 'counsel-company)
	(define-key company-active-map (kbd "C-:") 'counsel-company))

;; YAsnippet - snippets for code, with company integration
(use-package yasnippet
	:ensure t
	:defer t
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

;;; zm-completions.el ends here
