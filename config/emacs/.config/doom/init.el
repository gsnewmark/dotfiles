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
       minimap           ; show a map of the code on the side
       (modeline         ; snazzy, Atom-inspired modeline, plus API
        +light)
       nav-flash         ; blink the current line after jumping
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       treemacs          ; a project drawer, like neotree but cooler
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired            ; making dired pretty [functional]
        +ranger          ; bringing the goodness of ranger to dired
        +icons           ; colorful icons for dired-mode
        )
       electric          ; smarter, keyword-based electric-indent
       (undo +tree)      ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :checkers
       (syntax           ; tasing you for every semicolon you forget
        +childframe)
       (spell            ; tasing you for misspelling mispelling
        +everywhere
        +flyspell)
       grammar           ; tasing grammar mistake every you make

       :tools
       direnv
       docker
       eval              ; run code, run (also, repls)
       lookup            ; helps you navigate your code and documentation
       magit             ; a git porcelain for Emacs
       tree-sitter       ; syntax and parsing, sitting in a tree...

       :os
       tty               ; improve the terminal Emacs experience

       :lang
       (clojure          ; java with a lisp
        +syntax-checker)
       data              ; config/data formats
       emacs-lisp        ; drown in parentheses
       (go               ; the hipster dialect
        +tree-sitter)
       json              ; At least it ain't XML
       (java             ; the poster child for carpal tunnel syndrome
        +meghanada
        +tree-sitter)
       (javascript       ; all(hope(abandon(ye(who(enter(here))))))
        +tree-sitter)
       markdown          ; writing docs for people to ignore
       (nix              ; I hereby declare "nix geht mehr!"
        +tree-sitter)
       (org              ; organize your plain life in plain text
        +pandoc          ; pandoc integration into org's exporter
        +present         ; Emacs for presentations
        +roam2)
       (python           ; beautiful is better than ugly
        +tree-sitter)
       (ruby             ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
        +rails
        +tree-sitter)
       (rust             ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
        +tree-sitter)
       (scala            ; java, but good
        +tree-sitter)
       (sh +fish +bash)  ; she sells {ba,z,fi}sh shells on the C xor
       (web              ; the tubes
        +tree-sitter)
       yaml              ; JSON, but readable

       :os
       (:if IS-MAC macos); improve compatibility with macOS

       :app
       everywhere        ; *leave* Emacs!? You must be joking

       :config
       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))

;; (when noninteractive
;;   (add-to-list 'doom-env-allow "^SSH_"))
