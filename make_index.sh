#!/bin/bash

#

INDEXFILE="./index.html"

echo "This script is not complete yet."
exit 0

# Open the index file
exec 5>/tmp/pres_index_$$.tmp

function add_presentation {

  PDESC="${ADIR}"
  PTITLE="${ADIR}"
  if test -f "presentation_info.text" ; then
    # Looking for Description and Title in description file.

  fi
  echo " <A href=\"${ADIR}\">${PTITLE}</A>"
  echo "<P>${PDESC}</P>"
}

echo "<HTML>" >>&5
ls -1| while read ADIR
do
  if test -d "${ADIR}" ;then
    echo "A Directory ${ADIR}"
    cd "${ADIR}"
    if test -f "index.html"; then
      # add presentation directory to list
    fi
  fi
done

