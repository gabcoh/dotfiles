(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(default-input-method "latin-prefix")
 '(doom-modeline-buffer-file-name-style 'truncate-upto-project)
 '(haskell-stylish-on-save t)
 '(hl-sexp-background-color "#efebe9")
 '(menu-bar-mode nil)
 '(org-agenda-files '("~/Nextcloud/notes/inbox.org"))
 '(org-capture-templates
   '(("l" "link/toread" entry
      (file+olp org-default-notes-file "Tasks" "Reading List")
      "* TODO %:description
  %:link" :immediate-finish t)
     ("d" "diary" entry
      (file+olp+datetree org-default-notes-file "Diary")
      "* %U
     %?")
     ("t" "todo" entry
      (file+olp org-default-notes-file "Tasks" "Unfiled")
      "* TODO %?")
     ("a" "appointment or scheduled event" entry
      (file+olp+datetree org-default-notes-file "Appointments")
      "* %?
 %T" :time-prompt t)))
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.25 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-preview-latex-image-directory "/tmp/ltximg/")
 '(package-selected-packages
   '(pdf-tools markdown-mode ivy-hydra counsel ivy evil org-drill org-roam-protoco org-roam-protocol org-protocol general pyvenv pyenv emacsql-sqlite3 org-roam geiser leuven-theme org-noter flyspell-mode web-mode yaml-mode doom-modeline haskell-mode which-key use-package key-chord evil-leader evil-collection))
 '(safe-local-variable-values
   '((auto-revert-mode . t)
     (org-refile-targets
      (nil :maxlevel . 2))
     (org-refile-targets
      (nil :maxlevel . 3))
     (org-refile-targets
      (:maxlevel . 3))))
 '(type-break-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
