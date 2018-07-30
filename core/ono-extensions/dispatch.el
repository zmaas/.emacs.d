;;; dispatch.el ---A port of dispatch.vim            -*- lexical-binding: t; -*-

;; Copyright (C) 2018

;; Author:  <zach.maas@gmail.com>
;; Keywords: evil

;;; Commentary:
;; In-Progress... Port of Dispatch.vim

;; TODO: Dispatch	runs command in foreground
;; TODO: Dispatch! runs command in background
;; TODO: Custom buffer names and regexps
;; TODO: Option to run through existing tmux session
;; TODO: Choice to run on	selected region

;;; Code:


(evil-define-command evil-dispatch/run ($arg)
	(interactive "<a>")
	(evil-dispatch/run-on-region $arg))

(defun evil-dispatch/run-on-region ($usr-command &optional $from $to)
	"Run a $USR-COMMAND in a shell, with some extra goodies."
	(interactive "<a>")
	(compile $usr-command))

(evil-ex-define-cmd "Dispatch" 'evil-dispatch/run)
;; (evil-ex-define-cmd "Dispatcha" 'evil-dispatch/run-async)

(provide 'dispatch)
;;;	dispatch.el ends here
