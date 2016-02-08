;; Thanks to griverorz (https://github.com/griverorz/emacsd) for inspiration

;; ;; Load ESS
;; (add-to-list 'load-path "~/.emacs.d/ESS/lisp")
;; (load "ess-site")

(require 'ess-site)

;; Do not load data or save envir
(setq inferior-R-args "--no-restore-history --no-restore-data --no-save ")

;; ;; Do not auto-indent comments in R-mode
;; (setq ess-fancy-comments nil)
;; (add-hook 'ess-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "RET") 'newline)))


;; Put all buffers in one frame
(setq ess-help-own-frame 'one)
(setq ess-help-reuse-window t)

;; Dont print evaluated commands: Speeds up eval. when eval'ing large region
(setq ess-eval-visibly nil)

;; Start R session without prompt
(setq ess-ask-for-ess-directory nil) 

;; Set the width correctly
(add-hook 'ess-R-post-run-hook 'ess-execute-screen-options)
(define-key inferior-ess-mode-map "\C-cw" 'ess-execute-screen-options) ;; 

;; Section : Emacs shells work better
;; http://snarfed.org/why_i_run_shells_inside_emacs
(setq ansi-color-for-comint-mode 'filter)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

;; Piping in R
 (defun then_R_operator ()
  "R - %>% operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%>%")
  (reindent-then-newline-and-indent))
(define-key ess-mode-map (kbd "C-<") 'then_R_operator)
(define-key inferior-ess-mode-map (kbd "C-<") 'then_R_operator)

;; Set ess style
(add-to-list 'ess-style-alist
             '(my-style
               (ess-indent-level . 4)
               (ess-first-continued-statement-offset . 2)
               (ess-continued-statement-offset . 0)
               (ess-brace-offset . -4)
               (ess-expression-offset . 4)
               (ess-else-offset . 0)
               (ess-close-brace-offset . 0)
               (ess-brace-imaginary-offset . 2)
               (ess-continued-brace-offset . 0)
               (ess-arg-function-offset . 4)
	       (ess-arg-function-offset-new-line . '(4))
               ))
(setq ess-default-style 'my-style)

(add-hook 'ess-mode-hook (lambda () (setq ess-default-style 'my-style)))
(add-hook 'ess-R-post-run-hook (lambda () (setq ess-default-style 'my-style)))

(defun smart-operator-self-insert-command (arg)
  "Insert the entered operator plus surrounding spaces."
  (interactive "p")
  (smart-operator-insert (string last-command-char)))

(defvar smart-operator-mode-map
  (let ((keymap (make-sparse-keymap)))
    (define-key keymap "=" 'smart-operator-self-insert-command)
    (define-key keymap "+" 'smart-operator-self-insert-command)
    (define-key keymap "-" 'smart-operator-self-insert-command)
    (define-key keymap "/" 'smart-operator-self-insert-command)
    (define-key keymap "%" 'smart-operator-self-insert-command)
    (define-key keymap "&" 'smart-operator-self-insert-command)
    (define-key keymap "*" 'smart-operator-self-insert-command)
    (define-key keymap "!" 'smart-operator-self-insert-command)
    (define-key keymap "|" 'smart-operator-self-insert-command)
    (define-key keymap "<" 'smart-operator-self-insert-command)
    (define-key keymap ">" 'smart-operator-self-insert-command)
    (define-key keymap "," 'smart-operator-self-insert-command)
    (define-key keymap "." 'smart-operator-self-insert-command)
    (define-key keymap ":" 'smart-operator-self-insert-command)
    keymap)
  "Keymap used my `smart-operator-mode'.")

(define-minor-mode smart-operator-mode
  "Insert operators packed with whitespaces smartly."
  nil " _=_" smart-operator-mode-map)


;; (setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files
;; (require 'auto-indent-mode)

;; (auto-indent-global-mode)


;; (defun ess-keys-hook ()
;;   "Put a bunch of keybindings in here."
;;   (local-set-key [tab] 'ess-indent-or-complete))

;; (add-hook 'ess-mode-hook 'ess-keys-hook)

;; R-internals manual
;;; ESS
(add-hook 'ess-mode-hook
      (lambda ()
        (ess-set-style 'C++ 'quiet)
        ;; Because
        ;;                                 DEF GNU BSD K&R C++
        ;; ess-indent-level                  2   2   8   5   2
        ;; ess-continued-statement-offset    2   2   8   5   2
        ;; ess-brace-offset                  0   0  -8  -5  -4
        ;; ess-arg-function-offset           2   4   0   0   0
        ;; ess-expression-offset             4   2   8   5   2
        ;; ess-else-offset                   0   0   0   0   0
        ;; ess-close-brace-offset            0   0   0   0   0
        (add-hook 'local-write-file-hooks
              (lambda ()
            (ess-nuke-trailing-whitespace)))))
;;(setq ess-nuke-trailing-whitespace-p 'ask)
;; or even
(setq ess-nuke-trailing-whitespace-p t)
;; Perl
(add-hook 'perl-mode-hook
      (lambda () (setq perl-indent-level 4)))

;; Pretty arrows and magrittr pipes in R
(defvar pretty-alist
  (cl-pairlis '() '()))
(add-to-list 'pretty-alist '("%>%" . "⇛"))
;;(add-to-list 'pretty-alist '("<-" . "⇐"))
(defun pretty-things ()
  (mapc
   (lambda (x)
     (let ((word (car x))
           (char (cdr x)))
       (font-lock-add-keywords
        nil
        `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[a-zA-Z]")
            (0 (progn
                 (decompose-region (match-beginning 2) (match-end 2))
                 nil)))))
       (font-lock-add-keywords
        nil
        `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[^a-zA-Z]")
            (0 (progn
                 (compose-region (match-beginning 2) (match-end 2)
                  ,char)
                 nil)))))))
   pretty-alist))

(add-hook 'R-mode-hook
      (lambda ()
        (font-lock-add-keywords nil
                 '(("\\(%>%\\)" 1
                    font-lock-builtin-face t)))))

(define-key ess-mode-map [(super .)] "%>%")
