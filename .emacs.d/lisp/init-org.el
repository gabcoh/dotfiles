(use-package org
  :after evil
  :init
  (setq
   org-notes-dir "~/Nextcloud/notes/"
   org-default-notes-file "~/Nextcloud/notes/inbox.org"
   org-agenda-files '("~/Nextcloud/notes/inbox.org")
   org-refile-targets '((org-agenda-files :maxlevel . 2))
   org-return-follow-link t
   org-agenda-restore-windows-after-quit t
   )
  (defun ido-at-org ()
    "ido-find-file starting at emacs config"
    (interactive)
    (ido-find-file-in-dir org-notes-dir)
    )
  (defvar org-ops-map (make-sparse-keymap)
    "Keymap for elisp operation shortcuts.")
  :config
  (require 'org-protocol)
  (leader-org-def
    "a" 'org-agenda
    "c" 'org-capture
    "f" 'ido-at-org)
  (leader-org-def
    "o" 'org-open-at-point
    "t" 'org-todo
    "x" 'org-archive-subtree
    "g" 'counsel-org-tag
    "p" 'org-set-property
    "l p" 'org-latex-preview
    )
  (general-def :states 'insert :keymaps 'org-mode-map
    "RET" '(lambda () (interactive) (org-return t))
    (kbd "<S-return>") '(lambda () (interactive) (org-return nil))
    )
  (general-def :states 'normal :keymaps 'org-mode-map
    (kbd "<C-right>") 'org-demote-subtree
    (kbd "<C-left>")  'org-promote-subtree)
  (general-def :keymaps 'org-agenda-mode-map
    "h" 'org-agenda-earlier
    "l" 'org-agenda-later
    "j" 'org-agenda-next-line
    "k" 'org-agenda-previous-line
    (kbd "<S-return>") 'org-agenda-show-and-scroll-up)
  (add-hook 'org-agenda-mode-hook 'hl-line-mode)
  )
