(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (defun gcc/pdf-view-medium-previous-line-or-previous-page ()
    (interactive)
    (pdf-view-previous-line-or-previous-page 10)
    )
  (defun gcc/pdf-view-medium-next-line-or-next-page ()
    (interactive)
    (pdf-view-next-line-or-next-page 10)
    )
  (general-define-key :keymaps 'pdf-view-mode-map
    "j" 'pdf-view-next-line-or-next-page
    "J" 'gcc/pdf-view-medium-next-line-or-next-page
    "k" 'pdf-view-previous-line-or-previous-page
    "K" 'gcc/pdf-view-medium-previous-line-or-previous-page
    "l" 'image-forward-hscroll
    "h" 'image-backward-hscroll)
  (general-define-key :keymaps 'pdf-outline-buffer-mode-map
    "j" 'next-line
    "k" 'previous-line)
  )
