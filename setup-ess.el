;; Thanks to griverorz (https://github.com/griverorz/emacsd) for inspiration

;; Load ESS
(add-to-list 'load-path "~/.emacs.d/ESS/lisp")
(load "ess-site")

;; Do not load data or save envir
(setq inferior-R-args "--no-restore-history --no-restore-data --no-save ")

;; Do not auto-indent comments in R-mode
(setq ess-fancy-comments nil)
(add-hook 'ess-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline)))


;; Put all buffers in one frame
(setq ess-help-own-frame 'one)
(setq ess-help-reuse-window t)

;; Print evaluated command? (might speed up evaluation)
;; (setq ess-eval-visibly nil)

;; Start R session without prompt
(setq ess-ask-for-ess-directory nil) 

;; "Stop doing weird things with the alignment of formulas" (thanks to griverorz)
(add-hook 'ess-mode-hook (lambda () (setq ess-arg-function-offset 4)))
(add-hook 'ess-mode-hook (lambda () (setq ess-continued-statement-offset 0)))
