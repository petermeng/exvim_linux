#!/bin/bash

# create cscope.out
echo "Creating Cscope..."

# choose cscope path first
if [ -f "${DEST}/files" ]; then
    FILES="${DEST}/files"
# else
    # FILES="-R ."
fi

# process tags by langugage
echo "  |- generate ${TMP}"
${CSCOPE_CMD} -f "${TMP}" ${OPTIONS} "${FILES}"

# replace old file
if [ -f "${TMP}" ]; then
    echo "  |- move ${TMP} to ${TARGET}"
    mv -f "${TMP}" "${TARGET}"
fi
if [ -f "${INTMP}" ]; then
    echo "  |- move ${INTMP} to ${INTARGET}"
    mv -f "${INTMP}" "${INTARGET}"
fi
if [ -f "${POTMP}" ]; then
    echo "  |- move ${POTMP} to ${POTARGET}"
    mv -f "${POTMP}" "${POTARGET}"
fi
echo "  |- done!"
