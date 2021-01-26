(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map (kbd "S-SPC") nil)
  )
(use-package ivy-hydra
  :ensure t)
(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))
  
