{:user {:dependencies [[criterium "0.4.6"]
                       [com.clojure-goes-fast/clj-memory-meter "0.1.3"]
                       [com.clojure-goes-fast/clj-async-profiler "0.5.1"]
                       [com.clojure-goes-fast/clj-java-decompiler "0.3.0"]
                       [com.hypirion/clj-xchart "0.2.0"]]
        :plugins [[lein-ancient "0.7.0"]
                  [com.jakemccrary/lein-test-refresh "0.24.1"]
                  [s3-wagon-private "1.3.4"]]
        :plugin-repositories [["attendify" {:url           "s3p://attendify-clojars/releases/"
                                            :sign-releases false}]]}}
