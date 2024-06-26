;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (company          ; the ultimate code completion backend
        +childframe)
       (vertico          ; the search engine of the future
        +icons)

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       (emoji
        +unicode)
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       hydra
       ligatures         ; ligatures and symbols to make your code pretty again
       (modeline         ; snazzy, Atom-inspired modeline, plus API
        +light)
       nav-flash         ; blink the current line after jumping
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       (treemacs         ; a project drawer, like neotree but cooler
        +lsp)
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       (format +onsave)  ; automated prettiness
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       electric          ; smarter, keyword-based electric-indent
       (undo +tree)      ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :checkers
       (syntax           ; tasing you for every semicolon you forget
        +childframe)
       (spell            ; tasing you for misspelling mispelling
        +everywhere
        +flyspell)

       :tools
       (debug            ; stepping through code, to help you add bugsger
        +lsp)
       direnv
       eval              ; run code, run (also, repls)
       lookup            ; helps you navigate your code and documentation
       (lsp              ; M-x vscode
        +peek)
       magit             ; a git porcelain for Emacs
       rgb
       tree-sitter       ; syntax and parsing, sitting in a tree...

       :os
       tty               ; improve the terminal Emacs experience

       :lang
       (clojure          ; java with a lisp
        +syntax-checker)
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       (go               ; the hipster dialect
        +lsp
        +tree-sitter)
       (json              ; At least it ain't XML
        +lsp
        +tree-sitter)
       (java             ; the poster child for carpal tunnel syndrome
        +lsp
        +tree-sitter)
       (javascript       ; all(hope(abandon(ye(who(enter(here))))))
        +lsp
        +tree-sitter)
       markdown          ; writing docs for people to ignore
       (python           ; beautiful is better than ugly
        +lsp
        +pyright
        +tree-sitter)
       (sh               ; she sells {ba,z,fi}sh shells on the C xor
        +fish
        +lsp
        +tree-sitter)
       (web              ; the tubes
        +lsp
        +tree-sitter)
       (yaml              ; JSON, but readable
        +lsp
        +tree-sitter)

       :os
       (:if IS-MAC macos); improve compatibility with macOS

       :config
       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))

;; (when noninteractive
;;   (add-to-list 'doom-env-allow "^SSH_"))
