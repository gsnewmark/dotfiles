(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[refactor-nrepl "2.3.0-SNAPSHOT"]
                [cider/cider-nrepl "0.14.0-SNAPSHOT"]
                [criterium "0.4.4"]])

(swap! boot.repl/*default-middleware*
       concat '[[cider.nrepl/cider-middleware]
                [refactor-nrepl.middleware/wrap-refactor]])
