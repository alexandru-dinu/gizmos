(setq user-full-name "Alexandru Dinu"
      user-mail-address "alex.dinu07@gmail.com")

(setq confirm-kill-emacs nil)

(setq doom-theme 'doom-tomorrow-night)
(setq doom-font (font-spec :family "Iosevka Fixed SS09" :weight 'medium :size 16))

(setq display-line-numbers-type 'relative)

(setq-default tab-width 4
              indent-tabs-mode nil)

(setq-default c-basic-offset tab-width)

(setq ispell-dictionary "en")

(setq x-select-enable-clipboard nil)

(after! org
    (setq org-directory (file-truename "~/workspace/org.git"))
    (setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
    (setq org-log-done 'time)
    (setq org-startup-with-latex-preview t)
    (setq org-element-use-cache nil)
)
(after! org-roam
    (setq org-roam-directory (file-truename "~/workspace/org.git"))
    (setq org-roam-db-location (concat org-roam-directory "/org-roam.db"))
    (org-roam-db-autosync-mode)
)

(map! :leader
    (:prefix ("d" . "dired")
     :desc "Dired: open"        "j" #'dired
     :desc "Dired: jump to cwd" "d" #'dired-jump))
