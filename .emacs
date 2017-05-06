;;Ctrl+Z should undo
(global-set-key (kbd "C-z") 'undo)
(global-unset-key "\C-z")
(global-set-key "\C-z" 'advertised-undo)

;;Zone
(defun zone-choose (pgm)
    "Choose a PGM to run for `zone'."
    (interactive
     (list
      (completing-read
       "Program: "
       (mapcar 'symbol-name zone-programs))))
    (let ((zone-programs (list (intern pgm))))
      (zone)))

;;Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;Column Enforcement
(require 'column-enforce-mode)
(add-hook 'c-mode-common-hook '80-column-rule)

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;HideShow
;;;Hooks
;;;;New hotkeys for HideShow Minor Mode
(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-x RET C-o") 'hs-hide-block)
(global-set-key (kbd "C-x RET o") 'hs-show-block)
(global-set-key (kbd "C-x RET RET") 'hs-hide-all)
(global-set-key (kbd "C-x RET m") 'hs-show-all)

;;c-basic-offset
(defun my-c-mode-hook ()
  (setq c-basic-offset 2))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'csharp-mode-hook 'my-c-mode-hook)

;;Change smerge default command prefix to something more usable
(setq smerge-command-prefix "\C-cv")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (flycheck column-enforce-mode)))
 '(save-place t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 97 :width normal)))))
