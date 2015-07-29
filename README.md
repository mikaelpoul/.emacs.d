**Emacs setup and configuration files**.

Mikael Poul Johannesson.

I use `.el`-files placed in the `.emacs.d`-folder for any emacs configuration or setup. The main setup is done by `setup.el`, which in turn loads the other setup files. `setup.el` is initalized simply by including

  ;; Load setup
  (load "~/.emacs.d/setup.el")

in the `.emacs`-file. 