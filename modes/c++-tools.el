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

;; special per-mode keybindings for C++
(general-define-key
 :states '(normal visual insert emacs)
 :keymaps 'c++-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "layer")
 "ll" '(compile :which-key "compile")
 "ls" '(fa-show :which-key "show details")
 "lj" '(moo-jump-local :which-key "jump!")
 "lc" '(moo-complete :which-key "complete"))

;; c++-tools.el ends here