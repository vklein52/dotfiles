;;; .emacs --- Emacs initialization

;; use melpa

;;; code:
(require 'package)
;; todo: remove the elpa directory from git
(defvar vklein-packages '(beacon
                          bind-key
                          company
                          counsel
                          dash
                          dumb-jump
                          epl
                          f
                          find-file-in-project
                          flycheck
                          haskell-mode
                          hydra
                          ivy
                          ivy-explorer
                          popup
                          pkg-info
                          rainbow-delimiters
                          s
                          seq
                          use-package
                          xkcd))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package vklein-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; enable use-package
(eval-when-compile
  (require 'use-package)
  (require 'flycheck))

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; load the packaged named xyz.
(load "hoon-mode") ;; best not to include the ending “.el” or “.elc”
(add-hook 'hoon-mode-hook
          (lambda () (electric-indent-local-mode -1)))
;; enable paired brackets
(electric-pair-mode t)

;; disable backup files
(setq make-backup-files nil)

;; change from gnu style to linux style for c like languages
(setq-default c-default-style "linux"
              c-basic-offset 4)

;; set default tab width to 4 and disable tabs
(setq-default tab-width 4
              indent-tabs-mode nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   '("50d2919c1abf557501cf2ce0aaee7464b1aea6c86653d24081aa940e8f9059f1" "aa890cb2304e76bb016bb100945de44e0aa2000dafff5279fe0fca65d45e3e58" "b212cf89712496378a6bce4779935dc8c622869bb3944652e67052496a1ade16" default))
 '(package-selected-packages
   '(protobuf-mode maude-mode brainfuck-mode spell-fu ein jupyter yasnippet lsp-mode gnu-elpa-keyring-update rustic cuda-mode yaml-mode undo-tree beacon rainbow-delimiters xkcd find-file-in-project use-package flycheck dumb-jump ivy-explorer hydra ivy company)))
(load-theme 'wombat t)
;; lol this will probably break elsewhere so make sure goodwombat is shipped in the repo
(load-theme 'goodwombat t)

;; allow for comments in terminal mode with C-x /
(global-set-key "\C-x/" 'comment-line)

;; company related section
(add-hook 'after-init-hook 'global-company-mode)

;; ivy related section
(ivy-mode 1)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-RET") 'company-manual-begin)

;; enable copying to clipboard
(setq select-enable-clipboard t)

;; mark ring tings
(setq set-mark-command-repeat-pop t)
(global-set-key (kbd "C-c m") 'counsel-mark-ring)

;; I like evaluating buffers!
(global-set-key (kbd "C-c e") 'eval-buffer)


;; add some file extensions
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.gdb\\'" . gdb-script-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . cuda-mode))
;; when in doubt, escape more characters lol
(add-to-list 'auto-mode-alist '("\\.\\(ba\\|z\\)sh\\(rc\\|_\\(profile\\|aliases\\)\\)\\'" . shell-script-mode))


(setq vc-follow-symlinks t)

;; (set-cursor-color "white")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "white"))))
 '(font-lock-keyword-face ((t (:foreground "purple"))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "magenta"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "light coral"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "SeaGreen1"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "thistle"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "MediumOrchid1"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow green")))))

;; clear parens are cool too
(setq show-paren-delay 0)
(show-paren-mode 1)
;; C-M-{f,b} is jumping around just so you know

(dumb-jump-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; pretty parentheses
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; SUMMON THE BEACON
(beacon-mode 1)

;;TODO: add multiple cursors when youre ready

;; I liek line numbers
(global-linum-mode 1)
(use-package rustic)
(provide '.emacs)

;; Enable desktop-save-mode only when the first frame has come up.
;; This prevents Emacs from stalling when run as a daemon.
;; (add-hook 'after-make-frame-functions
;;     (lambda (frame)
;;         (with-selected-frame frame
;;             (unless desktop-save-mode
;;                 ;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=17693
;;                 (if (daemonp) (setq desktop-restore-frames nil))
;;                 (desktop-save-mode 1)
;;                 (desktop-read)))))

;;; .emacs ends here
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
