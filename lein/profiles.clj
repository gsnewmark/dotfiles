{:user {:dependencies [[slamhound "1.5.5"]
                       [acyclic/squiggly-clojure "0.1.2-SNAPSHOT"]]
        :plugins [[cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [refactor-nrepl "0.2.2"]
                  [lein-try "0.4.3"]
                  [lein-ancient "0.6.2"]
                  [lein-bikeshed "0.2.0"]
                  [lein-gorilla "0.3.4"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
