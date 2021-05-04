(use-package yasnippet
  :ensure t
  :commands (yas-minor-mode) ; autoload `yasnippet' when `yas-minor-mode' is called
                                        ; using any means: via a hook or by user
                                        ; Feel free to add more commands to this
                                        ; list to suit your needs.
  :init ; stuff to do before requiring the package
  (progn
    (add-hook 'latex-mode-hook #'yas-minor-mode)
    (add-hook 'prog-mode-hook #'yas-minor-mode))
  :config ; stuff to do after requiring the package
  (progn
    (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    (yas-reload-all)))

