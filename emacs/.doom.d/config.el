;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq initial-frame-alist '((width . 144) (height . 64)))

(setq confirm-kill-emacs nil)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(load-theme 'zenburn t)

;; doom-related configs
(setq doom-font (font-spec :family "Fira Code" :size 13 :weight 'normal))
