(use-package magit
  :ensure t
  :init
  (general-def :states '(normal motion) :keymaps 'magit-mode-map
    "j" 'magit-next-line
    "k" 'magit-previous-line
    )
  :config
  (setenv "SSH_AUTH_SOCK" (shell-command-to-string "fish -c 'echo -n $SSH_AUTH_SOCK'"))
  (setenv "SSH_AGENT_PID" (shell-command-to-string "fish -c 'echo -n $SSH_AGENT_PID'"))
  )
