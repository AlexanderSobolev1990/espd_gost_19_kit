#!/bin/bash

# Проверяем, что переданы все необходимые параметры
if [ "$#" -ne 2 ]; then
echo "Использование: $0 <директория> <искомое_слово>"
exit 1
fi

DIRECTORY=$1
WORD=$2

# Проходим по всем файлам в указанной директории и поддиректориях
find "$DIRECTORY" -type f | while read -r FILE; do
# Проверяем, есть ли слово в файле
if grep -q "$WORD" "$FILE"; then
echo "Найдено в файле: $FILE"
fi
done
