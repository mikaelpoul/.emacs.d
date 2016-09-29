;; Main emacs setup
;; Mikael Poul Johannesson

;; Adds the monokaix theme to the custom theme load path (set the theme using Custom Theme feature)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai-emacs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


;; Load package repositories
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")))
;(package-initialize)

;; Start-up screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Set user data
(setq user-full-name "Mikael Poul Johannesson")
(setq user-mail-address "mikajoh(at)gmail.com")

;; Enable clipboard
(setq x-select-enable-clipboard t)

;; Load all setup files
(load "~/.emacs.d/setup-ess.el") ;; ess-specific setup
(load "~/.emacs.d/setup-latex.el") ;; latex specific setup
(load "~/.emacs.d/setup-python.el") ;; python specific setup
(load "~/.emacs.d/setup-helm.el") ;; helm-specific setup
(load "~/.emacs.d/setup-org.el") ;; org-mode setup
;; (load "~/.emacs.d/setup-org-secret.el") ;; org-gcal settings


;; Load IDO
(require 'ido)
(ido-mode t)

;; ;; Yasnippet
;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; Markdown mode
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")
(autoload 'markdown-mode "markdown-mode")

;; ;; Polymode
;; (setq load-path
;;       (append '("~/.emacs.d/plugins/polymode/"  "~/.emacs.d/plugins/polymode/modes")
;;               load-path))
(require 'poly-R)
(require 'poly-markdown)
;; (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode)) ;; (r-modes)
;; (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
;; (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
;; (add-to-list 'auto-mode-alist '("\\.rmd" . poly-markdown+r-mode))
(add-to-list 'auto-mode-alist '("\\.Snw$" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw$" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd$" . poly-markdown+r-mode))
(add-to-list 'auto-mode-alist '("\\.rapport$" . poly-rapport-mode))
(add-to-list 'auto-mode-alist '("\\.Rhtml$" . poly-html+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rbrew$" . poly-brew+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rcpp$" . poly-r+c++-mode))
(add-to-list 'auto-mode-alist '("\\.cppR$" . poly-c++r-mode))


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
;(when (fboundp 'windmove-default-keybindings)
;  (windmove-default-keybindings))
(windmove-default-keybindings 'meta)

;; ;; Enable projectile (project management) globally
;; (projectile-global-mode)

;; ;; Enable auto-complete globally
;; (global-auto-complete-mode t)

;;;;;;;;;;;;;;;;;;;;;
;; undo tree mode  ;;
;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/plugins/undo-tree")
(require 'undo-tree)
;;turn on everywhere
(global-undo-tree-mode 1)
;; make ctrl-z undo
(global-set-key (kbd "C-z") 'undo)
;; make ctrl-Z redo
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-S-z") 'redo)

;; MAGIT
(global-set-key (kbd "C-x g") 'magit-status)

;; ;; use rmarkdown (using polymode)
;; ;; Thanks to @malcook and @r2evans!
;; (defun rmarkdown-render ()
;;   "run rmarkdown::render() on the current file and display results in buffer *Shell Command Output*"
;;   (interactive)
;;   (let ((render-command (read-string "render command:"
;;                                      (format "render('%s',%s);"
;;                                              (shell-quote-argument (buffer-file-name))
;;                                              "'all'"
;;                                              ))))
;;     (shell-command
;;      (message
;;       "Rscript -e \"withCallingHandlers({library(rmarkdown); library(pander); %s}, error = function(e) print(sys.calls()))\""
;;       render-command
;;       )
;;      )
;;     ))
;; (define-key polymode-mode-map [(meta n) (r)] 'rmarkdown-render)


;; Org-mode
(add-to-list 'load-path "~/.emacs.d/plugins/orgdir/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/orgdir/contrib/lisp" t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; load flycheck
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; for pdf-tools
;;(pdf-tools-install)

;; Highlight paren (https://twitter.com/cd_lucas/status/636124335825096704)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; Use f1/f2 to load monokai/zenburn
(setq current-t43m3 nil)

(defun enab-theme (theme) 
  (if current-t43m3 (disable-theme current-t43m3))
  (setq current-t43m3 theme) 
  (load-theme theme t)) 

(defun disab-current-theme () 
  (if current-t43m3 (disable-theme current-t43m3))
  (setq current-t43m3 nil))

(global-set-key (kbd "<f1>") '(lambda () (interactive) (enab-theme 'monokai)))
(global-set-key (kbd "<f2>") '(lambda () (interactive) (enab-theme 'zenburn)))

(defun l0ad-theme (name) 
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
			     (mapcar 'symbol-name (custom-available-themes))))))
  (enab-theme name))

(setq d3fault-theme (getenv "EMACS_DEFAULT_THEME"))

(when d3fault-theme
  (enab-theme (intern d3fault-theme)))

;; Stata setup
(setenv "PATH" (concat (getenv "PATH") ":~/Stata14Linux64"))
(setq exec-path (append exec-path '("~/Stata14Linux64")))

;; ;; Setup for org-mode
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; Org-mode
;;(org-babel-load-file "~/.emacs.d/emacs-config.org")

(setq org-startup-indented t)
(global-visual-line-mode t)

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((R . t)
;;    (latex . t)))

(setq org-confirm-babel-evaluate nil)

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)   
(add-hook 'org-mode-hook 'org-display-inline-images)

;; Syntax highlighting within src block
(setq org-src-fontify-natively t)  
