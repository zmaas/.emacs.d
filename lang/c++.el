;;; C++-Tools -- Summary:
;;; Commentary:
;;; configuration of C++ editing packages for Emacs
;;; generated by Zach Maas

;;; Code:

;; Add Irony
(use-package irony
	:ensure t
	:diminish irony-mode
	:config
	(add-hook 'c++-mode-hook 'irony-mode)
	(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package ggtags
	:ensure t
	:diminish ggtags-mode
	:config
	(add-hook 'c-mode-common-hook
						(lambda ()
							(when (derived-mode-p 'c-mode 'c++-mode)
								(ggtags-mode 1)))))

(use-package function-args
	:ensure t
	:config
	(fa-config-default))

;; Semantic mode for easier code completion
(use-package semantic
	:init
	(setq semantic-default-submodes
				'(;; Perform semantic actions during idle time
					global-semantic-idle-scheduler-mode
					;; Use a database of parsed tags
					global-semanticdb-minor-mode
					;; Decorate buffers with additional semantic information
					global-semantic-decoration-mode
					;; Highlight the name of the function you're currently in
					global-semantic-highlight-func-mode
					;; Generate a summary of the current tag when idle
					global-semantic-idle-summary-mode))
	:config
	(add-hook 'c++-mode-hook #'semantic-mode)
	(add-hook 'c-mode-hook #'semantic-mode))

;; special per-mode keybindings for C++
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'c++-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ll" '(multi-compile-run :which-key "compile")
 "ls" '(fa-show :which-key "show details")
 "lj" '(moo-jump-local :which-key "jump!")
 "lc" '(moo-complete :which-key "complete"))

;; c++-tools.el ends here
