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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("7bea8c8136b95e40a3def71cc2953e29d2553078ba1730d8262f1dccc586fbab" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd" "3aa51468052c1e3e21dd41a3fa40c0161e07ca600683e3d96f1bca70f36749e2" "9f986dcc0de26c1c8b6dfd749eb7351b1a3c8db31b3330a7dfdd25be1b47cb22" "6ef8291bcfd3d7c8f26b0921e62838514dbefa23ce5be09ab4663087f2868363" "4edad12267c88bb57aab5a5c0d2e23740c6f552b6a36fb785dfb4e4725808eab" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "afde6368be6868e8e3dd53fad1ac51223d5484f9e6836496e7987802c9a9663d" "6f177b9a2579197e650918c8e53440997063b543fc854763e3597b5a4c33860d" "a60b04e5c0fef30209f9576f04651938472b57cb1dae0375d80a53a78f515f69" "2a1d0e4e6bd665fb532cb07cdf466e3bba1e4f2e5e6e01eee1fa913edabe8759" "5a548c9d5a6ca78d13283ed709bddf3307b65a7695e1b2e2b7e0a9dde45e8599" "e14991397ba1341f1240216392f48889a343506b1f9c8e9c37ed391151f87463" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(package-selected-packages
   '(linum-relative counsel swiper ivy catppuccin-theme nord-theme helm gruber-darker-theme slime-mode slime pdf-tools moe-theme magit poet-theme ample-theme js2-mode j2s-mode corfu gruvbox-theme ledger-mode go-mode sly rust-mode elfeed which-key smex ido-vertical-mode ido-completing-read+ dashboard doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
