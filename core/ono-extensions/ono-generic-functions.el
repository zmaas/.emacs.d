;; ONO-generic-functions: Generic custom commands that don't fit elsewhere

(defun ono-open-init-file ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))

(defun ono-open-organizer-file ()
  "Open the org-mode organizer file."
  (interactive)
  (find-file "~/Dropbox/Org/organizer.org"))

(defun ono-fill-or-unfill ()
  "Like `fill-paragraph', but unfill if used twice."
  (interactive)
  (unfill-toggle))

(defun lod ()
  "Well.  This is disappointing."
  (interactive)
  (insert "\u0ca0_\u0ca0"))

(defcustom smart-to-ascii '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'")
                            ;; en-dash
                            ("\x2013" . "-")
                            ;; em-dash
                            ("\x2014" . "-"))
	"Map of smart quotes to their replacements"
  :type '(repeat (cons (string :tag "Smart Character  ")
                       (string :tag "Ascii Replacement"))))

(defun ono-smart-to-ascii (beg end)
  "Replace smart quotes and dashes with their ASCII equivalents"
  (interactive "r")
  (format-replace-strings smart-to-ascii
                          nil beg end))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun ono-cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a
buffer." (interactive)
(ono-smart-to-ascii (point-min) (point-max))
(indent-buffer)
(untabify-buffer)
(delete-trailing-whitespace))

(defun ono-safe-send ()
	"Ask before sending an email."
	(interactive)
	(when (yes-or-no-p "Really send this message? ")
		(message-send)))

(defun ono-escape-and-ex ()
	"Escape to normal mode and move to ex"
	(interactive)
	(evil-normal-state)
	(evil-ex))

(defun ono-insert-autocite ()
	"Insert a citation using ivy-bibtex"
	(interactive)
	(insert "\\autocite{}")
	(backward-char 1)
	(ivy-bibtex)
	(forward-char 1))

;; close all open parens before point
(defun close-all-parentheses ()
  (interactive "*")
  (let ((closing nil))
    (save-excursion
      (while (condition-case nil
                 (progn
                   (backward-up-list)
                   (let ((syntax (syntax-after (point))))
                     (case (car syntax)
                       ((4) (setq closing (cons (cdr syntax) closing)))
                       ((7 8) (setq closing (cons (char-after (point)) closing)))))
                   t)
               ((scan-error) nil))))
    (apply #'insert (nreverse closing))))
