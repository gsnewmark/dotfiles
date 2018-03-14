(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[criterium "0.4.4"]
                [com.clojure-goes-fast/clj-memory-meter "0.1.0"]])
