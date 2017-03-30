(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(setq my-packages
      (cl-set-difference
       '(benchmark-init
         bracketed-paste
         cider
         clojure-mode
         csv-mode
         expand-region
         flycheck
         jedi
         magit
         multi-term
         slime
         zenburn-theme)
       '(melpa)
       )
      )

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
        when (not (package-installed-p p)) do (cl-return nil)
        finally (cl-return t)))

(when (and (not (getenv "http_proxy")) 
           (not (my-packages-installed-p)))
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (condition-case nil
          (package-install p)
        (error (message "%s not installable" p))))))
;; TODO: add autoinstallation of necessary Pip modules for Python modes

;;
(require 'benchmark-init)
(require 'multi-term)
;; copy paste into terminal easier
(require 'bracketed-paste)
(bracketed-paste-enable)
;;set up expand region - need to get working
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;;miscellaneous packages
(autoload 'magit "Magit" "Porcelain for Git")
(require 'csv-mode)
(require 'clojure-mode)
(autoload 'cider "Cider" "REPL for Clojure")
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;;python related stuff
;;(require 'jedi)
;; Standard Jedi.el setting
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)
(require 'slime)
(setq inferior-lisp-prompt "/usr/local/bin/sbcl")
(setq inferior-lisp-program (executable-find "sbcl"))
;;(require 'pylint)
;;(require 'pyflakes)
;;no tabs, set to spaces
(setq-default indent-tabs-mode nil)
;;make it look pretty
(load-theme 'zenburn t)
;;if in terminal mode, install inconsolata on terminal. Otherwise, need to add it in init.el
;;numbering for columns and for rows
(setq column-number-mode t)
;;(global-linum-mode t)
;;(setq linum-format "%4d \u2502 ")
;;turn off blinking cursor
(blink-cursor-mode -1)
;;turn off menubar, toolbar, and scrollbar
(menu-bar-mode -1)
(if (boundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (boundp 'scroll-bar-mode)
        (scroll-bar-mode -1))
;;always have parentheses mode on
(show-paren-mode 1)
(setq show-paren-delay 0)
;; keyboard scroll one line at a time
(setq scroll-step 1)
;; steve yegge suggestions
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

;; easier navigation in windows
(defun move-cursor-previous-pane ()
  "Move cursor to the previous pane."
  (interactive)
  (other-window -1))

(global-set-key (kbd "\C-x\p") 'move-cursor-previous-pane)

;; for rendering markdown
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "pandoc")
 '(package-selected-packages
   (quote
    (helm-projectile projectile helm zenburn-theme web-mode slime robe rainbow-delimiters racket-mode paredit neotree multi-term markdown-preview-mode magit keyfreq jedi-core jedi haskell-mode flycheck expand-region ess elpy csv-mode cider bracketed-paste benchmark-init autopair anaconda-mode))))
;;set mouse once I can get it to default to rectangle mode.

;; set ido mode everythwere
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)
;;(setq ido-create-new-buffer 'always)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   ))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; shortcut to call git webview while I'm in a file
(defun git-webview ()
  (interactive)
  (shell-command (concat "git webview " (buffer-file-name))))


(global-set-key "\C-x\g" 'git-webview)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)
