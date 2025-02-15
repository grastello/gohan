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
   '("7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4" "7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d" "571661a9d205cb32dfed5566019ad54f5bb3415d2d88f7ea1d00c7c794e70a36" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873" "30d174000ea9cbddecd6cc695943afb7dba66b302a14f9db5dd65074e70cc744" "8b0cf3eace61815944d65ca122b40e36658d173827b2f28aa2c83cc7c0754cac" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7" "2771ec93656faf267521dce9ffe1a6ad88cd0bea87aa0e8c4fc80bf355c58c1d" "e978b5106d203ba61eda3242317feff219f257f6300bd9b952726faf4c5dee7b" "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176" "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710" "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" "d6b934330450d9de1112cbb7617eaf929244d192c4ffb1b9e6b63ad574784aad" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "b754d3a03c34cfba9ad7991380d26984ebd0761925773530e24d8dd8b6894738" "5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e" "0d2c5679b6d087686dcfd4d7e57ed8e8aedcccc7f1a478cd69704c02e4ee36fe" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "7bea8c8136b95e40a3def71cc2953e29d2553078ba1730d8262f1dccc586fbab" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd" "3aa51468052c1e3e21dd41a3fa40c0161e07ca600683e3d96f1bca70f36749e2" "9f986dcc0de26c1c8b6dfd749eb7351b1a3c8db31b3330a7dfdd25be1b47cb22" "6ef8291bcfd3d7c8f26b0921e62838514dbefa23ce5be09ab4663087f2868363" "4edad12267c88bb57aab5a5c0d2e23740c6f552b6a36fb785dfb4e4725808eab" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "afde6368be6868e8e3dd53fad1ac51223d5484f9e6836496e7987802c9a9663d" "6f177b9a2579197e650918c8e53440997063b543fc854763e3597b5a4c33860d" "a60b04e5c0fef30209f9576f04651938472b57cb1dae0375d80a53a78f515f69" "2a1d0e4e6bd665fb532cb07cdf466e3bba1e4f2e5e6e01eee1fa913edabe8759" "5a548c9d5a6ca78d13283ed709bddf3307b65a7695e1b2e2b7e0a9dde45e8599" "e14991397ba1341f1240216392f48889a343506b1f9c8e9c37ed391151f87463" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(package-selected-packages
   '(doom-themes nerd-icons-dired nlinum auctex dirvish zoom linum-relative counsel swiper ivy catppuccin-theme nord-theme helm gruber-darker-theme slime-mode slime pdf-tools moe-theme magit poet-theme ample-theme js2-mode j2s-mode corfu gruvbox-theme ledger-mode go-mode sly rust-mode elfeed which-key smex ido-vertical-mode ido-completing-read+ dashboard doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
