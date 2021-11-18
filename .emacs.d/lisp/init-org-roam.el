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
