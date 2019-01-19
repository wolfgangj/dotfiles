;; (add-to-list 'custom-theme-load-path "~/.emacs.d/lisp")
;; (load-theme 'minimal-dark t)

(deftheme minimal-dark
  "A minimal theme")

(let ((bg       (if (display-graphic-p) "#000000" "none"))
      (cursor   "#ffffff")
      (comment  "#996666")
      (string   "#5f8787")
      (text     "#cccccc"))

  (custom-theme-set-faces
   'minimal-dark
   
   `(default ((t (:foreground ,text :background ,bg))))
   `(cursor  ((t (:background ,cursor))))
   
   `(font-lock-string-face            ((t (:foreground ,string))))
   `(font-lock-doc-face               ((t (:foreground ,string))))
   `(font-lock-comment-face           ((t (:foreground ,comment))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comment))))
   `(font-lock-constant-face          ((t (:foreground ,text))))
   `(font-lock-function-name-face     ((t (:foreground ,text))))
   `(font-lock-variable-name-face     ((t (:foreground ,text))))
   `(font-lock-builtin-face           ((t (:foreground ,text))))
   `(font-lock-keyword-face           ((t (:foreground ,text))))
   `(font-lock-type-face              ((t (:foreground ,text))))
   )

  (custom-theme-set-variables 'minimal-dark)
)

(provide-theme 'minimal-dark)
