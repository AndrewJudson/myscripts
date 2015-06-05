(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
;;set up expand region - need to get working
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;;miscellaneous packages
(require 'magit)
(require 'csv-mode)
(require 'haskell-mode)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;;python related stuff
(require 'jedi)
;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;;(require 'pylint)
;;(require 'pyflakes)
;;no tabs, set to spaces
(setq-default indent-tabs-mode nil)
;;make it look pretty
(load-theme 'zenburn t)
;;if in terminal mode, install inconsolata on terminal. Otherwise, need to add it in init.el
;;numbering for columns and for rows
(setq column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
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

;;set mouse once I can get it to default to rectangle mode.

;; set ido mode everythwere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)
