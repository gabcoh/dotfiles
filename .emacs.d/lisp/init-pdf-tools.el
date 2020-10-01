(use-package pdf-tools
  :ensure t
  :config
  (general-define-key :keymaps 'pdf-view-mode-map
    "j" 'pdf-view-next-line-or-next-page
    "k" 'pdf-view-previous-line-or-previous-page
    "l" 'image-forward-hscroll
    "h" 'image-backward-hscroll)
  )
