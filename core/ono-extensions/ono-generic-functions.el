;; ONO-generic-functions: Generic custom commands that don't fit elsewhere

(defun ono-open-init-file ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))

(defun ono-fill-or-unfill ()
	"Like `fill-paragraph', but unfill if used twice."
	(interactive)
	(unfill-toggle))

(defun lod ()
	"Well. This is disappointing."
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

;; NEED TO WORK ON THIS...
(defun ono-simple-get-word ()
	(car-safe (save-excursion )))(ispell-get-word nil))))

(defun ono-ispell-word-then-abbrev (p)
	"Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'."
	(interactive "P")
	(let (bef aft)
		(save-excursion
			(while (if (setq bef (ono-simple-get-word))
								 ;; Word was corrected or used quit.
								 (if (ispell-word nil 'quiet)
										 nil ; End the loop.
									 ;; Also end if we reach `bob'.
									 (not (bobp)))
							 ;; If there's no word at point, keep looking
							 ;; until `bob'.
							 (not (bobp)))
				(backward-word)
				(backward-char))
			(setq aft (ono-simple-get-word)))
		(if (and aft bef (not (equal aft bef)))
				(let ((aft (downcase aft))
							(bef (downcase bef)))
					(define-abbrev
						(if p local-abbrev-table global-abbrev-table)
						bef aft)
					(message "\"%s\" now expands to \"%s\" %sally"
									 bef aft (if p "loc" "glob")))
			(user-error "No typo at or before point"))))
