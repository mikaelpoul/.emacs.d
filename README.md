**Personal Emacs setup and configuration files**.

I use `.el`-files placed in the `.emacs.d`-folder for any custom emacs configuration. The main setup is done by `setup.el`, which in turn loads the other setup files. `setup.el` is initalized simply by including:

```elisp
;; Load setup
(load "~/.emacs.d/setup.el")
```

in the `.emacs`-file.
