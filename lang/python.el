;;; Python-Tools -- Summary:
;;; Commentary:
;;; configuration of python editing packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Python Development Setup
;; IN PROGRESS - anaconda is good so far, some lag that needs to be figured out
(use-package anaconda-mode
	:ensure t
	:diminish	anaconda-mode
	:init
	(use-package virtualenvwrapper
		:ensure t
		:diminish	""
		:config
		(venv-initialize-interactive-shells)
		(venv-initialize-eshell))
	:config
	(add-hook 'python-mode-hook #'anaconda-mode))

(use-package company-anaconda
	:ensure t
	:config
	(setq python-shell-interpreter "python3"
				python-shell-interpreter-args "")
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt --no-color-info"
          python-shell-prompt-regexp "In \\[[0-9]+\\]: "
          python-shell-prompt-block-regexp "\\.\\.\\.\\.: "
          python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
          python-shell-completion-setup-code
          "from IPython.core.completerlib import module_completion"
          python-shell-completion-string-code
          "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

	(eval-after-load "company"
		'(add-to-list 'company-backends 'company-anaconda))													
	(add-hook 'python-mode-hook 'anaconda-mode)
	(add-hook 'anaconda-mode-hook #'anaconda-eldoc-mode)
	(add-hook 'python-mode-hook																										
						(lambda ()																																
							(set (make-local-variable 'company-backends)											
									 '((company-anaconda company-dabbrev-code company-yasnippet))))))

;; Sphinx-doc -- Automagically add docstrings to python	functions
(use-package sphinx-doc
	:ensure t
	:diminish	""
	:config
	(add-hook 'python-mode-hook (lambda  () (sphinx-doc-mode t))))

;; Yapfify -- Better formatter
(use-package yapfify
	:ensure t)

;; EIN - Emacs Ipython Notebooks
(use-package ein
	:ensure t)

;; Mode	keybinds
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps '(python-mode-map inferior-python-mode-map)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "lr" '(run-python :which-key "python repl")
 "lf" '(yapfify-buffer :which-key "autoformat")
 "le" '(python-shell-send-buffer :which-key "eval buffer")
 "lE" '(python-shell-send-defun :which-key "eval defun")
 "ld" '(anaconda-mode-find-definitions :which-key "def")
 "lD" '(sphinx-doc :which-key "add docs")
 "l?" '(anaconda-mode-show-doc :which-key "docs?")
 "lv" '(venv-workon :which-key "venv-on")
 "lV" '(venv-deactivate :which-key "venv-off"))

;;; zm-python-tools.el ends here
