**Emacs setup and configuration files**.

I use `.el`-files placed in the `.emacs.d`-folder for any custom emacs configuration. The main setup is done by `setup.el`, which in turn loads the other setup files. `setup.el` is initalized simply by including

```elisp
;; Load setup
(load "~/.emacs.d/setup.el")
```

in the `.emacs`-file.

Other notes-to-self:
- Install `auctex` using package-install: `M-x package-list-packages RET`, locate `auctex`, and install.
- Install `projectile` using package-install: `M-x package-install RET projectile`
- Install `auto-complete` using package-install: `M-x package-install [RET] auto-complete [RET]`
- Install `LaTex Preview Pane` using package-install: `M-x package-install latex-preview-pane`
- Install `magit` using package-install: `M-x package-install RET magit RET`

`C-x g` = magit-status
