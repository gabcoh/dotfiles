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
  (defvar org-ops-map (make-sparse-keymap)
    "Keymap for elisp operation shortcuts.")
  :config
  (require 'org-protocol)
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
  (general-def :states 'insert :keymaps 'org-mode-map
    "RET" '(lambda () (interactive) (org-return t))
    (kbd "<S-return>") 'org-insert-heading
    (kbd "<M-return>") 'org-meta-return
    )
  (general-def :states '(insert normal) :keymaps 'org-mode-map
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
