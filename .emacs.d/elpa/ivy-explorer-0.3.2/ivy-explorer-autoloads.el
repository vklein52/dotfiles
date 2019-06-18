;;; ivy-explorer-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ivy-explorer" "ivy-explorer.el" (23782 53517
;;;;;;  619298 333000))
;;; Generated autoloads from ivy-explorer.el

(defvar ivy-explorer-mode nil "\
Non-nil if Ivy-Explorer mode is enabled.
See the `ivy-explorer-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ivy-explorer-mode'.")

(custom-autoload 'ivy-explorer-mode "ivy-explorer" nil)

(autoload 'ivy-explorer-mode "ivy-explorer" "\
Globally enable `ivy-explorer' for file navigation.

`ivy-explorer-mode' is a global minor mode which changes
`read-file-name-function' which is used for file completion.

When `ivy-explorer-enable-counsel-explorer' (by default it is),
`find-file' and `counsel-find-file' will be remapped to
`counsel-explorer.', too.

See `ivy-explorer-map' for bindings used in the minibuffer.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ivy-explorer-autoloads.el ends here
