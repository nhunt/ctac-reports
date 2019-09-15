#!/usr/bin/env bash

main() {
   if [ "$#" -ne 2 ]; then
      echo "Usage: $0 <file> <tag>"
      exit 1
   fi

   echo "Creating diff for $1 from tag $2"

   if [ ! -f "$1" ]; then
      echo "Sorry; file $1 doesn't exist."
      exit 1
   fi

   git show ${2}:./${1} > diff-orig.tex
   cp $1 diff-new.tex
   latexdiff diff-orig.tex diff-new.tex > tr-diff.tex
   make tr-diff.pdf
   mv tr-diff.pdf diff.pdf
   rm diff-orig.tex diff-new.tex tr-diff.tex tr-diff.*
}

main "$@"
