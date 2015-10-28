;; ;; Fill-column indicator
;; (add-to-list 'load-path "~/.emacs.d/plugins/fill-column-indicator")
;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode
;;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode t)

; python-mode
(setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.2.1")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

(defun my-python-line ()
(interactive)
(save-excursion
  (setq the_script_buffer (format (buffer-name)))
  (end-of-line)
  (kill-region (point) (progn (back-to-indentation) (point)))
  (if  (get-buffer  "*Python*")
  (message "")
  (run-python "ipython" nil nil))
  ;; (setq the_py_buffer (format "*Python[%s]*" (buffer-file-name)))
  (setq the_py_buffer "*Python*")
  (switch-to-buffer-other-window  the_py_buffer)
  (goto-char (buffer-end 1))
  (yank)
  (comint-send-input)
  (switch-to-buffer-other-window the_script_buffer)
  (yank))
  (end-of-line)
  (next-line)
)

(global-set-key  (kbd "C-<return>") 'my-python-line)
