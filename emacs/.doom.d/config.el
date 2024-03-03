;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alexis Purslane"
    user-mail-address "alexispurslane@pm.me")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-font "JetBrains Mono-12"
    doom-variable-pitch-font "Cantarell-12")
(setq doom-theme 'doom-1337)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq rustic-analyzer-command '("~/.cargo/bin/rust-analyzer"))
(setq projectile-project-search-path '("~/Development/"))
(setq org-agenda-files '("~/org/agenda/"))

(setq-default lsp-rust-server 'rust-analyzer)
(setq-default rustic-lsp-server 'rust-analyzer)
(setq-default lisp-indent-offset 4)

(map! :map rustic-mode-map
    :leader (:prefix ))

(after! centaur-tabs
    (setq centaur-tabs-style "bar")
    (setq centaur-tabs-height 48)
    (setq centaur-tabs-gray-out-icons 'buffer)
    (setq centaur-tabs-set-bar 'over)
    (setq centaur-tabs-set-modified-marker t)
    (centaur-tabs-change-fonts "Cantarell" 120)
    (setq centaur-tabs-cycle-scope 'tabs)
    (setq centaur-tabs-label-fixed-length 18)
    (centaur-tabs-group-by-projectile-project))

;; Allow Ctrl-V, C, and X to work in insert mode, but use evil mode keys in command mode
(cua-mode +1)
(define-key evil-insert-state-map (kbd "C-c") (lambda () (interactive) (cua-copy-region nil)))
(define-key evil-insert-state-map (kbd "C-v") (lambda () (interactive) (cua-paste nil)))
(define-key evil-insert-state-map (kbd "C-x") (lambda () (interactive) (cua-cut-region nil)))
(define-key evil-insert-state-map (kbd "C-z") 'evil-undo)
(define-key evil-insert-state-map (kbd "C-y") 'evil-redo)
(setq cua-keep-region-after-copy t)

(map!
    :after paredit-mode
    :map paredit-mode-map
    :localleader
    "p" #'paredit-forward-slurp-sexp
    "b" #'paredit-forward-barf-sexp
    "P" #'paredit-backward-slurp-sexp
    "B" #'paredit-backward-barf-sexp
    "S" #'paredit-split-sexp
    "J" #'paredit-join-sexp
    "d" #'paredit-forward-down
    "u" #'paredit-backward-up
    "k" #'paredit-kill
    "s" #'paredit-splice-sexp
    "(" #'paredit-wrap-round
    "[" #'paredit-wrap-square
    "{" #'paredit-wrap-curly)

(add-hook! 'lisp-mode-hook #'enable-paredit-mode)
(add-hook! 'emacs-lisp-mode-hook #'enable-paredit-mode)

(set-face-attribute 'mode-line nil :font "Cantarell-12")

(after! treemacs
    (setq doom-themes-treemacs-enable-variable-pitch t))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-height 33)
(add-hook 'markdown-mode-hook #'auto-fill-mode)

(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-show-with-mouse t)
(setq lsp-signature-render-documentation nil)

(add-to-list 'load-path "~/.emacs.d/load/tads3-mode/")
(autoload 'tads3-mode "tads3" "TADS 3 editing mode." t)
(add-to-list 'auto-mode-alist '("\\.t$" . tads3-mode))
(add-hook 'tads3-mode-hook '+word-wrap-mode)
(setq-default tads3-interpreter "~/.local/bin/qtads")

(map! :after tads3-mode
    :map tads3-mode-map
    :localleader
    "b" #'tads3-build
    "r" #'tads3-run)

(pixel-scroll-precision-mode)

(setq-default TeX-engine 'xetex)
(setq-default pdf-latex-command "xelatex")

(add-to-list 'auto-mode-alist '("\\.comp" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.tesc" . glsl-mode))

(eval-after-load 'autoinsert
    '(define-auto-insert
         '("\\.rs\\'" . "Rust source file license statement")
         '("Short description: Adds the MPL-2.0 license statement."
              "/*" \n
              " * Copyright (C) " (format-time-string "%Y") " " user-full-name " <" user-mail-address ">" \n
              " *" \n
              " * This Source Code Form is subject to the terms of the Mozilla Public" \n
              " * License, v. 2.0. If a copy of the MPL was not distributed with this" \n
              " * file, You can obtain one at http://mozilla.org/MPL/2.0/." \n
              " */" > \n \n
              > _ \n)))

(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
    (when (and opam-share (file-directory-p opam-share))
        ;; Register Merlin
        (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
        (autoload 'merlin-mode "merlin" nil t nil)
        ;; Automatically start it in OCaml buffers
        (add-hook 'tuareg-mode-hook 'merlin-mode t)
        (add-hook 'caml-mode-hook 'merlin-mode t)
        ;; Use opam switch to lookup ocamlmerlin binary
        (setq merlin-command 'opam)
        ;; To easily change opam switches within a given Emacs session, you can
        ;; install the minor mode https://github.com/ProofGeneral/opam-switch-mode
        ;; and use one of its "OPSW" menus.
        ))

(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'markdown-mode-hook (lambda ()
                                  (setq fill-column 65)
                                  (visual-fill-column-mode 1)
                                  (writeroom-mode 1)
                                  (display-line-numbers-mode -1)
                                  (hl-line-mode -1)
                                  (turn-off-auto-fill)
                                  (focus-mode 1)
                                  (face-remap-add-relative 'default '(:family "iA Writer Duo V" :height 170))))
(add-hook 'typescript-mode-hook (lambda () (setq typescript-indent-level 4)))

(setq shell-file-name (executable-find "bash"))
