(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t)
 '(ls-lisp-dirs-first t)
 '(ls-lisp-format-time-list (quote ("" "")))
 '(ls-lisp-use-localized-time-format t)
 '(ls-lisp-verbosity nil)
 '(major-mode (quote text-mode))
 '(rainbow-delimiters-max-face-count 9)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 130 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "olive drab"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "saddle brown"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "peru"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "dark magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "chartreuse"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "orange"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "cornflower blue"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "magenta")))))

(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
;; M-x package-install

(electric-indent-mode -1)
(column-number-mode 1)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq require-final-newline t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'text-mode-hook #'rainbow-delimiters-mode)

;; Type C-q <TAB> to insert a horizontal tab character.
(setq-default indent-tabs-mode nil)
;; to remove tabs: C-x h (to mark all), then M-x untabify

;(require 'whitespace) ; M-x whitespace-mode

(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; M-x describe-bindings
;; C-/ undo
;; C-w cut region

;; Safe file with specific charset:
;(setq coding-system-for-write 'latin-1)
(setq coding-system-for-write 'utf-8)

(setq kill-whole-line t)
(global-set-key "\C-j" (lambda ()
                         (interactive)
                         (let ((kill-whole-line nil))
                           (kill-line))))

;(global-set-key "\C-z" 'yank) ;; helps in migrating from qwertz to qwerty...

(setq scroll-step 1)

(require 'paren)
(show-paren-mode 1)

(require 'multiple-cursors)
(define-key mc/keymap (kbd "<return>") nil)
(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "\C-cm") 'mark-words-like-this)

(defun mark-words-like-this ()
  (interactive)
  (unless (use-region-p)
    (left-word)
    (mark-word))
  (mc/mark-all-like-this))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)

(global-set-key"\C-xl" 'split-window-below)
(global-set-key"\C-xi" 'split-window-right)

;; \C-x ( to start recording, \C-x ) to end.
;; \C-x e to execute last macro, just e to repeat!

(global-set-key "\C-b" 'delete-backward-char) ;; unbound by default!
;; \C-d is delete char
;; \C-r is backward-i-search

;; C-v is page down, M-v is page up
;; reminder: transpose functions can be useful.

(global-set-key  [(control return)] 'insert-line-after-current)
(defun insert-line-after-current ()
  (interactive)
  (move-beginning-of-line nil)
  (next-line)
  (newline)
  (previous-line))

(global-set-key "\M-m"
                (lambda ()
                  (interactive)
                  (shell-command (format "cd %s && make"
                                         (vc-find-root buffer-file-name "Makefile")))))

;; don't ask, just do it:
(global-set-key "\C-xk" (lambda ()
                         (interactive)
                         (kill-buffer nil)))

(global-set-key "\C-ce" 'end-of-buffer)
(global-set-key "\C-ca" 'beginning-of-buffer)

(global-set-key "\C-cb" 'backslash-macro)
(defun backslash-macro ()
  (interactive)
  (save-excursion
    (mark-paragraph)
    (search-forward-regexp "^#define")
    (c-backslash-region (point) (mark) nil)))

(which-function-mode 1)

(defun yes-or-no-p (arg)
  (y-or-n-p arg))

;; WORKED -----------------------
(defmacro add-tab-completion (hook)
  `(add-hook ,hook
             (lambda ()
               (local-set-key "\t"
                              (lambda ()
                                (interactive)
                                (if (looking-at "\\>")
                                    (dabbrev-expand nil)
                                  (indent-for-tab-command)))))))
(add-tab-completion 'c++-mode-hook)
(add-tab-completion 'c-mode-hook)
(add-tab-completion 'lisp-mode-hook)

;; by default on Ubuntu 14.10, the circumflex is unusable. Meh.
;(global-set-key (kbd "<dead-circumflex>")
;                (lambda ()
;                  (interactive)
;                  (insert-char #x5e)))

;; by default on Ubuntu 14.10, the backtick is unusable. Meh.
;(global-set-key (kbd "<dead-acute>")
;                (lambda ()
;                  (interactive)
;                  (insert-char #x60)))
;; (global-set-key (kbd "<dead-grave>")
;;                 (lambda ()
;;                   (interactive)
;;                   (insert-char #x60)))

;;;;;;;;; style I want to use in c mode ;;;;;;;;;;;
;(c-add-style "my-c-style" '("gnu" (indent-tabs-mode . t)))
(c-add-style "my-c-style" '("k&r" (c-basic-offset . 2)))
(add-hook 'c-mode-hook (lambda () (c-set-style "my-c-style")))
 
;;;;;;;;;;;; Scheme ;;;;;;;;;;
;; (setq scheme-program-name "guile")
;; (global-set-key "\C-cs" (lambda ()
;;                           (interactive)
;;                           (run-scheme "guile")))
;; C-x C-e evaluates last sexpr, like in elisp mode!

;(setq indent-line-function 'indent-relative)

;;;;;;;;;;;; syntax coloring ;;;;;;;;;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp")
(load-theme 'minimal-dark t)

;; stic
;(push "~/.emacs.d/lisp" load-path)
;(require 'stic-mode)

;; Wok and Assembly
(setq auto-mode-alist (append '(("\\.s$"   . fundamental-mode)
                                ("\\.asm$" . fundamental-mode)
                                ("\\.wok$" . fundamental-mode))
      auto-mode-alist))

;; JavaScript
(setq js-indent-level 2)
(setq js-switch-indent-offset 2)

;; Ruby
(setq ruby-insert-encoding-magic-comment nil)
