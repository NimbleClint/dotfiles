;; -*- no-byte-compile: t; -*-
;;; tools/pdf/packages.el

(package! pdf-tools
  ;; REVIEW waiting on politza/pdf-tools#588
  :recipe (:host github
           :repo "flatwhatson/pdf-tools"
           :branch "fix-macros")
  :pin "eb6d40663069f2b7e6b52e907eeaa4e37375feb6")

(package! saveplace-pdf-view :pin "b0370912049222f3a4c943856de3d69d48d53a35")
