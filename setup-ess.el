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


;; Set the width correctly
(add-hook 'ess-R-post-run-hook 'ess-execute-screen-options)
(define-key inferior-ess-mode-map "\C-cw" 'ess-execute-screen-options) ;; 

;; Section : Emacs shells work better
;; http://snarfed.org/why_i_run_shells_inside_emacs
(setq ansi-color-for-comint-mode 'filter)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

