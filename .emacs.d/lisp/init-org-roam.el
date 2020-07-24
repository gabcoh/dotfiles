(use-package org-roam
  :after org-protocol
  :ensure t
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/Nextcloud/notes/org")
  (org-roam-completion-system 'ivy)
  :config
  (require 'org-roam-protocol)
  (leader-org-def
    "r r" 'org-roam
    "r f" 'org-roam-find-file
    "r g" 'org-roam-graph-show)
  (leader-org-def :keymaps 'org-mode-map
    "r i" 'org-roam-insert
    "r I" 'org-roam-insert-immediate))
