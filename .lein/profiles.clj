{:user {:plugins [[cider/cider-nrepl "RELEASE"] [lein-autoreload "RELEASE"]]
        :dependencies [[slamhound "RELEASE"]
                       [cljfmt "RELEASE"]
                       [jonase/eastwood "RELEASE" :exclusions [org.clojure/clojure]]]

        :repl-options {:init (require 'cljfmt.core)}
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
