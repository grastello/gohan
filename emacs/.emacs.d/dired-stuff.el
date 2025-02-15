(require 'dired)

;; Some aesthetic refinements.
(setq dired-listing-switches "-lh")
(add-hook 'dired-mode-hook (lambda ()
			       (hl-line-mode 1)
			       (toggle-truncate-lines)))

;; And icons.
(use-package nerd-icons-dired
  :ensure t

  :hook
  (dired-mode . nerd-icons-dired-mode))

;; Hidden file toggling.
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

;; Open files externally with handmade xdg-open.
(setq dired-open-alist
      '(("mkv"  . ("mpv" "--sub-ass=no"))
		("mp4"  . ("mpv" "--sub-ass=no"))
		("m4a"  . ("mpv" "--player-operation-mode=pseudo-gui"))
		("flac"  . ("mpv" "--player-operation-mode=pseudo-gui"))
		("mp3"  . ("mpv" "--player-operation-mode=pseudo-gui"))
		("opus" . ("mpv" "--player-operation-mode=pseudo-gui"))
		("pdf"  . ("evince"))))

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

(define-key dired-mode-map (kbd "C-c C-x") #'dired-open)
