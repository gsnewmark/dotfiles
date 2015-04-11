{:user {:dependencies [[slamhound "1.5.5"]
                       [org.clojure/tools.nrepl "0.2.10"]]
        :plugins [[cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [refactor-nrepl "0.2.2"]
                  [lein-try "0.4.3"]
                  [lein-ancient "0.6.6"]
                  [lein-bikeshed "0.2.0"]
                  [lein-gorilla "0.3.4"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
