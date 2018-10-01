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

(defun ono-org/open-organizer ()
	"Opens organizer.org"
	(interactive)
	(find-file "~/Dropbox/Org/organizer.org"))
(defun ono-org/open-someday ()
	"Opens someday.org"
	(interactive)
	(find-file "~/Dropbox/Org/someday.org"))
(defun ono-org/open-knowledge-base ()
	"Opens knowledge_base.org"
	(interactive)
	(find-file "~/Dropbox/Org/knowledge_base.org"))
(defun ono-org/open-projects ()
	"Opens projects.org."
	(interactive)
	(find-file "~/Dropbox/Org/projects.org"))

(defhydra ono-org/gtd-nav (:color blue)
	"
_o_rganizer _s_omeday
_k_nowledge _p_rojects
" ("o" ono-org/open-organizer "organizer")
	("s" ono-org/open-someday "someday")
	("k" ono-org/open-knowledge-base "knowledge-base")
	("p" ono-org/open-projects "projects")
	("q" nil "quit"))

(defhydra ono-smerge
  (:color red :hint nil
          :pre (smerge-mode 1))
  "
^Move^ ^Keep^ ^Diff^ ^Pair^
------------------------------------------------------
_n_ext _b_ase _R_efine _<_: base-mine
_p_rev _m_ine _E_diff _=_: mine-other
^ ^ _o_ther _C_ombine _>_: base-other
^ ^ _a_ll _r_esolve
_q_uit _RET_: current
"
  ("RET" smerge-keep-current)
  ("C" smerge-combine-with-next)
  ("E" smerge-ediff)
  ("R" smerge-refine)
  ("a" smerge-keep-all)
  ("b" smerge-keep-base)
  ("m" smerge-keep-mine)
  ("n" smerge-next)
  ("o" smerge-keep-other)
  ("p" smerge-prev)
  ("r" smerge-resolve)
  ("<" smerge-diff-base-mine)
  ("=" smerge-diff-mine-other)
  (">" smerge-diff-base-other)
	("q" nil :color blue))

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
