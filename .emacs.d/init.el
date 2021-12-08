;; start of init.el

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
;; This is apparently necessary to prevent the old versoin of org shipped with
;; emacs from loading and messing things up. My real (use-package 'org) still
;; runs my config
(straight-use-package 'org)
(setq straight-use-package-by-default :t)

;; Define custom minor mode
(defvar gcc/customs-mode-map (make-sparse-keymap)
  "")
;; Define my custom minor mode!
(define-minor-mode gcc/customs-mode
  "my custom space prefix based mappings"
  :lighter " gcc/c"
  :keymap gcc/customs-mode-map
  :group 'gcc
  :init-value t)

(gcc/customs-mode t)

;; Guarantee general loads before all other packages so that it can provide :general
(use-package general
  :defer f
  :ensure t
  :config
  (setq general-non-normal-states '(insert hybrid iedit-insert))

  (general-create-definer leader-lang-def
    :states '(normal insert motion emacs)
    :keymaps 'gcc/customs-mode-map
    :prefix "SPC m"
    :non-normal-prefix "C-SPC f")
  (general-create-definer leader-files-def
    :states '(normal insert motion emacs)
    :keymaps 'gcc/customs-mode-map
    :prefix "SPC f"
    :non-normal-prefix "C-SPC f")
  (general-create-definer leader-org-def
    :states '(normal insert motion emacs)
    :keymaps 'gcc/customs-mode-map
    :prefix "SPC o"
    :non-normal-prefix "C-SPC o")
  (general-create-definer leader-window-def
    :states '(normal insert motion emacs)
    :keymaps 'gcc/customs-mode-map
    :prefix "SPC w"
    :non-normal-prefix "C-SPC w")
  (general-create-definer leader-buffer-def
    :states '(normal insert motion emacs)
    :keymaps 'gcc/customs-mode-map
    :prefix "SPC b"
    :non-normal-prefix "C-SPC b")
  (general-create-definer leader-lisp-def
    :states '(normal insert motion emacs)
    :keymaps 'gcc/customs-mode-map
    :prefix "SPC l"
    :non-normal-prefix "C-SPC l")
  (general-create-definer leader-mode-def
    :states '(normal insert motion emacs)
    :keymaps 'gcc/customs-mode-map
    :prefix "SPC m"
    :non-normal-prefix "C-SPC m")
  (general-def :states '(normal)
    (kbd "S-SPC S-SPC")  'repeat-complex-command)
  )

(load (expand-file-name "./init-packages.el" user-emacs-directory))

  ;; end of init.el
