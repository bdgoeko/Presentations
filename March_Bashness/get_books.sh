#!/bin/bash

echo "Please enter title, url"
NUM=0
while read books
do
  TITLE=`echo ${books} | cut -d, -f1`
  hURL=`echo ${books} | cut -d, -f2`
  FILE_NAME=`basename ${hURL}`

  echo "Getting ${TITLE} Number ${NUM}"
  echo "From ${hURL} to ${FILE_NAME}"
  #curl -o ${FILE_NAME} ${hURL}
  let NUM++
  echo "Please enter title, url"
done

exit 0
