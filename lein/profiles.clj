{:user {:dependencies [[slamhound "1.5.5"]
                       [org.clojure/tools.nrepl "0.2.10"]]
        :plugins [[cider/cider-nrepl "0.9.1-SNAPSHOT"]
                  [refactor-nrepl "1.1.0-SNAPSHOT"]
                  [lein-try "0.4.3"]
                  [lein-ancient "0.6.7"]
                  [lein-bikeshed "0.2.0"]
                  [lein-gorilla "0.3.4"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
