{:user {:dependencies [[slamhound "1.5.5"]]
        :plugins [[cider/cider-nrepl "0.8.1"]
                  [lein-try "0.4.3"]
                  [lein-ancient "0.6.0-SNAPSHOT" :exclusions [org.clojure/core.cache]]
                  [lein-bikeshed "0.1.8"]
                  [lein-kibit "0.0.8"]
                  [jonase/eastwood "0.2.0"]
                  [lein-gorilla "0.3.3"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
