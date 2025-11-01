#!/bin/bash

# Определяем пути
TARGET="$1"
ARCHIVE_NAME="АБВГ.ХХХХХ-01 12 01"

mv "${ARCHIVE_NAME}.zip" "${ARCHIVE_NAME}.gost" "${TARGET}"
#mv -i "${ARCHIVE_NAME}.zip" "${ARCHIVE_NAME}.gost" "${TARGET}" # ключ -i спрашивает подтверждение!

