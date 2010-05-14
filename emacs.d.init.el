;
; ~/.emacs.d/init.el
;
; Andrew Antle - http://antlechrist.org/
;

;
;; Get rid of annoying GNUisance screen. Is there a way to get rid of the
;; spam message:
;;
;;     "To find out more about the GNUniverse..."
;; 
;; in the bottom status bar? Let me know. <andrew at antlechrist dot org>
;
(setq inhibit-startup-message t)

;
;; Backups are important.
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
;
(setq backup-directory-alist '(("."."~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)
;
;; Go
;
;(require 'go-mode-load)

;
;; Supercollider
;
;(require 'sclang)
;(require 'w3m-load)

;
;; SLIME (Superior Lisp Interaction Mode for Emacs)
;
;(setq inferior-lisp-program "/usr/bin/sbcl")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;(require 'slime)
;(slime-setup)
