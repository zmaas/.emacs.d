;;; Hydra-Tools -- Summary:
;;; Commentary:
;; configuration of the Hydra for Emacs
;;; generated by Zach Maas

;;; Code:

;; IN PROGRESS - Behold the Mighty Hydra! Dynamic keybinds that stick around
(use-package hydra
	:ensure t
	:defer t)

;; HYDRAS

;; A hydra for org hot expansion of templates.
(defhydra hydra-org-template (:color blue :hint nil)
  "
_c_enter  _q_uote    _L_aTeX:
_l_atex   _e_xample  _i_ndex:
_a_scii   _v_erse    _I_NCLUDE:
_s_rc     ^ ^        _H_TML:
_h_tml    ^ ^        _A_SCII:
"
  ("s" (hot-expand "<s"))
  ("e" (hot-expand "<e"))
  ("q" (hot-expand "<q"))
  ("v" (hot-expand "<v"))
  ("c" (hot-expand "<c"))
  ("l" (hot-expand "<l"))
  ("h" (hot-expand "<h"))
  ("a" (hot-expand "<a"))
  ("L" (hot-expand "<L"))
  ("i" (hot-expand "<i"))
  ("I" (hot-expand "<I"))
  ("H" (hot-expand "<H"))
  ("A" (hot-expand "<A"))
  ("<" self-insert-command "ins")
  ("o" nil "quit"))

(defun hot-expand (str)
  "Expand org template."
  (insert str)
  (org-try-structure-completion))

;; Need to re-implement - hydra for eyebrowse
(defhydra eyebrowse-hydra ()
	"A Hydra providing config for eyebrowse evil bindings"
	("h" eyebrowse-next-window-config "Next window")
	("l" eyebrowse-prev-window-config "Previous window")
	("w" eyebrowse-last-window-config "Last window")
	("x" eyebrowse-close-window-config "Last window")
	("0" eyebrowse-switch-to-window-config-0 "Window 0")
	("1" eyebrowse-switch-to-window-config-1 "Window 1")
	("2" eyebrowse-switch-to-window-config-2 "Window 2")
	("3" eyebrowse-switch-to-window-config-3 "Window 3")
	("4" eyebrowse-switch-to-window-config-4 "Window 4"))

;;; zm-hydras.el ends here
