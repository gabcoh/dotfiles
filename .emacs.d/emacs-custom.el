(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default-input-method "latin-prefix")
 '(doom-modeline-buffer-file-name-style (quote truncate-upto-project))
 '(haskell-stylish-on-save t)
 '(menu-bar-mode nil)
 '(org-agenda-files
   (quote
    ("~/Nextcloud/notes/org/Anamorphic.org" "~/Nextcloud/notes/org/Anki.org" "~/Nextcloud/notes/org/Argumennts.org" "~/Nextcloud/notes/org/Artificial Intelligence.org" "~/Nextcloud/notes/org/BWCA May 2020.org" "~/Nextcloud/notes/org/Blender.org" "~/Nextcloud/notes/org/Climate.org" "~/Nextcloud/notes/org/Default Notes.org" "~/Nextcloud/notes/org/Effective Altruism.org" "~/Nextcloud/notes/org/Emacs.org" "~/Nextcloud/notes/org/Ethics.org" "~/Nextcloud/notes/org/Existential Risk.org" "~/Nextcloud/notes/org/Exquisite_Corpse.org" "~/Nextcloud/notes/org/Fermi_Paradox.org" "~/Nextcloud/notes/org/GTD.org" "~/Nextcloud/notes/org/Gamepad Typing.org" "~/Nextcloud/notes/org/Games.org" "~/Nextcloud/notes/org/Garmin MTP Explorations.org" "~/Nextcloud/notes/org/Haskell 3d Grapher.org" "~/Nextcloud/notes/org/Haskell.org" "~/Nextcloud/notes/org/Interesting Graphics Projects.org" "~/Nextcloud/notes/org/John_Deere.org" "~/Nextcloud/notes/org/Linux.org" "~/Nextcloud/notes/org/Logic.org" "~/Nextcloud/notes/org/Nature of the Universe.org" "~/Nextcloud/notes/org/Pandemics.org" "~/Nextcloud/notes/org/Politics.org" "~/Nextcloud/notes/org/Projects.org" "~/Nextcloud/notes/org/Rationality.org" "~/Nextcloud/notes/org/Reading list.org" "~/Nextcloud/notes/org/Relief Effort.org" "~/Nextcloud/notes/org/Reverse Engineering.org" "~/Nextcloud/notes/org/Vegetarianism.org" "~/Nextcloud/notes/org/WTF Is Going on_.org" "~/Nextcloud/notes/org/Writing.org")))
 '(org-capture-templates
   (quote
    (("d" "diary" entry
      (file+olp+datetree org-default-notes-file "Diary")
      "* %U
     %?")
     ("t" "todo" entry
      (file+olp org-default-notes-file "Tasks" "Unfiled")
      "* TODO %?")
     ("a" "appointment or scheduled event" entry
      (file+olp+datetree org-default-notes-file "Appointments")
      "* %?
 %T" :time-prompt t))))
 '(package-selected-packages
   (quote
    (ivy-hydra counsel ivy evil org-drill org-roam-protoco org-roam-protocol org-protocol general pyvenv pyenv emacsql-sqlite3 org-roam geiser leuven-theme org-noter flyspell-mode web-mode yaml-mode doom-modeline haskell-mode which-key use-package key-chord evil-leader evil-collection)))
 '(type-break-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
