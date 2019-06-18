(deftheme vklein
  "Created 2019-05-29.")

(custom-theme-set-variables
 'vklein
 '(package-selected-packages (quote (ivy-explorer hydra ivy company))))

(custom-theme-set-faces
 'vklein
 '(font-lock-builtin-face ((t (:foreground "color-105"))))
 '(font-lock-function-name-face ((t (:foreground "cyan"))))
 '(font-lock-string-face ((t (:foreground "color-34"))))
 '(font-lock-type-face ((t (:foreground "red")))))

(provide-theme 'vklein)
