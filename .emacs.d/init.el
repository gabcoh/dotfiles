;; start of init.el

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; Setting up the package manager. Install if missing.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t))

;; 
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

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
  )

(dolist (file (directory-files
	       (expand-file-name "lisp" user-emacs-directory)
	       t
	       ".*\.el$"))
  (load file))
  ;; end of init.el
