;;; init.el --- My init file.

;;; Commentary:

;; The font of choice is Fira Code.

;;; Code:


;; ==================
;; Personal features.
;; ==================

;; The elisp directory is the directory that we store the majority of our custom files into.
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; Load custom features.
(require 'vigne)
(require 'mounter)

;; ======================
;; Fundamental resources.
;; ======================

;; Setup repositories.
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("elpa"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

;; Dotfiles under version control require special measures.
(setq vc-follow-symlinks t)

;; ===========
;; Aestethics.
;; ===========

;; If we have Fira code installed, set it up as well as ligatures.
(when (find-font (font-spec :family "Fira Code"))
  (set-face-attribute 'default nil
		      :family "Fira Code"
		      :height 120)

  (use-package ligature
    :ensure t


    :config
    (ligature-set-ligatures 't '("www")) ; Enable www ligature for all modes.
    (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::" ; Programming-mode ligatures.
					 ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
					 "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
					 "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
					 "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
					 "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
					 "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
					 "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
					 "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
					 "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
    (global-ligature-mode 't)))

;; Theme.
(load-theme 'modus-operandi t)

;; Free up some space by removing unneeded need.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Some padding around always helps.
(use-package spacious-padding
  :ensure t
  :config
  (spacious-padding-mode 1)

  ;; Key binding to toggle spacious padding (will never come up).
  (define-key global-map (kbd "<f8>") #'spacious-padding-mode))

;; Modeline and icons.
;; Nerd icons are also useful for dired and possibly even other modes.
(use-package nerd-icons
  :ensure t
  :config

  ;; Automatically installs Symbols Nerd Font Mono on unix machines.
  (when (member system-type '(gnu gnu/linux gnu/kfreebsd darwin))
    (unless (find-font (font-spec :name "Symbols Nerd Font Mono"))
      (nerd-icons-install-fonts t))))

(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-buffer-encoding nil)
  :init
  (doom-modeline-mode 1))

;; Sort of a master + stack arrangement.
(use-package zoom
  :ensure t
  :config
  (setq  zoom-size  '(0.618 . 0.618)) ; Golden ration thing.

  :init
  (zoom-mode))

;; Something nice to look at when we launch emacs.
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5))))

(toggle-frame-maximized) ; We also want it big!

;; ================
;; Quality of life.
;; ================

;; Kill current buffer without confirmation.
(defun kill-current-buffer-no-confirmation ()
  "Kill current buffer without confirmation."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") #'kill-current-buffer-no-confirmation)

;; Split window and follow.
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

;; Only ask y/n questions.
(defalias 'yes-or-no-p 'y-or-n-p)

;; =========================
;; Dired and file management
;; =========================

(require 'dired)

;; Some aesthetic refinements.
(setq dired-listing-switches "-lh")
(add-hook 'dired-mode-hook (lambda ()
			       (hl-line-mode 1)
			       (toggle-truncate-lines)))

;; We can use icond in dired as well.
(use-package nerd-icons-dired
  :ensure t

  :hook
  (dired-mode . nerd-icons-dired-mode))

;; Toggle hidden files.
(defun dired-toggle-hidden-files ()
  "Toggle hidden files visibility."
  (interactive)

  ;; Set ls switches accordigly.
  (if (string= dired-listing-switches "-lh")
      (setq dired-listing-switches "-lha")
    (setq dired-listing-switches "-lh"))

  ;; Kill current buffer and re-open the directory
  (let ((current-directory dired-directory))
    (kill-buffer (current-buffer))
    (dired current-directory)))

(define-key dired-mode-map (kbd ".") #'dired-toggle-hidden-files)

;; Open files externally.
(setq dired-open-alist
      '(
	;; Video.
	("mkv"  . ("mpv" ))
	("mp4"  . ("mpv" ))

	;; Audio.
	("flac"  . ("mpv" "--player-operation-mode=pseudo-gui"))
	("mp3"  . ("mpv" "--player-operation-mode=pseudo-gui"))
	("opus" . ("mpv" "--player-operation-mode=pseudo-gui"))))

(defun dired-open ()
  "Open the file at point with `xdf-open'."
  (interactive)
  (let* ((filename  (dired-get-file-for-visit))
	 (extension (file-name-extension filename))
	 (program   (cadr (assoc extension dired-open-alist)))
	 (arguments (cdr (cdr (assoc extension dired-open-alist)))))
    (apply #'start-process
	   "dired-open"
	   nil
	   program
	   filename
	   arguments)))

(define-key dired-mode-map (kbd "C-x p") #'dired-open)

;; ===========
;; Completion.
;; ===========

;; Vertico for the minibuffer.
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Marginalia adds some details.
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; Orderless gives us better completion.
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)   ; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ; Emacs 31: partial-completion behaves like substring

;; Corfu for in-buffer completion.
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

;; Allow TAB to get into corfu.
(use-package emacs
  :custom
  (tab-always-indent 'complete))

;; Cape makes corfu behave as we would expect it to.
(use-package cape
  :ensure t
  :bind
  ("C-c p" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file))

;; ==========================
;; Misc and helpful packages.
;; ==========================

;; Hints!
(which-key-mode)

;; ============================
;; Autogenerated configuration.
;; ============================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi-deuteranopia))
 '(package-selected-packages
   '(cape corfu dashboard doom-modeline ligature marginalia
	  nerd-icons-dired orderless spacious-padding vertico zoom)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
