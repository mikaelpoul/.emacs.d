
;; Calfw - A calendar framework
;;
;; Installed from MELPA
;;(require 'calfw)
(require 'calfw-org)
(setq cfw:org-overwrite-default-keybinding t) ;; keybinding for org-mode

;; First day of the week
(setq calendar-week-start-day 1) ; 0:Sunday, 1:Monday

;; Org-gcal: Sync with google calendar
;; Installed from MELPA
;;
(add-to-list 'load-path "~/.emacs.d/elpa/org-gcal-20160307.1206/org-gcal.el")
(require 'org-gcal)
(setq org-gcal-client-id "659714233659-ee6lo1mkmkfncmvfgq0pos6sm82cjbc8.apps.googleusercontent.com"
     org-gcal-client-secret "_715xoJeasfm4b_6EC41Ew4s"
     org-gcal-file-alist '(("mikajoh@gmail.com" .  "~/Dropbox/projects/gcal.org")))
(org-gcal-fetch) ;; sync gcal on startup

;; Add all agenda-files to the list
(setq org-agenda-files
      (mapcar 'abbreviate-file-name
              (split-string
               (shell-command-to-string "find ~/org -name \"*.org\"") "\n")))

