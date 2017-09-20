;; Tweak to make magit prettier
(require 'dash)

(defmacro pretty-magit (WORD ICON PROPS &optional NO-PROMPT?)
  "Replace sanitized WORD with ICON, PROPS and by default add to prompts."
  `(prog1
			 (add-to-list 'pretty-magit-alist
										(list (rx bow (group ,WORD (eval (if ,NO-PROMPT? "" ":"))))
													,ICON ',PROPS))
     (unless ,NO-PROMPT?
       (add-to-list 'pretty-magit-prompt (concat ,WORD ": ")))))

(setq pretty-magit-alist nil)
(setq pretty-magit-prompt nil)
(pretty-magit "Feature" ?\uf044 (:foreground "slate gray" :height 1.0))
(pretty-magit "Add"     ?\uf076 (:foreground "#375E97" :height 1.0))
(pretty-magit "Fix"     ?\uf091 (:foreground "#FB6542" :height 1.0))
(pretty-magit "Clean"   ?\uf0c4 (:foreground "#FFBB00" :height 1.0))
(pretty-magit "Docs"    ?\uf059 (:foreground "#3F681C" :height 1.0))
;; (pretty-magit "master"  ?\uf109 (:box nil :height 1.1) t)
;; (pretty-magit "origin"  ?\uf121 (:box nil :height 1.1) t)

(defun add-magit-faces ()
  "Add face properties and compose symbols for buffer from pretty-magit."
  (interactive)
  (with-silent-modifications
    (--each pretty-magit-alist
      (-let (((rgx icon props) it))
        (save-excursion
          (goto-char (point-min))
          (while (search-forward-regexp rgx nil t)
            (compose-region
             (match-beginning 1) (match-end 1) icon)
            (when props
              (add-face-text-property
               (match-beginning 1) (match-end 1) props))))))))

(advice-add 'magit-status :after 'add-magit-faces)
(advice-add 'magit-refresh-buffer :after 'add-magit-faces)
