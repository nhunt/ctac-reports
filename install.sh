#!/usr/bin/env bash

TARGET=../ctac-mountaineers.github.io/reports
CSVTARGET=../ctac-mountaineers.github.io/_data

main() {
   if [ ! -d "${TARGET}" -o ! -d "${CSVTARGET}" ]; then
      echo "${TARGET} or ${CSVTARGET} do not exist.  Check your parameters."
      exit 1
   fi

   echo "id,title,abstract,status" > /tmp/reports.csv
   PDFS=$(find reports -name '*.pdf')
   for pdf in $PDFS; do
      base=$(basename $pdf .pdf)
      html=${pdf/.pdf/.html}
      cp -v $pdf ${TARGET}/ctac-${base}.pdf
      if [ -f "$html" ]; then
         cp -v $html ${TARGET}/ctac-${base}.html
      fi
      echo "ctac-${base},CTAC-${base},\"Abstract coming soon\",published" >> /tmp/reports.csv
   done
   mv /tmp/reports.csv ${CSVTARGET}
}

main "$@"
