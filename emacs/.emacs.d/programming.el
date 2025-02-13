;; line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; tabs as 4 spaces
(setq-default tab-width 4)

;; magit
(use-package magit
  :ensure t)

;; Completion with Corfu
(use-package corfu
  :ensure t

  :init
  (global-corfu-mode))

(use-package dabbrev
  :ensure t

  :bind (("M-/" . dabbrev-completion)
		 ("C-M-/" . dabbrev-expand)))

;; LaTeX
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'latex-mode-hook 'flyspell-mode)
(setq ispell-dictionary "it")

;; Common LISP
(use-package slime
  :ensure t

  :init
  (setq inferior-lisp-program "/usr/bin/sbcl"))
