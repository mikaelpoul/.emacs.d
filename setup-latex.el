
;; Load auctex
(add-to-list 'load-path "~/elisp")

;; remove auto-fll when writing tex
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
