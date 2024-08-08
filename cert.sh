#!/bin/sh
if [ -z "${TESTHOST}" ]; then
    echo "env var TESTHOST missing or empty"
    exit 1
fi
port=${TESTPORT:-443}
OUTPUT=${TESTHOST}.txt
LOG=openssl.log
echo | openssl s_client -showcerts -servername ${TESTHOST} -connect ${TESTHOST}:${port} 2>${LOG} | openssl x509 -inform pem -noout -text > ${OUTPUT}
echo "Certificate for ${TESTHOST}:${port}"
echo ""
cat ${OUTPUT}
echo ""
echo "--- openssl log:"
echo ""
cat ${LOG}
rm -f ${OUTPUT} ${LOG}
