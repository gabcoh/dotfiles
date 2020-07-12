(use-package haskell-mode
  :ensure t
  :after evil
  :config
  (setq haskell-stylish-on-save t
	haskell-mode-stylish-haskell-path "/home/gabe/.local/bin/stylish-haskell")
  )
