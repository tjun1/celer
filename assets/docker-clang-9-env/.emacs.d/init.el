;;; init.el --- init.el
;;; Commentary:
;;; Code:
(require 'package)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq package-check-signature nil)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)
(setq package-archives '(("gnu" . "http://mirrors.163.com/elpa/gnu/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

;; https://gist.github.com/atakig/1370084
(global-set-key "\C-h" 'delete-backward-char)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map "\C-t" 'other-window)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(transient-mark-mode t)
(global-font-lock-mode t)
(display-time)
(global-auto-revert-mode)
(electric-pair-mode 1)
;; (setq custom-file "~/.emacs.d/emacs-custom.el")
(setq custom-file (locate-user-emacs-file "emacs-custom.el"))
(if (file-exists-p (expand-file-name custom-file))
    (load custom-file))

(setq frame-title-format (format "%%f - emacs" (system-name)))
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq indent-line-function 'indent-relative-maybe)
(setq completion-ignore-case t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(menu-bar-mode -1)
(setq scroll-conservatively 1)
(prefer-coding-system 'utf-8)
(setq-default indent-tabs-mode nil)
(set-face-attribute 'region "#555")
(if (version<= "26.0.50" emacs-version)
    (progn
      (global-display-line-numbers-mode)))
(setq scroll-step 1)
(setq read-file-name-completion-ignore-case t)

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(use-package ido
  :ensure t
  :config
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

;; root でひらきなおす設定
(use-package auto-sudoedit
  :ensure t
  :config
  (auto-sudoedit-mode 1))

(use-package company
  :ensure t
  ;; :diminish company-mode
  ;; (:map company-active-map
  ;;       ("C-n" . company-select-next)
  ;;       ("C-p" . company-select-previous))
  :config
  (global-company-mode)
  (setq company-idle-delay 0
        company-selection-wrap-around t
        company-minimum-prefix-length 2)
  (delete 'company-semantic company-backends)
  (set-face-attribute 'company-tooltip nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
                      :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
                      :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil
                      :background nil :foreground "lightgrey" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background "gray40"))

(require 'cc-mode)
(add-hook 'c-mode-common-hook
          (lambda ()
            ;; (setq c-default-style "k&r") ;; clang-formatするので無効化
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 4)))

;; for C++ development
;; (add-to-list 'auto-mode-alist '("\\.h\\" . c++-mode))

(use-package clang-format
  :ensure t
  :bind
  (("C-c i" . clang-format-region)
   ("C-c u" . clang-format-buffer))
  :config
  (setq clang-format-style-option "llvm"))

;; LSP
(use-package eglot
  :ensure t
  :bind
  (("M-." . xref-find-definitions)
   ("M-[" . xref-find-references)
   ("M-," . pop-tag-mark))
  :config
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
  ;; (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'eglot-server-programs '(c-mode . ("clang-query")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clang-query")))
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
  )



(provide 'init)
;;; init.el ends here
;;; 8
