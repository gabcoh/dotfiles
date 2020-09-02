;; This file contains the initialization for all built in emacs packages
(use-package emacs
  :config
  (setq backup-directory-alist `(("." . "~/.saves"))
	auto-save-file-name-transforms `((".*" "~/.saves/" t))
	custom-file "~/.emacs.d/emacs-custom.el"
	inhibit-startup-screen t
	exec-path (append exec-path '("~/.local/bin"))

	)
  (load custom-file)
  (setq-default fill-column 80)
  (dolist (mode '(org-mode-hook text-mode-hook))
	  (add-hook mode 'turn-on-auto-fill))
  (set-face-attribute 'default nil :height 118)
  (winner-mode)
  (server-start)
  )
(use-package paren
  :ensure nil
  :config
  (show-paren-mode 1)
  )
(use-package tool-bar
  :ensure nil
  :config
  (tool-bar-mode -1)
  )
;; (use-package ido
;;   :config
;;   (ido-mode 1)
;;   )
(use-package dired
  :ensure nil
  :after evil
  :config
  (leader-files-def
    "d" 'dired)
  )
(use-package elisp-mode
  :ensure nil
  :after evil
  :init
  (defun load-current-elisp-file ()
    "Load the current elisp file"
    (interactive)
    (if (equal major-mode 'emacs-lisp-mode)
	(load-file (buffer-file-name))
      (message "Current buffer not an elisp file")
      )
    )
  (defun find-at-config ()
    "find-file starting at emacs config"
    (interactive)
    (counsel-find-file user-emacs-directory)
    )
  (defun gcc/eval-last-sexp-or-region ()
      "run `eval-last-sexp` unless reigon is active in which case eval-region"
    (interactive)
    (message (eq mark-active t))
    (cond
     (mark-active (eval-last-sexp))
     (t (eval-region))
     )
    )
  :config
  (leader-lisp-def
    "l" 'load-current-elisp-file
    "f" 'find-at-config
    "x" 'eval-expression
    "e" 'gcc/eval-last-sexp-or-region
    )
  )
(use-package info
  :ensure nil
  :after evil
  :config
  )
(use-package artist
  :ensure nil
  :config
   ;;; integrate ido with artist-mode
  (defun artist-ido-select-operation (type)
    "Use ido to select a drawing operation in artist-mode"
    (interactive (list (ido-completing-read "Drawing operation: " 
					    (list "Pen" "Pen Line" "line" "straight line" "rectangle" 
						  "square" "poly-line" "straight poly-line" "ellipse" 
						  "circle" "text see-thru" "text-overwrite" "spray-can" 
						  "erase char" "erase rectangle" "vaporize line" "vaporize lines" 
						  "cut rectangle" "cut square" "copy rectangle" "copy square" 
						  "paste" "flood-fill"))))
    (artist-select-operation type))

  (defun artist-ido-select-settings (type)
    "Use ido to select a setting to change in artist-mode"
    (interactive (list (ido-completing-read "Setting: " 
					    (list "Set Fill" "Set Line" "Set Erase" "Spray-size" "Spray-chars" 
						  "Rubber-banding" "Trimming" "Borders"))))
    (if (equal type "Spray-size") 
	(artist-select-operation "spray set size")
      (call-interactively (artist-fc-get-fn-from-symbol 
			   (cdr (assoc type '(("Set Fill" . set-fill)
					      ("Set Line" . set-line)
					      ("Set Erase" . set-erase)
					      ("Rubber-banding" . rubber-band)
					      ("Trimming" . trimming)
					      ("Borders" . borders)
					      ("Spray-chars" . spray-chars))))))))
  )
(use-package doc-view
  :ensure nil
  :config
  (setq doc-view-resolution 144
	doc-view-continuous t)
  (general-define-key :keymaps 'doc-view-mode-map
    "j" 'doc-view-next-line-or-next-page
    "k" 'doc-view-previous-line-or-previous-page
    "l" 'image-forward-hscroll
    "h" 'image-backward-hscroll)
  )
(use-package flyspell-mode
  :ensure nil
  :hook org-mode
  )
