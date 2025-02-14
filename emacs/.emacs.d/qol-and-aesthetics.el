;; font
(set-frame-font "Inconsolata 14" nil t)

;; aesthetic easy stuff
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode '(10 . 10))

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5))))

;; sane buffer killing
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

;; biggest QOL change
(defalias 'yes-or-no-p 'y-or-n-p)

;; parenthesis
(show-paren-mode 1)

(setq electric-pair-pairs '(
				(?\{ . ?\})
				(?\( . ?\))
				(?\[ . ?\])
				(?\" . ?\")
				))
(electric-pair-mode t)

;; IDO + SMEX for nice completion in minibuffer
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; (use-package ido-completing-read+
;;   :ensure t
;;   :config
;;   (ido-ubiquitous-mode 1))

;; (use-package ido-vertical-mode
;;   :ensure t
;;   :config
;;   (ido-vertical-mode 1)
;;   (setq ido-vertical-define-keys 'C-n-and-C-p-only))

;; (use-package smex
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "M-x") 'smex))

;; Ivy, counsel, swiper
(use-package ivy
  :ensure t
  :init
  (ivy-mode))

(use-package counsel
  :ensure t

  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  
  :init
  (counsel-mode))

(use-package swiper
  :ensure t

  :bind
  (("C-s" . 'swiper)))

;; which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; backups in a better place
(setq backup-directory-alist '(("." . "~/emacs-backups"))
	  backup-by-copying      t
	  delete-old-versions    t
	  kept-new-versions      10
	  kept-old-versions      3)

;; aspell
(setq ispell-program-name "aspell")
