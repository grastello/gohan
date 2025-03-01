;; basic repositories
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("elpa"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

;; secure the `use-package` macro
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; my dotfiles are symlinked in place so this makes the startup way less annoying
(setq vc-follow-symlinks t)

;; maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; load configuration
(load "~/.emacs.d/qol-and-aesthetics.el")
(load "~/.emacs.d/dired-stuff.el")
(load "~/.emacs.d/elfeed-config.el")
(load "~/.emacs.d/programming.el")
(load "~/.emacs.d/shell.el")
