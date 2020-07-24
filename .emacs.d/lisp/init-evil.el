;; TODO check to see if you need 

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

(use-package evil
  :after (general)
  :hook (after-init . evil-mode)
  :demand
  :config

  (general-def
    :states '(normal motion)
    :keymaps 'override
    ":" 'execute-extended-command)

  (general-define-key :keymaps 'evil-insert-state-map
		      (general-chord "jk") 'evil-normal-state)

  (general-def 'normal "U" 'undo-tree-visualize)

;;; Buffer commands functions ===== 
;;; Buffer commands bindings ===========
  (leader-buffer-def
	      ;;"b" (ido-force-open-in-same-window ido-switch-buffer)
	      "b" 'counsel-switch-buffer
	      "k" 'kill-current-buffer
	      "n" 'next-buffer
	      "p" 'previous-buffer
	      "." 'bury-buffer)

;;; Window commands functions ===== 
;;; Window commands bindings ===========
  (leader-window-def
	      "d" 'delete-window
	      "D" 'delete-other-windows
	      "q" 'quit-window
	      "%" 'evil-window-vnew
	      "-" 'evil-window-new
	      "h" 'evil-window-left
	      "H" 'evil-window-move-far-left
	      "j" 'evil-window-down
	      "J" 'evil-window-move-far-down
	      "k" 'evil-window-up
	      "K" 'evil-window-move-far-up
	      "l" 'evil-window-right
	      "L" 'evil-window-move-far-right
	      "=" 'balance-windows
	      "u" 'winner-undo
	      "r" 'winner-redo
	      "z" 'delete-other-windows)


;;; File commands functions ===== 
;;; File commands bindings ===========
  (leader-files-def
	      ;;"f" (ido-force-open-in-same-window ido-find-file)
	      "f" 'counsel-find-file
	      "s" 'save-buffer)

;;; Elisp mode bindings

  ;; Get help easily
  (general-def :states '(normal motion)
	      :keymaps 'override'
	      :prefix "SPC"
	      "h" 'help-for-help)
  )
