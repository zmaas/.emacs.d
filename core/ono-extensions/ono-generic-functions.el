;; ONO-generic-functions:	Generic	custom commands that don't fit elsewhere

(defun ono-fill-or-unfill ()
  "Like `fill-paragraph', but unfill if used twice."
  (interactive)
	(unfill-toggle))
