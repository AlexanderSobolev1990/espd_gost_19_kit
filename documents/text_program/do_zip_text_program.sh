#!/bin/bash

# Определяем пути
TARGET="./АБВГ.ХХХХХ-01 12 01"
ARCHIVE_NAME="АБВГ.ХХХХХ-01 12 01"

# Архивация директории c вычислением контрольной суммы
zip -r "${ARCHIVE_NAME}.zip" "$TARGET"
gost12sum "${ARCHIVE_NAME}.zip" > "${ARCHIVE_NAME}.gost"

#mv -i "${ARCHIVE_NAME}.zip" "${ARCHIVE_NAME}.gost" "../../output/"

