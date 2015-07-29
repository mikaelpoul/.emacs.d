;; Thanks to griverorz (https://github.com/griverorz/emacsd)

;; Load ESS
(add-to-list 'load-path "~/.emacs.d/ESS/lisp")
(load "ess-site")

;; Do not load data or save envir
(setq inferior-R-args "--no-restore-history --no-restore-data --no-save ")

;; Do not auto-indent comments in R-mode
(add-hook 'ess-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline)))

;;; Put all buffers into one frame
(setq ess-help-own-frame 'one)
(setq ess-help-reuse-window t)

;; Print evaluated command? (might speed up evaluation)
;; (setq ess-eval-visibly nil)

;; Start R session without prompt
(setq ess-ask-for-ess-directory nil) 

;; Speedbar
;; (speedbar-add-supported-extension ".R")

;; "Stop doing weird things with the alignment of formulas" (thanks to griverorz)
(add-hook 'ess-mode-hook (lambda () (setq ess-arg-function-offset 4)))
(add-hook 'ess-mode-hook (lambda () (setq ess-continued-statement-offset 0)))

;; From griverorz:
;; I don't like if another frame pops up showing the inferior-ess buffer,
;; rather I want unconditionally that the buffer is shown in the current frame.
;;(defun ess-buffer-visible-other-frame (buf) nil)
;;(setq ess-display-buffer-reuse-frames nil)
;;(setq inferior-ess-own-frame t)
;;(setq inferior-ess-same-window nil)
;;(setq split-window-preferred-function nil) ; discourage horizontal splits
;;(setq pop-up-windows nil)

;;(add-to-list
;; 'display-buffer-alist
;; '("*.R" . (display-buffer-reuse-window
;;	    . ((reusable-frames . t)))))
