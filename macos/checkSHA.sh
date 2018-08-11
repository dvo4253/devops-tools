

if [ -z "$1" ]
  then
    echo "No argument supplied"
fi

FILE_NAME=$1
EXPECTED_SHA=$2

OUTPUT_SHA=`openssl dgst -sha256 ${FILE_NAME} | cut -d"=" -f2 | sed 's/ //'`
echo "OUTPUT:   ${OUTPUT_SHA}"
echo "EXPECTED: ${EXPECTED_SHA}"

if [ ${OUTPUT_SHA} == ${EXPECTED_SHA} ]
    then
        echo "Valid SHA"
    else
        echo "INVALID SHA"
fi