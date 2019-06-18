(deftheme goodwombat
  "Created 2019-05-29.")

(custom-theme-set-variables
 'goodwombat
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes (quote ("b212cf89712496378a6bce4779935dc8c622869bb3944652e67052496a1ade16" default))))

(custom-theme-set-faces
 'goodwombat
 '(font-lock-builtin-face ((t (:foreground "sienna"))))
 '(font-lock-variable-name-face ((t (:foreground "aquamarine"))))
 '(font-lock-keyword-face ((t (:foreground "orchid"))))
 '(font-lock-type-face ((t (:foreground "deep sky blue"))))
 '(font-lock-function-name-face ((t (:foreground "orange"))))
 '(font-lock-string-face ((t (:foreground "dark violet"))))
 '(font-lock-comment-face ((t (:foreground "orange red")))))

(provide-theme 'goodwombat)
