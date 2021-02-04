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
