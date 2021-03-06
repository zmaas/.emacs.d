;;; C++-Tools -- Summary:
;;; Commentary:
;;; configuration of C++ editing packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Semantic -- The core	C++ editing
;; (use-package semantic
;; 	:disabled t
;; 	:straight t
;; 	:config
;; 	(global-semanticdb-minor-mode t)
;; 	(global-semantic-idle-scheduler-mode t)
;; 	(global-semantic-idle-summary-mode nil)
;; 	(semantic-mode t))

;; EXPERIMENTAL - cquery using lsp-mode
;; (defun cquery//enable ()
;;   (condition-case nil
;;       (lsp-cquery-enable)
;;     (user-error nil)))
;; (use-package cquery
;; 	:straight t
;; 	:commands lsp-cquery-enable
;; 	:config
;;   (setq cquery-executable "/usr/bin/cquery")
;; 	(setq cquery-sem-highlight-method 'font-lock)
;; 	(setq cquery-extra-init-params '(:index (:comments 2)
;; 																					:cacheFormat "msgpack"
;; 																					:completion (:detailedLabel t)))
;; 	(add-hook 'c-mode-common-hook #'cquery//enable))

;; Irony -- C++/C	Completion
;; (use-package irony
;; 	:straight t
;; 	:diminish irony-mode
;; 	:init
;; 	(use-package company-irony-c-headers
;; 		:straight t)
;; 	(use-package company-irony
;; 		:straight t
;; 		:config)
;; 	;; (use-package flycheck-irony
;; 	;; 	:straight t
;; 	;; 	:config
;; 	;; 	(eval-after-load 'flycheck
;; 	;; 		'(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
;; 	:config
;; 	(add-hook 'c++-mode-hook 'irony-mode)
;; 	(add-hook 'c-mode-hook 'irony-mode)
;; 	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; 	(add-hook 'c++-mode-hook
;; 						#'(lambda ()
;; 								(add-to-list
;; 								 'company-backends 'company-irony-c-headers 'company-irony 'company-gtags))))

;; ggtags -- Project tag navigation
(use-package ggtags
	:straight t
	:init
	(use-package counsel-gtags
		:straight t
		:diminish ""
		:config
		(add-hook 'c-mode-hook 'counsel-gtags-mode)
		(add-hook 'c++-mode-hook 'counsel-gtags-mode))
	:diminish ggtags-mode
	:config
	(add-hook 'c-mode-common-hook
						(lambda ()
							(when (derived-mode-p 'c-mode 'c++-mode)
								(ggtags-mode 1)))))

;; Fast	tag-based nav and completion (moo commands)
;; Specifically improves function	arg viewing
(use-package function-args
	:straight t
	:config
	(fa-config-default))

;; Autoformatter for code style
(use-package clang-format
	:straight t
	:config
	(setq clang-format-style "google"))

;; Style tips	for	modern c++
(use-package flycheck-clang-tidy
	:straight t
	:after flycheck
	:config
	'(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

;; Better static analysis
(use-package flycheck-clang-analyzer
	:straight t
	:after flycheck
  :config (flycheck-clang-analyzer-setup))

;; Automated disassembly of compiled files
(use-package disaster
	:straight t)

(add-hook 'c++-mode-hook #'lsp)

;; special per-mode keybindings for C++
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'c++-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ll" '(multi-compile-run :which-key "compile")
 "lo" '(moo-doxygen :which-key "doxygen")
 "lh" '(ff-get-other-file :which-key "header/source")
 "ld" '(counsel-gtags-find-definition :which-key "tag def")
 "lt" '(counsel-gtags-update-tags :which-key "update tags")
 "lD" '(disaster  :which-key "disaster")
 "ls" '(counsel-gtags-find-symbol :which-key "symbol")
 "lf" '(clang-format-buffer :which-key "format")
 "lS" '(fa-show :which-key "show details")
 "lj" '(moo-jump-local :which-key "jump!")
 "lc" '(moo-complete :which-key "complete"))

;; c++-tools.el ends here
