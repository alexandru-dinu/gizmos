(doom! :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; highlighted indent columns
       modeline          ; snazzy, Atom-inspired modeline, plus API
       ophints           ; highlight the region an operation acts on
       (popup +defaults) ; tame sudden yet inevitable temporary windows
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces
)

(doom! :completion
       company ; the ultimate code completion backend
       vertico ; the search engine of the future
)

(doom! :editor
       (evil +everywhere) ; come to the dark side, we have cookies
       file-templates     ; auto-snippets for empty files
       fold               ; (nigh) universal code folding
       multiple-cursors   ; editing in many places at once
       snippets           ; my elves. They type so I don't have to
)

(doom! :emacs
       dired    ; making dired pretty [functional]
       electric ; smarter, keyword-based electric-indent
       undo     ; persistent, smarter undo for your inevitable mistakes
       vc       ; version-control and Emacs, sitting in a tree
)

(doom! :checkers syntax)

(doom! :checkers (spell +aspell))

(doom! :tools
       (eval +overlay) ; run code, run (also, repls)
       lookup          ; navigate your code and its documentation
       magit           ; a git porcelain for Emacs
)

(doom! :lang
       emacs-lisp
       latex
       markdown
       python
       sh
)

(doom! :lang (org +roam2))

(doom! :config (default +bindings +smartparens))
