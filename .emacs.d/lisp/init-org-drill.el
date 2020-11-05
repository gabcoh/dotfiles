(use-package org-drill
  :ensure t
  :after org-roam
  :config
  (setq org-drill-scope (org-roam--list-files org-roam-directory))
  )
