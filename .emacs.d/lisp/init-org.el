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
  (define-key leader-map "o" org-ops-map)

  (global-set-key (kbd "C-c l") 'org-store-link)
  (define-key org-ops-map "a" 'org-agenda)
  (define-key org-ops-map "c" 'org-capture)
  (define-key org-ops-map "f" 'ido-at-org)
  )
