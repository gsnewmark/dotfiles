(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.11.0-SNAPSHOT"]
                [org.clojure/tools.nrepl "0.2.12"]
                [refactor-nrepl "2.1.0-alpha1"]
                [criterium "0.4.3"]])

(swap! boot.repl/*default-middleware*
       concat '[[cider.nrepl/cider-middleware]
                [refactor-nrepl.middleware/wrap-refactor]])
