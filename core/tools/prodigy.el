;;; Prodigy -- Summary:
;;; Commentary:
;;; Configuration of Prodigy for Emacs
;;; generated by Zach Maas

;;; Code:

(use-package prodigy
	:straight t)

(prodigy-define-service
  :name "abstractlambda.com develop"
  :command "hugo"
	:args	'("serve")
	:ready-message "Press Ctrl+C to stop"
  :cwd "~/builds/zmaas.github.io/hugo"
  :port	1313
  :tags '(personal golang)
	:stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "zachmaas.com develop"
  :command "npx"
	:args	'("gatsby" "develop")
	:ready-message "info bootstrap finished"
  :cwd "~/builds/portfolio"
  :port	8000
  :tags '(personal node)
	:stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

(general-define-key
 :states '(normal visual insert emacs)
 :keymaps	'prodigy-mode-map
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "l" '(:ignore t :which-key "manage")
 "lq" '(quit-window :which-key "quit")
 "ls" '(prodigy-start :which-key "start")
 "lS" '(prodigy-stop :which-key "open")
 "lm" '(prodigy-mark :which-key "mark")
 "lM" '(prodigy-mark-all :which-key "markall")
 "lu" '(prodigy-unmark :which-key "unmark")
 "lU" '(prodigy-unmark-all :which-key "unmark all"))

;; prodigy.el ends here
