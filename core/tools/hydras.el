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

;; Easily navigate git-gutter hunks
(defhydra ono-git-gutter-nav (:color blue)
	"
_j_next _s_tats
_k_prev	_d_iff
" ("j" git-gutter:next-hunk "next")
("k" git-gutter:previous-hunk "prev")
("s" git-gutter:statistic "stats")
("d" magit-diff-buffer-file "diff")
("q" nil "quit"))


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

;;; zm-hydras.el ends here