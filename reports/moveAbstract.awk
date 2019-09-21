BEGIN {
   inAbstract = 0
   abstract = ""
}

/\\begin\{abstract\}/ {
   inAbstract = 1
   next
}

/\\end\{abstract\}/ {
   inAbstract = 0
   next
}

/\\maketitle/ {
   print
   print "\\section*{Abstract}"
   print abstract
   next
}

{
   if (!inAbstract) {
      print $0
   } else {
      abstract = abstract "\n" $0
   }
}
