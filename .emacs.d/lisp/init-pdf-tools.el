(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (general-define-key :keymaps 'pdf-view-mode-map
    "j" 'pdf-view-next-line-or-next-page
    "k" 'pdf-view-previous-line-or-previous-page
    "l" 'image-forward-hscroll
    "h" 'image-backward-hscroll)
  )
