(use-package anki-editor
  :ensure t)
(use-package company
  :ensure t
  :config
  (global-company-mode))
(use-package doom-modeline
  :ensure t
  :after evil
  :init (doom-modeline-mode 1)
  )
;; This file contains the initialization for all built in emacs packages
(defun gcc/with-default-directory ()
  (interactive)
  (let (old-default-directory default-directory)
    (setq default-directory (read-directory-name "default-directory: "))
    (counsel-M-x)
    (setq default-directory old-default-directory)
    )
  )
(use-package emacs
  :config
  (setq backup-directory-alist `(("." . "~/.saves"))
	auto-save-file-name-transforms `((".*" "~/.saves/" t))
	custom-file (expand-file-name "./emacs-custom.el" user-emacs-directory)
	inhibit-startup-screen t
	exec-path (append exec-path '("~/.local/bin"))

	)
  (load custom-file)
  (setq-default fill-column 80)
  (dolist (mode '(org-mode-hook text-mode-hook))
	  (add-hook mode 'turn-on-auto-fill))
  (set-face-attribute 'default nil :height 130)
  (winner-mode)
  (server-start)
  (global-auto-revert-mode t)
  )
(use-package compile
  :ensure nil
  :straight '(:type built-in)
  :config
  (leader-lang-def
   "c" 'compile)
  (add-hook 'compilation-finish-functions
	    (lambda (buf str)
	      (if (null (string-match ".*exited abnormally.*" str))
		  ;;no errors, make the compilation window go away in a few seconds
		  (progn
		    (run-at-time
		     "2 sec" nil 'quit-windows-on
		     (get-buffer-create "*compilation*"))
		    (message "No Compilation Errors!")))))
  )
(use-package paren
  :ensure nil
  :straight '(:type built-in)
  :config
  (show-paren-mode 1)
  )
(use-package tool-bar
  :ensure nil
  :straight '(:type built-in)
  :config
  (tool-bar-mode -1)
  )
;; (use-package ido
;;   :config
;;   (ido-mode 1)
;;   )
(use-package dired
  :ensure nil
  :straight '(:type built-in)
  :after evil
  :config
  (leader-files-def
    "d" 'dired)
  )
(use-package elisp-mode
  :ensure nil
  :straight '(:type built-in)
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
  :config
  (leader-lisp-def
    "l" 'load-current-elisp-file
    "f" 'find-at-config
    "x" 'eval-expression
    "p" 'eval-last-sexp
    "P" 'eval-print-last-sexp
    )
  )
(use-package info
  :ensure nil
  :straight '(:type built-in)
  :after evil
  :config
  )
(use-package artist
  :ensure nil
  :straight '(:type built-in)
  :config
  (general-define-key :states '(normal motion) :keymaps 'artist-mode-map
		      "RET" 'artist-key-set-point
		      "h" 'artist-backward-char
		      "j" 'artist-next-line
		      "k" 'artist-previous-line
		      "l" 'artist-forward-char)
   ;;; integrate ido with artist-mode
  (defun artist-ido-select-operation (type)
    "Use ido to select a drawing operation in artist-mode"
    (interactive (list (completing-read "Drawing operation: " 
					    (list "Pen" "Pen Line" "line" "straight line" "rectangle" 
						  "square" "poly-line" "straight poly-line" "ellipse" 
						  "circle" "text see-thru" "text-overwrite" "spray-can" 
						  "erase char" "erase rectangle" "vaporize line" "vaporize lines" 
						  "cut rectangle" "cut square" "copy rectangle" "copy square" 
						  "paste" "flood-fill"))))
    (artist-select-operation type))

  (defun artist-ido-select-settings (type)
    "Use ido to select a setting to change in artist-mode"
    (interactive (list (completing-read "Setting: " 
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
  :straight '(:type built-in)
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
  :straight '(:type built-in)
  :hook org-mode
  )

(use-package edebug
  :ensure nil
  :straight '(:type built-in)
  :config
  (general-define-key :states 'normal :keymaps 'edebug-mode-map
		      "TAB" 'edebug-step-mode
		      )
  )
(use-package comint
  :ensure nil
  :straight '(:type built-in)
  :config
  (general-define-key :states 'normal :keymaps 'comint-mode-map
		      "s-r" 'comint-history-isearch-backward-regexp
		      )
  )
(use-package type-break
  :ensure nil
  :straight '(:type built-in)
  :hook (after-init . type-break-mode)
  )
(use-package undo-tree
  :ensure nil
  :straight '(:type built-in)
  :hook (after-init . global-undo-tree-mode)
  )
;; TODO check to see if you need 

(defmacro ido-force-open-in-same-window (func)
"Force ido to open resulting buffer in same window"
`(lambda () (interactive)
    ;; only open in same window if its not the Ido Completion window
    ;; this may not be necessary because it doesn't seem like ido
    ;; opens that buffer with display buffer
    (let ((ido-default-buffer-method 'selected-window)
	    (display-buffer-alist (cons '("^(?!.\*Ido Completions\*).*$" (display-buffer-same-window))
					display-buffer-alist))
	    )
	(,func)
	)
    ))
(defun kill-current-buffer ()
"Kill the current buffer"
(interactive)
(kill-buffer)
)

(use-package evil
  :after (general)
  :hook (after-init . evil-mode)
  :demand
  :config
  (setq evil-vsplit-window-right t
	evil-split-window-below t)

  (general-def
    :states '(normal motion emacs)
    :keymaps 'gcc/customs-mode-map
    "SPC SPC" 'execute-extended-command)

  (defun paste-star-after ()
      (interactive)
    (evil-paste-after "*"))
  (defun paste-plus-after ()
      (interactive)
    (evil-paste-after "+"))
  (general-define-key :keymaps 'evil-insert-state-map
		      (general-chord "fd") 'evil-normal-state
		      (general-chord "q+") 'paste-plus-after
		      (general-chord "q*") 'paste-star-after)

  (general-def 'normal "U" 'undo-tree-visualize)

;;; Buffer commands functions ===== 
;;; Buffer commands bindings ===========
  (leader-buffer-def
	      ;;"b" (ido-force-open-in-same-window ido-switch-buffer)
	      "b" 'counsel-switch-buffer
	      "k" 'kill-current-buffer
	      "n" 'next-buffer
	      "p" 'previous-buffer
	      "." 'bury-buffer)

;;; Window commands functions ===== 
;;; Window commands bindings ===========
  (leader-window-def
	      "d" 'delete-window
	      "D" 'delete-other-windows
	      "q" 'quit-window
	      "%" 'evil-window-vnew
	      "-" 'evil-window-new
	      "h" 'evil-window-left
	      "H" 'evil-window-move-far-left
	      "j" 'evil-window-down
	      "J" 'evil-window-move-far-down
	      "k" 'evil-window-up
	      "K" 'evil-window-move-far-up
	      "l" 'evil-window-right
	      "L" 'evil-window-move-far-right
	      "=" 'balance-windows
	      "u" 'winner-undo
	      "r" 'winner-redo
	      "z" 'delete-other-windows)


;;; File commands functions ===== 
;;; File commands bindings ===========
  (leader-files-def
	      ;;"f" (ido-force-open-in-same-window ido-find-file)
	      "f" 'counsel-find-file
	      "w" 'find-file-other-window
	      "F" 'find-file-other-frame
	      "s" 'save-buffer)

;;; Elisp mode bindings

  ;; Get help easily
  (general-def :states '(normal motion emacs)
	      :keymaps 'gcc/customs-mode-map
	      :prefix "SPC"
	      "h" 'help-for-help)
  )
(use-package geiser
  :ensure t
  )
(use-package haskell-mode
  :ensure t
  :after evil
  :config
  (setq haskell-stylish-on-save t
	haskell-mode-stylish-haskell-path "/home/gabe/.local/bin/stylish-haskell")
  )
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map (kbd "S-SPC") nil)
  (general-def :keymaps 'ivy-minibuffer-map
    (kbd "<C-return>") 'ivy-immediate-done)
  )
(use-package ivy-hydra
  :ensure t)
(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))
  
(use-package key-chord
  :config
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-mode 1)
  )
(use-package leuven-theme
    :config
    (load-theme 'leuven t)
    )
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c++-mode . lsp)
         (c-mode . lsp)
         (rust-mode . lsp))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package magit
  :ensure t
  :init
  (general-def :states '(normal motion) :keymaps 'magit-mode-map
    "j" 'magit-next-line
    "k" 'magit-previous-line
    )
  :config
  (setenv "SSH_AUTH_SOCK" (shell-command-to-string "fish -c 'echo -n $SSH_AUTH_SOCK'"))
  (setenv "SSH_AGENT_PID" (shell-command-to-string "fish -c 'echo -n $SSH_AGENT_PID'"))
  )
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
(use-package org-board
  :after org)
(use-package org-noter
  :after org
  )
(use-package org-pomodoro
  :after org
  :ensure t
  )
(use-package org-roam
  :after org-protocol
  :ensure t
  :straight '(org-roam :type git :host github :repo "org-roam/org-roam-v1")
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Nextcloud/notes")
  (org-roam-completion-system 'ivy)
  (org-roam-dailies-directory "daily/")
  :config
  (setq org-roam-dailies-capture-templates
   `(("d" "default" entry
      #'org-roam-capture--get-point
      "* %?"
      :file-name ,(concat
		   (org-roam-dailies-directory--get-absolute-path)
		   "%<%Y-%m-%d>")
      :head "#+title: %<%Y-%m-%d>\n\n")))
  (require 'org-roam-protocol)
  (leader-org-def
    "r r" 'org-roam
    "r f" 'org-roam-find-file
    "r g" 'org-roam-graph-show
    "r d t" 'org-roam-dailies-find-today
    "r d p" 'org-roam-dailies-find-previous-note
    "r d n" 'org-roam-dailies-find-next-note
    )
  (leader-org-def :keymaps 'org-mode-map
    "r i" 'org-roam-insert
    "r I" 'org-roam-insert-immediate))
(use-package org
  :after evil
  :init
  (setq
   org-notes-dir "~/Nextcloud/notes/"
   org-default-notes-file "~/Nextcloud/notes/inbox.org"
   org-agenda-files '("~/Nextcloud/notes/inbox.org"
		      "~/Nextcloud/notes/20210119155139-audo_ai.org"
		      "~/Nextcloud/notes/20201118095132-soybean_innovation_lab.org")
   org-refile-targets '((org-agenda-files :tag . "refile"))
   org-return-follow-link t
   org-agenda-restore-windows-after-quit t
   )
  (defun ido-at-org ()
    "ido-find-file starting at emacs config"
    (interactive)
    (ido-find-file-in-dir org-notes-dir)
    )
  :config
  (require 'org-protocol)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (ditaa . t)
     (emacs-lisp . t)))
  (leader-org-def
    "a" 'org-agenda
    "c" 'org-capture
    "f" 'ido-at-org)
  (leader-org-def
    "k o" 'org-clock-out
    "k i" 'org-clock-in
    "k l" 'org-clock-in-last
    "k r" 'org-clock-report
    "k u" 'org-clock-update-time-maybe)
  (leader-org-def
    "l t" 'org-toggle-link-display
    "o" 'org-open-at-point
    "t" 'org-todo
    "x" 'org-archive-subtree
    "g" 'counsel-org-tag
    "p" 'org-set-property
    "l p" 'org-latex-preview
    )
  (general-def :states '(normal motion emacs)
	      :keymaps 'org-mode-map
	      "TAB" 'org-cycle)
  (general-def :states 'insert :keymaps 'org-mode-map
    "TAB" 'org-indent-line
    "RET" 'org-return 
    (kbd "<S-return>") 'org-insert-heading
    (kbd "<M-return>") 'org-meta-return
    )
  (general-def :states '(insert normal) :keymaps 'org-mode-map
    (kbd "C-<S-right>") 'org-demote-subtree
    (kbd "C-<S-left>") 'org-promote-subtree
    (kbd "<C-right>") 'org-do-demote
    (kbd "<C-left>")  'org-do-promote)

  (general-def :keymaps 'org-agenda-mode-map
    "h" 'org-agenda-earlier
    "l" 'org-agenda-later
    "j" 'org-agenda-next-line
    "k" 'org-agenda-previous-line
    (kbd "<S-return>") 'org-agenda-show-and-scroll-up)
  (add-hook 'org-agenda-mode-hook 'hl-line-mode)
  )
(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (defun gcc/pdf-view-medium-previous-line-or-previous-page ()
    (interactive)
    (pdf-view-previous-line-or-previous-page 10)
    )
  (defun gcc/pdf-view-medium-next-line-or-next-page ()
    (interactive)
    (pdf-view-next-line-or-next-page 10)
    )
  (general-define-key :keymaps 'pdf-view-mode-map
    "j" 'pdf-view-next-line-or-next-page
    "J" 'gcc/pdf-view-medium-next-line-or-next-page
    "k" 'pdf-view-previous-line-or-previous-page
    "K" 'gcc/pdf-view-medium-previous-line-or-previous-page
    "l" 'image-forward-hscroll
    "h" 'image-backward-hscroll)
  (general-define-key :keymaps 'pdf-outline-buffer-mode-map
    "j" 'next-line
    "k" 'previous-line)
  )
(use-package projectile
  :after evil
  :config

  (general-def
    :states '(normal motion emacs)
    :keymaps 'gcc/customs-mode-map
    "SPC p w" 'projectile-find-file-other-window
    "SPC p F" 'projectile-find-file-other-frame
    "SPC p f" 'projectile-find-file
    "SPC p m" 'projectile-command-map
    "SPC p b" 'projectile-switch-to-buffer
    )
  )
(use-package purescript-mode
  :ensure t)
(use-package pyvenv
  :ensure t
  )
(use-package rust-mode
  :ensure t
  )
(use-package typescript-mode
  :ensure t)
(use-package utop
  :ensure t
  :config
  (setq utop-command "opam config exec -- utop -emacs"))
(use-package yaml-mode
  :ensure t
  :after evil
  )
(use-package yasnippet
  :ensure t
  :commands (yas-minor-mode) ; autoload `yasnippet' when `yas-minor-mode' is called
                                        ; using any means: via a hook or by user
                                        ; Feel free to add more commands to this
                                        ; list to suit your needs.
  :init ; stuff to do before requiring the package
  (progn
    (add-hook 'latex-mode-hook #'yas-minor-mode)
    (add-hook 'prog-mode-hook #'yas-minor-mode))
  :config ; stuff to do after requiring the package
  (progn
    (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    (yas-reload-all)))

