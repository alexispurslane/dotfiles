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
(setq doom-font "JetBrains Mono"
    doom-variable-pitch-font "Fira Sans-12")
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
(setq projectile-project-search-path '("~/build/" ("~/Documents" . 3)))
(setq org-agenda-files '("~/org/agenda/"))

(setq-default lsp-rust-server 'rust-analyzer)
(setq-default rustic-lsp-server 'rust-analyzer)
(setq-default lisp-indent-offset 4)

(after! centaur-tabs
    (setq centaur-tabs-style "bar")
    (setq centaur-tabs-height 48)
    (setq centaur-tabs-gray-out-icons 'buffer)
    (setq centaur-tabs-set-bar 'over)
    (setq centaur-tabs-set-modified-marker t)
    (centaur-tabs-change-fonts "Fira Sans" 120)
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

(map! :map paredit-mode-map
    :leader (:prefix ("l" . "lisp")
                :nvie "p" #'paredit-forward-slurp-sexp
                :nvie "b" #'paredit-forward-barf-sexp
                :nvie "P" #'paredit-backward-slurp-sexp
                :nvie "B" #'paredit-backward-barf-sexp
                :nvie "S" #'paredit-split-sexp
                :nvie "J" #'paredit-join-sexp
                :nvie "d" #'paredit-forward-down
                :nvie "u" #'paredit-backward-up
                :nie "k" #'paredit-kill
                :nie "s" #'paredit-splice-sexp
                :nie "(" #'paredit-wrap-round
                :nie "[" #'paredit-wrap-square
                :nie "{" #'paredit-wrap-curly))

(add-hook! 'lisp-mode-hook #'enable-paredit-mode)
(add-hook! 'emacs-lisp-mode-hook #'enable-paredit-mode)

(set-face-attribute 'mode-line nil :font "Fira Sans-12")

(after! treemacs
    (setq doom-themes-treemacs-enable-variable-pitch t))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-height 33)