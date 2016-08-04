
;; Calfw - A calendar framework
;;
;; Installed from MELPA
;;(require 'calfw)
(require 'calfw-org)
(setq cfw:org-overwrite-default-keybinding t) ;; keybinding for org-mode

;; First day of the week
(setq calendar-week-start-day 1) ; 0:Sunday, 1:Monday

;; Add all agenda-files to the list
(setq org-agenda-files
      (mapcar 'abbreviate-file-name
              (split-string
               (shell-command-to-string "find ~/org -name \"*.org\"") "\n")))

