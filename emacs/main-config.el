;; This is my main emacs configuration file.
;;
;; Copyright (c) 2023-now Air Quality And Related Topics.
;;
;; Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
;; following conditions are met (BSD "3-clause" license):
;;
;;   (1) Redistributions of source code must retain the above copyright notice, this list of conditions and the
;;   following disclaimer.
;;
;;   (2) Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
;;   following disclaimer in the documentation and/or other materials provided with the distribution.
;;
;;   (3) The name of the author may not be used to endorse or promote products derived from this software without
;;   specific prior written permission.
;;
;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
;; TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
;; THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
;; BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.

;; Auto-complete and its dependencies (https://github.com/auto-complete)

(add-to-list 'load-path "~/.emacs.d/packages/popup-el")
(add-to-list 'load-path "~/.emacs.d/packages/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/packages/auto-complete")
(require 'auto-complete)
(setq-default ac-sources '(ac-source-dictionary ac-source-words-in-same-mode-buffers))
(setq ac-auto-start 3)
(setq ac-auto-show-menu 0.4)
(setq ac-use-menu-map t)
(define-key ac-menu-map "C-p" 'ac-previous)
(define-key ac-menu-map "C-n" 'ac-next)
(set-face-background 'ac-candidate-face "color-254")
(set-face-foreground 'ac-candidate-face "black")
(set-face-background 'ac-selection-face "color-153")
(set-face-foreground 'ac-selection-face "black")
(global-auto-complete-mode t)

;; General "good-behavior" configuration

(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(delete-selection-mode 1)
(electric-pair-mode 1)
(setq column-number-mode t)
(setq-default fill-column 79)
(if (version< emacs-version "27") () (global-display-fill-column-indicator-mode 1))
(setq-default truncate-lines t)

;; Editing functions

(defun kill-region-or-line ()
  (interactive)
  "Kill region if a region is selected, otherwise kill entire line."
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
      (kill-whole-line)
  )
)

(defun select-current-line ()
  "Move point and mark so that current line is selected."
  (beginning-of-line)
  (set-mark-command nil)
  (end-of-line)
)

(defun kill-ring-save-region-or-line ()
  (interactive)
  "Copy region if a region is selected, otherwise copy entire line."
  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end))
      (save-mark-and-excursion (select-current-line)
                               (kill-ring-save (region-beginning) (region-end))
      )
  )
)

(defun comment-or-uncomment-region-or-line ()
  (interactive)
  "Toggle comments on region if a region is selected, otherwise toggle comments on current line."
  (if (use-region-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
      (save-mark-and-excursion (select-current-line)
                               (comment-or-uncomment-region (region-beginning) (region-end))
      )
  )
)

;; Remap some keys for convenience

;; Moving around
(global-set-key (kbd "C-j") 'backward-word)
(global-set-key (kbd "C-l") 'forward-word)
(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key (kbd "M-n") 'scroll-up)
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-e") 'end-of-buffer)

;; Copying/cutting/pasting
(global-set-key (kbd "C-g") 'kill-ring-save-region-or-line)
(global-set-key (kbd "C-q") 'kill-region-or-line)
(global-set-key (kbd "C-u") 'backward-kill-word)
(global-set-key (kbd "C-v") 'yank)

;; Misc
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-t") 'fill-paragraph)
(global-set-key (kbd "C-y") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "<f12>") 'toggle-truncate-lines)

;; Minibuffer mode

(add-hook 'minibuffer-setup-hook (lambda () (local-set-key "\C-j" 'backward-word)))

;; Emacs-lisp mode

(add-hook 'emacs-lisp-mode-hook (lambda () (set-fill-column 119)))

;; Text mode

(add-to-list 'ac-modes 'text-mode)

;; CC modes (C, C++, Java, etc.)

(setq-default c-basic-offset 4)

;; Python mode

(add-hook 'python-mode-hook (lambda () (setq ac-user-dictionary
                                             '("matplotlib"))))

;; Fortran mode(s)

(setq f90-program-indent 2)
(setq f90-continuation-indent 2)
(setq f90-type-indent 2)
(setq f90-structure-indent 4)
(setq f90-if-indent 4)
(setq f90-do-indent 4)
(add-hook 'f90-mode-hook (lambda () (define-key f90-mode-map "\C-j" 'backward-word)))

;; Web modes (HTML+, CSS, JavaScript, etc.)

(add-hook 'mhtml-mode-hook (lambda () (set-fill-column 119)))
(add-hook 'js-mode-hook (lambda () (set-fill-column 119)
                                   (setq ac-user-dictionary
                                         '("console"
                                           "display"
                                           "forEach"
                                           "indexOf"
                                           "innerHTML"
                                           "lastIndexOf"
                                           "toLowerCase"
                                           "toUpperCase"))))
(add-hook 'css-mode-hook (lambda () (set-fill-column 119)))
(add-to-list 'ac-modes 'mhtml-mode)

;; LaTeX mode

(add-hook 'latex-mode-hook (lambda () (set-fill-column 119)))
(add-to-list 'ac-modes 'latex-mode)

;; Org mode

(add-hook 'org-mode-hook (lambda () (define-key org-mode-map "\C-j" 'backward-word)))
(add-to-list 'ac-modes 'org-mode)

;; Custom major mode for git commit messages

(define-derived-mode gitcommit-mode fundamental-mode
  "git-commit" "Major mode for editing git commit messages."
  (setq comment-start-skip "#")
  (setq comment-start "# ")
  (setq comment-end "")
  (modify-syntax-entry ?# "<")
  (modify-syntax-entry ?\n ">")
  (font-lock-add-keywords 'gitcommit-mode '(("\\`.*$" . font-lock-type-face)))
)
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . gitcommit-mode))
(add-hook 'gitcommit-mode-hook 'font-lock-fontify-buffer)
(add-to-list 'ac-modes 'gitcommit-mode)

;; Custom major mode for markdown files

(define-derived-mode markdown-mode fundamental-mode
  "markdown" "Major mode for editing markdown files."
  (font-lock-add-keywords 'markdown-mode '(("^#.*$" . font-lock-keyword-face)))
  (font-lock-add-keywords 'markdown-mode '(("^##.*$" . font-lock-type-face)))
  (font-lock-add-keywords 'markdown-mode '(("^###.*$" . font-lock-variable-name-face)))
)
(add-to-list 'auto-mode-alist '("\\.[Mm][Dd]\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'font-lock-fontify-buffer)
(add-hook 'markdown-mode-hook (lambda () (set-fill-column 119)))
(add-to-list 'ac-modes 'markdown-mode)
