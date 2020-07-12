;; TODO check to see if you need 
(use-package evil
  :after (ido key-chord)
  :hook (after-init . evil-mode)
  :demand
  :init
  (setq leader-key " ")
  (defvar leader-map (make-sparse-keymap)
    "Keymap for \"leader key\" shortcuts.")
  (defvar file-ops-map (make-sparse-keymap)
    "Keymap for file operation shortcuts.")
  (defvar buffer-ops-map (make-sparse-keymap)
    "Keymap for buffer operation shortcuts.")
  (defvar window-ops-map (make-sparse-keymap)
    "Keymap for window operation shortcuts.")
  (defun leader-add-leader (map)
    (evil-define-key '(normal motion) map leader-key leader-map)
    )
  (defmacro ido-force-open-in-same-window (func)
    "Force ido to open resulting buffer in same window"
    `(lambda () (interactive)
       ;; only open in same window if its not the Ido Completion window
       ;; this may not be necessary because it doesn't seem like ido
       ;; opens that buffer with display buffer
       (let ((ido-default-buffer-method 'selected-window)
	     (display-buffer-alist (cons '("^(?!.\*Ido Completions\*).*$" (display-buffer-same-window))
					 display-buffer-alist))
	     )
	 (,func)
	 )
       ))
  (defun kill-current-buffer ()
    "Kill the current buffer"
    (interactive)
    (kill-buffer)
    )
  :config
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

  (define-key evil-normal-state-map "U" 'undo-tree-visualize)

;;; Helper functions

  (evil-global-set-key 'motion leader-key leader-map)

;;; Buffer commands functions ===== 
;;; Buffer commands bindings ===========
  (define-key leader-map "b" buffer-ops-map)

  (define-key buffer-ops-map "b" (ido-force-open-in-same-window ido-switch-buffer))
  (define-key buffer-ops-map "k" 'kill-current-buffer)
  (define-key buffer-ops-map "n" 'next-buffer)
  (define-key buffer-ops-map "p" 'previous-buffer)
  (define-key buffer-ops-map "." 'bury-buffer)

;;; Window commands functions ===== 
;;; Window commands bindings ===========
  (define-key leader-map "w" window-ops-map)

  (define-key window-ops-map "d" 'delete-window)
  (define-key window-ops-map "q" 'quit-window)
  (define-key window-ops-map "%" 'evil-window-vnew)
  (define-key window-ops-map "-" 'evil-window-new)
  (define-key window-ops-map "h" 'evil-window-left)
  (define-key window-ops-map "H" 'evil-window-move-far-left)
  (define-key window-ops-map "j" 'evil-window-down)
  (define-key window-ops-map "J" 'evil-window-move-far-down)
  (define-key window-ops-map "k" 'evil-window-up)
  (define-key window-ops-map "K" 'evil-window-move-far-up)
  (define-key window-ops-map "l" 'evil-window-right)
  (define-key window-ops-map "L" 'evil-window-move-far-right)
  (define-key window-ops-map "=" 'balance-windows)
  (define-key window-ops-map "u" 'winner-undo)
  (define-key window-ops-map "r" 'winner-redo)
  (define-key window-ops-map "z" 'delete-other-windows)


;;; File commands functions ===== 
;;; File commands bindings ===========
  (define-key leader-map "f" file-ops-map)

  (define-key file-ops-map "f" (ido-force-open-in-same-window ido-find-file))
  (define-key file-ops-map "s" 'save-buffer)

;;; Elisp mode bindings

  ;; Get help easily
  (define-key leader-map "h" 'help-for-help)

  ;; misc mode leader setup
  (leader-add-leader Buffer-menu-mode-map)
  )
