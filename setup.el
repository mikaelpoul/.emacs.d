;; Main emacs setup
;; Mikael Poul Johannesson

;; Adds the monokai theme to the custom theme load path (set the theme using Custom Theme feature)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai-emacs")


;; Load package repositories
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)


;; Set user data
(setq user-full-name "Mikael Poul Johannesson")
(setq user-mail-address "mikajoh(at)gmail.com")

;; Enable clipboard
(setq x-select-enable-clipboard t)

;; Load all setup files
(load "~/.emacs.d/setup-ess.el") ;; ess-specific setup
(load "~/.emacs.d/setup-latex.el") ;; latex specific setup

;; Load IDO
(require 'ido)
(ido-mode t)

;; Yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Markdown mode
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;;(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))

;; Tabbar (tabs)
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
(tabbar-mode t)

;; Smax (M-x enchancement: Shows recently and most freq used commands)
(add-to-list 'load-path "~/.emacs.d/plugins/smex")
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Wind mode (shift+arrow key to shift move between buffers)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Enable projectile (project management) globally
(projectile-global-mode)

;; Enable auto-complete globally
(global-auto-complete-mode t)

;; Undo-tree
(add-to-list 'load-path "~/.emacs.d/plugins/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

;; MAGIT
(global-set-key (kbd "C-x g") 'magit-status)

;; Polymode
(setq load-path
      (append '("~/.emacs.d/plugins/polymode/"  "~/.emacs.d/plugins/polymode/modes")
              load-path))
(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode)) ;; (r-modes)
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; use rmarkdown (using polymode)
;; Thanks to @malcook and @r2evans!
(defun rmarkdown-render ()
  "run rmarkdown::render() on the current file and display results in buffer *Shell Command Output*"
  (interactive)
  (let ((render-command (read-string "render command:"
                                     (format "render('%s',%s);"
                                             (shell-quote-argument (buffer-file-name))
                                             "'all'"
                                             ))))
    (shell-command
     (message
      "Rscript -e \"withCallingHandlers({library(rmarkdown); library(pander); %s}, error = function(e) print(sys.calls()))\""
      render-command
      ))&
    ))
(define-key polymode-mode-map [(meta n) (r)] 'rmarkdown-render)
