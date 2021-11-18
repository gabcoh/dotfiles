(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map (kbd "S-SPC") nil)
  (general-def :keymaps 'ivy-minibuffer-map
    (kbd "<C-return>") 'ivy-immediate-done)
  )
(use-package ivy-hydra
  :ensure t)
(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))
  
