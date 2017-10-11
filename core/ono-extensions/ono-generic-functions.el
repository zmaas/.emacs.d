;; ONO-generic-functions: Generic custom commands that don't fit elsewhere

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
