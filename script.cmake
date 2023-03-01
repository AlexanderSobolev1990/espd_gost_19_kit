# Запись контрольной суммы архива с документацией
file(SHA256 "${CMAKE_SOURCE_DIR}/../output/программная_документация.tgz" CHECKSUM_VARIABLE)
file(WRITE "${CMAKE_SOURCE_DIR}/../output/программная_документация.tgz.sha256" SHA256 (программная_документация.tgz) = ${CHECKSUM_VARIABLE})
