(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(setq-default inhibit-splash-screen t
              make-backup-files nil
              tab-width 4
              indent-tabs-mode nil
              compilation-scroll-output t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(setq initial-frame-alist '((width . 120) (height . 48)))

(global-display-line-numbers-mode)
(setq-default display-line-numbers-type 'relative)

(set-face-attribute 'default nil :font "Fira Code" :height 130)


;; key-bindings
(global-set-key (kbd "M-=") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-0") '(lambda() (interactive) (text-scale-adjust 0)))


;; packages
(defun rc/lazy-install (pkg)
  "Install package if it does not already exist."
  (unless (package-installed-p pkg)
    (package-install pkg)))


(rc/lazy-install 'zenburn-theme)
(load-theme 'zenburn t)
(eval-after-load 'zenburn
  (set-face-attribute 'line-number nil :inherit 'default))

(rc/lazy-install 'evil)
(require 'evil)
(evil-mode 1)

;; set leader key in all states
(evil-set-leader nil (kbd "SPC"))

(setq evil-want-minibuffer t)
