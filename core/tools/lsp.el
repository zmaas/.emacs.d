;;; Language Server Protocol Support -- Summary:
;;; Commentary:
;;; configuration of lsp support for Emacs
;;; generated by Zach Maas

;;; Code:

;; Use LSP
(use-package lsp-mode
	:straight t
	:init
	(use-package lsp-ui
		:straight t
		:config
		;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
		(setq lsp-ui-sideline-show-diagnostics nil
					lsp-ui-sideline-show-hover nil
					lsp-ui-sideline-show-symbol nil
					lsp-ui-sideline-show-code-actions nil
					lsp-ui-doc-enable nil
					lsp-ui-flycheck-enable t))
	(use-package company-lsp
		:straight t
		:config
		(setq company-lsp-cache-candidates 'auto
					company-lsp-async t
					company-lsp-enable-recompletion t)
		(push 'company-lsp company-backends))
	(setq lsp-disabled-clients '((python-mode . pyls)))
	:config
	(setq read-process-output-max (* 8 1024 1024)) ;; help lsp responsiveness
	(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
	(setq lsp-diagnostics-provider 'flycheck
				lsp-prefer-capf t)
	)

;; Also use the DAP extensions for certain languages
(use-package dap-mode
	:straight t)

;;; lsp.el ends here
