{:user {:plugins [[venantius/ultra "0.5.2"]
                  [lein-auto "0.1.3"]
                  [lein-kibit "0.1.6"]
                  [jonase/eastwood "0.2.9"]
                  [lein-cloverage "1.0.13"]
                  [refactor-nrepl "2.4.0-SNAPSHOT"]
                  [cider/cider-nrepl "0.18.0"]
                  [lein-cljfmt "0.6.0"]
                  [lein-bikeshed "0.5.1"]]
        :dependencies [[org.clojure/tools.nrepl "0.2.13"]
                       [cider/piggieback "0.3.8"]]
        :repl-options {:nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}}