;; This is my main emacs configuration file.
;;
;; This code is copyright (c) 2023-now Air Quality And Related Topics, and is
;; released under the terms of the 3-Clause BSD licence, which says:
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:
;;
;;   (1) Redistributions of source code must retain the above copyright notice,
;;   this list of conditions and the following disclaimer.
;;
;;   (2) Redistributions in binary form must reproduce the above copyright
;;   notice, this list of conditions and the following disclaimer in the
;;   documentation and/or other materials provided with the distribution.
;;
;;   (3) The name of the author may not be used to endorse or promote products
;;   derived from this software without specific prior written permission.
;;
;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED
;; WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
;; EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
;; PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
;; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
;; OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
;; ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;; General "good-behavior" configuration
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq column-number-mode t)
(setq-default fill-column 80)
(electric-pair-mode 1)

;; Editing functions
(defun kill-region-or-line ()
  (interactive)
  "Kill region if a region is selected, otherwise kill entire line."
  (if (use-region-p)
      (kill-region (region-beginning) (region-end)) (kill-whole-line)))

;; Remap some keys for convenience
;; --> moving around
(global-set-key (kbd "C-j") 'backward-word)
(global-set-key (kbd "C-l") 'forward-word)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-e") 'end-of-buffer)
(global-set-key (kbd "C-o") 'goto-line)
;; --> copying/cutting/pasting
(global-set-key (kbd "C-g") 'kill-ring-save)
(global-set-key (kbd "C-h") 'kill-region-or-line)
(global-set-key (kbd "C-u") 'backward-kill-word)
(global-set-key (kbd "C-v") 'yank)
;; --> misc
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-t") 'fill-paragraph)
(global-set-key (kbd "C-y") 'comment-or-uncomment-region)

;; CC modes (C, C++, Java, etc.)
(setq-default c-basic-offset 4)
