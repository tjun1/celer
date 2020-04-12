;;; init.el --- init.el
;;; Commentary:
;;; Code:
(require 'package)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
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

;; theme
;; (setq clues-theme (expand-file-name "~/.emacs.d/clues-theme.el"))
;; (load clues-theme)
;; (load-theme 'clues)
;; (load-theme 'wombat t)
;; (load-theme 'dakrone t)

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

;; ivy
;; https://qiita.com/takaxp/items/2fde2c119e419713342b
;; (ivy-mode 1)
;; (setq ivy-read-action-function #'ivy-hydra-read-action)
;; (setq ivy-use-virtual-buffers t)
;; (when (setq enabbbbble-recursive-minibuffers t)
;;   (miibuffer-depth-indicate-mode 1))
;; (define-key ivy-miibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
;; (setq ivy-rwap t)
;; (counsel-mode 1)
;; (global-setkey (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "M-y") 'counsel-yank-pop)
;; (global-set-key (kbd "C-M-z") 'counsel-fzf)
;; (global-set-key (kbd "C-M-r") 'counsel-recentf)
;; (global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
;; (global-set-key (kbd "C-M-f") 'counsel-ag)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "M-s M-s") 'swiper-thing-at-point)
;; (global-set-key (kbd "C-s") 'swiper-migemo)

;; (use-package flycheck
;;   :ensure t
;;   :config
;;   (global-flycheck-mode t))

;; root でひらきなおす設定
(use-package auto-sudoedit
  :ensure t
  :config
  (auto-sudoedit-mode 1))

(use-package company
  :ensure t
  ;; :diminish company-mode
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
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

;; LSP
;; (use-package lsp-mode
;;   :commands lsp
;;   :bind
;;   (("M-," . xref-pop-marker-stack)
;;    ("M-." . xref-find-definitions)
;;    ("M-/" . xref-find-references))
;;   :config
;;   (setq lsp-prefer-flymake nil)
;;   (setq lsp-enable-snippet nil)
;;   (setq lsp-enable-xref t)
;;   :hook
;;   (prog-mode . lsp)
;;   (go-mode . lsp))

;; (use-package lsp-ui :commands lsp-ui-mode)

;; (use-package company-lsp
;;   :commands company-lsp
;;   :config
;;   (push 'company-lsp company-backends)
;;   (setq company-lsp-async t
;;         company-lsp-cache-candidates 'auto
;;         company-lsp-enable-recompletion t))

;; https://github.com/eshamster/docker-go-devel/blob/master/init.el
;; (use-package eglot
;;   :bind
;;   (("M-." . xref-find-definitions)
;;    ("M-[" . xref-find-references))
;;   :config
;;   (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
;;   :init
;;   (add-hook 'js-mode-hook 'eglot-ensure)
;;     (add-hook 'go-mode-hook 'eglot-ensure))

(use-package eglot
  :ensure t
  :bind
  (("M-." . xref-find-definitions)
   ("M-[" . xref-find-references)
   ("M-," . pop-tag-mark))
  :config
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  ;; (define-key eglot-mode-map (kbd "M-.") 'xref-find-definitions)
  ;; (define-key eglot-mode-map (kbd "M-,") 'pop-tag-mark)
  ;; (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  ;; (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
  ;; :init
  ;; (add-hook 'go-mode-hook 'eglot-ensure))
  ;; :hook
  ;; ((go-mode . eglot-ensure)))
  )

;; golang
(exec-path-from-shell-copy-envs '("PATH" "GOPATH"))
(use-package go-mode
  :commands go-mode
  ;; :ensure t
  :defer t
  :config
  (setq indent-tabs-mode nil
        c-basic-offset 4
        tab-width 4
        gofmt-command "goimports")
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'before-save-hook 'gofmt-before-save))

;; (use-package go-eldoc
;;   :ensure t
;;   :after go-mode
;;   :hook (go-mode . go-eldoc-setup))


(provide 'init)
;;; init.el ends here
;;; 7
