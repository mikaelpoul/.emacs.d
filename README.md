**Personal Emacs setup and configuration files**.

I use `.el`-files placed in the `.emacs.d`-folder for any custom emacs configuration. The main setup is done by `setup.el`, which in turn loads the other setup files. `setup.el` is initalized simply by including

```elisp
;; Load setup
(load "~/.emacs.d/setup.el")
```

in the `.emacs`-file.

###Other notes-to-self

**Installation**
- Install `auctex` using package-install: `M-x package-list-packages RET`, locate `auctex`, and install (`package-list-packages` updates the package list).
- Install `projectile` using package-install: `M-x package-install RET projectile`
- Install `auto-complete` using package-install: `M-x package-install RET auto-complete RET`
- Install `latex-preview-pane` using package-install: `M-x package-install RET latex-preview-pane RET`
- Install `magit` using package-install: `M-x package-install RET magit RET`

**keybindings**

*undo-tree*
- `C-x u` to vizualize the undo tree
- `C-_` to undo and `M-_` to redo

*magit*
- `C-x g` *magit-status*
- `s` *stage* files, `u` unstage files (`S` and `U` to stage/unstage all hunks)
- `c c` to *commit* -> type message -> `C-c C-c` to finish
- `b b` to switch branch
- `P P` (in capital letters) to *git push*
- `F F` (in capital letters) to *git pull*

*polymode*
- `M-n r` in polymode-r mode to use the new *rmarkdown* (`render()`). Thanks to @r2evans and @malcook.
    - Ploymode dependencies: OS needs `lmodern`, `pandoc`, and LaTex;  R needs `pander`, `knitr` and `rmarkdown`.


- `M-n w` to *weave* (capital W to choose weaver), and `M-n e` to *export* (capital E to choose exporter)

*projectile*

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c p f</kbd> | Display a list of all files in the project. With a prefix argument it will clear the cache first.
<kbd>C-c p F</kbd> | Display a list of all files in all known projects.
<kbd>C-c p g</kbd> | Display a list of all files at point in the project. With a prefix argument it will clear the cache first.
<kbd>C-c p 4 f</kbd> | Jump to a project's file using completion and show it in another window.
<kbd>C-c p 4 g</kbd> | Jump to a project's file based on context at point and show it in another window.
<kbd>C-c p d</kbd> | Display a list of all directories in the project. With a prefix argument it will clear the cache first.
<kbd>C-c p 4 d</kbd> | Switch to a project directory and show it in another window.
<kbd>C-c p 4 a</kbd> | Switch between files with the same name but different extensions in other window.
<kbd>C-c p T</kbd> | Display a list of all test files(specs, features, etc) in the project.
<kbd>C-c p l</kbd> | Display a list of all files in a directory (that's not necessarily a project)
<kbd>C-c p s g</kbd> | Run grep on the files in the project.
<kbd>M-- C-c p s g</kbd> | Run grep on `projectile-grep-default-files` in the project.
<kbd>C-c p v</kbd> | Run `vc-dir` on the root directory of the project.
<kbd>C-c p b</kbd> | Display a list of all project buffers currently open.
<kbd>C-c p 4 b</kbd> | Switch to a project buffer and show it in another window.
<kbd>C-c p 4 C-o</kbd> | Display a project buffer in another window without selecting it.
<kbd>C-c p a</kbd> | Switch between files with the same name but different extensions.
<kbd>C-c p o</kbd> | Runs `multi-occur` on all project buffers currently open.
<kbd>C-c p r</kbd> | Runs interactive query-replace on all files in the projects.
<kbd>C-c p i</kbd> | Invalidates the project cache (if existing).
<kbd>C-c p R</kbd> | Regenerates the projects `TAGS` file.
<kbd>C-c p j</kbd> | Find tag in project's `TAGS` file.
<kbd>C-c p k</kbd> | Kills all project buffers.
<kbd>C-c p D</kbd> | Opens the root of the project in `dired`.
<kbd>C-c p e</kbd> | Shows a list of recently visited project files.
<kbd>C-c p s s</kbd> | Runs `ag` on the project. Requires the presence of `ag.el`.
<kbd>C-c p !</kbd> | Runs `shell-command` in the root directory of the project.
<kbd>C-c p &</kbd> | Runs `async-shell-command` in the root directory of the project.
<kbd>C-c p c</kbd> | Runs a standard compilation command for your type of project.
<kbd>C-c p P</kbd> | Runs a standard test command for your type of project.
<kbd>C-c p t</kbd> | Toggle between an implementation file and its test file.
<kbd>C-c p 4 t</kbd> | Jump to implementation or test file in other window.
<kbd>C-c p z</kbd> | Adds the currently visited file to the cache.
<kbd>C-c p p</kbd> | Display a list of known projects you can switch to.
<kbd>C-c p S</kbd> | Save all project buffers.
<kbd>C-c p m</kbd> | Run the commander (an interface to run commands with a single key).
<kbd>C-c p ESC</kbd> | Switch to the most recently selected Projectile buffer.
<kbd>C-c p C-h</kbd> | Display/show projectiles keybindings
