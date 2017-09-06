;;; init.el
;; Commentary:
;;      ___           ___           ___
;;     /\  \         /\  \         /\  \
;;    /::\  \        \:\  \       /::\  \
;;   /:/\:\  \        \:\  \     /:/\:\  \
;;  /:/  \:\  \   _____\:\  \   /:/  \:\  \
;; /:/__/ \:\__\ /::::::::\__\ /:/__/ \:\__\
;; \:\  \ /:/  / \:\~~\~~\/__/ \:\  \ /:/  /
;;  \:\  /:/  /   \:\  \        \:\  /:/  /
;;   \:\/:/  /     \:\  \        \:\/:/  /
;;    \::/  /       \:\__\        \::/  /
;;     \/__/         \/__/         \/__/
;;                  EMACS
;;
;; Emacs configuration file targeting Emacs 25.2
;; Author: Zach Maas (zach.maas@gmail.com)
;; Configured for use on Arch Linux, vc using git
;; For more information, see README

;;; Code:

;; Allow packages to load
(package-initialize)

;; Setup Garbage Collection Threshold for Speed
(setq gc-cons-threshold (* 50 1024 1024))

;; Load bootstrapping code
(load-file "~/.emacs.d/core/jack-in.el")

;; Load from personal init files
(ono! :secrets "personal") 							; These are my secrets.

;; Load startup defults to save our sanity
(ono! :startup "archives") 							; We need packages. Duh.
(ono! :startup "defaults") 							;	Sane defaults	for our	sanity

;; Leverage our bootstrapping code
(ono! :core "evil")											; VIM, but more sinister
(ono! :core "keybinds") 								;	Keys like a pianist
(ono! :core "ivy") 											; Complete all the things
(ono! :core "hydras") 									; HAIL!	Temporary keymaps
(ono! :core "completions") 							;	I like saving effort.
(ono! :core "error-checks")							;	Programming is very hard
(ono! :core "style-checks") 						; So is	English
(ono! :core "utils") 										;	Lots of little things
(ono! :core "shell") 										; ESHELL IS LOVE.

;; Load various app configurations
(ono! :apps "mail") 										; mu4e,4 u and me.
(ono! :apps "irc") 											;	to talk with other emacsen

;; Theming configuration files
(ono! :core "themes") 									;	Behold my mighty colors and despair
(ono! :core "appearance") 							;	Fix the remnants of the	1980's

;; Markup Langauges
(ono! :lang "latex") 										;	No better way to make pretentious	docs
(ono! :lang "org") 											;	Org will slowly consume your life
(ono! :lang "md") 											;	Yetanotherhipstermarkdownlanguage

;; Programming Languages
(ono! :lang "lisp")                     ; (p(a(r(e(n(s))))))
(ono! :lang "clojure") 									; Lisp hijacks JS and the JVM
(ono! :lang "python") 									;	Simple != easy
(ono! :lang "haskell") 									;	Did someone say math?
(ono! :lang "go") 											;	C, but for parallel brogrammers
(ono! :lang "r") 												;	Stats, stats, stats!
(ono! :lang "c++") 											;	if c=1,	c	++ = 2

;; Set our default theme
(daytime-space-theme)

;; Load custom-set-variables file
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(provide 'init)

;;; init.el ends here
