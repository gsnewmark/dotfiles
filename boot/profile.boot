(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[criterium "0.4.4"]])
