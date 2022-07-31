;;; Modeline.
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;; Aesthetic easy stuff.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode '(10 . 1))

;;; Sane buffer killing.
(defun murder-current-buffer ()
  "directly kill the current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") #'murder-current-buffer)

;;; Sane window splitting.
(defun split-and-follow-horizontally ()
  "split current window horizontally and move the cursor in it"
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-and-follow-vertically ()
  "split current window vertically and move the cursor in it"
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;;; Biggest QOL change.
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Parenthesis.
(show-paren-mode 1)

(setq electric-pair-pairs '(
			    (?\{ . ?\})
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\" . ?\")
			    ))
(electric-pair-mode t)

;;; IDO + SMEX for nice completion in minibuffer.
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex))

;;; Which-key.
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;;; Backups in a better place
(setq backup-directory-alist '(("." . "~/emacs-backups"))
      backup-by-copying      t
      delete-old-versions    t
      kept-new-versions      10
      kept-old-versions      3)
