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
(setq gc-cons-threshold (* 2 50 1024 1024))

;; Load bootstrapping code
(load-file "~/.emacs.d/core/jack-in.el")

;; Load from personal init files
(ono! :secrets "personal") 							; These are my secrets.

;; Load startup defults to save our sanity
(onos! :core :startup "archives") 			; We need packages. Duh.
(onos! :core :startup "defaults") 			;	Sane defaults	for our	sanity

;; Leverage our bootstrapping code
(onos! :core :essential "evil")					; VIM, but more sinister
(onos! :core :essential "keybinds") 		;	Keys like a piano
(onos! :core :essential "ivy") 					; Complete all the things
(onos! :core :essential "popups") 			;	Useful, but hard to tame
(onos! :core :checks "error-checks")    ;	Programming is very hard
(onos! :core :checks "style-checks")    ; So is	English
(onos! :core :tools "hydras") 					; HAIL!	Temporary keymaps
(onos! :core :tools "completions") 			;	I like saving effort.
(onos! :core :tools "utils") 						;	Lots of little things
(onos! :core :tools "vc") 							;	Saving stuff on steroids
(onos! :core :tools "buffer-tools") 		;	Open everything, all the time
(onos! :core :tools "shell") 						; ESHELL IS LOVE.

;; Load various app configurations
(ono! :apps "mail")                     ; mu4e,4 u and me.
(ono! :apps "irc") 											;	to talk with other emacsen
(ono! :apps "elfeed")                   ;	read the feeds
(ono! :apps "games")                    ;	games!

;; Theming configuration files
(onos! :core :appearance "themes")      ;	Behold my mighty colors and despair
(onos! :core :appearance "appearance") 	;	Fix the remnants of the	1980's
(onos! :core :appearance "highlighting");	Use those	colors everywhere
(onos! :core :appearance "interface")   ;	Hip, new	interfacing

;; Ono-custom-magic
(onos! :core :ono-extensions "magit-tweaks")  ; Custom magit icons
(onos! :core :ono-extensions "outlines")	    ;	Universal	outlines
(onos! :core :ono-extensions "ono-generic-functions") ; Custom commands

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
(ono-day-alt-theme)

;; Load custom-set-variables file
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(provide 'init)

;;; init.el ends here
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
