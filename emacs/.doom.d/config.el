;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alexandru Dinu"
      user-mail-address "alex.dinu07@gmail.com")

(setq confirm-kill-emacs nil)

(setq doom-font (font-spec :family "Iosevka Fixed SS09" :weight 'medium :size 16))
(setq display-line-numbers-type 'relative)

(setq doom-theme 'doom-tomorrow-night)

;; Separate system clipboard from registers.
;; This also ensures consistency with vim.
;; clip  -> emacs: "+p
;; emacs -> clip:  "+y
(setq x-select-enable-clipboard nil)

(setq-default tab-width 4
              indent-tabs-mode nil)
(setq-default c-basic-offset tab-width)

(after! org
    (setq org-directory (file-truename "~/workspace/org.git"))
    (setq org-agenda-files (list org-directory))
    (setq org-default-notes-file (concat org-directory "/capture.org"))
)
(after! org-roam
    (setq org-roam-directory (file-truename "~/workspace/org.git"))
    (setq org-roam-db-location (concat org-roam-directory "/org-roam.db"))
    (org-roam-db-autosync-mode)
)

(setq +latex-viewers '(zathura))

;; Keybindings
(map! :leader
    (:prefix ("d" . "dired")
     :desc "Dired: open"            "j" #'dired
     :desc "Dired: jump to current" "d" #'dired-jump))
