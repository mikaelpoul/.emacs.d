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
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
