; ~/.emacs.d/init.el
; Andrew Antle - http://antlechrist.org/

;; http://stackoverflow.com/questions/144983/how-do-i-make-emacs-start-without-so-much-fanfare
;;
;; C-h d inhibit-startup-echo-area-message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "andrew")

;; Backups are important.
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist '(("."."~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Go
;(require 'go-mode-load)

;; Supercollider
;(require 'sclang)
;(require 'w3m-load)

;; SLIME (Superior Lisp Interaction Mode for Emacs)
;(setq inferior-lisp-program "/usr/bin/clisp")
;(add-to-list 'load-path "~/.emacs.d/slime/")
;(require 'slime)
;(slime-setup)

;(add-to-list 'load-path "~/.emacs.d/colors/")
