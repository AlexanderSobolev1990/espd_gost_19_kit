#!/bin/bash

# Проверяем, что переданы все необходимые параметры
if [ "$#" -ne 3 ]; then
echo "Использование: $0 <директория> <заменяемое_слово> <новое_слово>"
exit 1
fi

DIRECTORY=$1
OLD_WORD=$2
NEW_WORD=$3

# Проходим по всем файлам в указанной директории и поддиректориях
find "$DIRECTORY" -type f | while read -r FILE; do
# Проверяем, есть ли старое слово в файле
if grep -q "$OLD_WORD" "$FILE"; then
# Заменяем старое слово на новое
sed -i "s/$OLD_WORD/$NEW_WORD/g" "$FILE"
echo "Заменено в файле: $FILE"
fi
done
