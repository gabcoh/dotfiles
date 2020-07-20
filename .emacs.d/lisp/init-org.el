(use-package org
  :after evil
  :init
  (setq
   org-notes-dir "~/Nextcloud/notes/org/"
   org-default-notes-file "~/Nextcloud/notes/org/inbox.org"
   org-agenda-files '("~/Nextcloud/notes/org/inbox.org")
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
  (leader-org-def :keymap org-mode-map
    "o" 'org-open-at-point
    "t" 'org-todo
    "x" 'org-archive-subtree
    "g" 'org-set-tags-command
    "p" 'org-set-property)

  ;; (global-set-key (kbd "C-c l") 'org-store-link)
  )
