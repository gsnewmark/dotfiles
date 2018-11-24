(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[criterium "0.4.4"]
                [com.clojure-goes-fast/clj-memory-meter "0.1.2"]
                [com.clojure-goes-fast/clj-async-profiler "0.2.0"]
                [com.clojure-goes-fast/clj-java-decompiler "0.1.1"]
                [com.hypirion/clj-xchart "0.2.0"]])
