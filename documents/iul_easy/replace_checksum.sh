#!/bin/bash

# Проверка количества аргументов
#if [ "$#" -ne 1 ]; then
#    echo "Использование: $0 файл.odt"
#    exit 1
#fi

# Параметры
ODT_FILE="iul_template.odt" # Файл с шаблоном ИУЛ-а, в котором есть строка mychecksum, которую надо заменить на реальную контрольную сумму
OLD_WORD="mychecksum" # строка, которую меняем
NEW_ODT_FILE="АБВГ.ХХХХХ-01 12 01-УЛ.odt" # Название нового создаваемого файла (старый *.odt не трогаем!!!)
NEW_PDF_FILE="${NEW_ODT_FILE%.odt}.pdf" # Название нового pdf файла
OUTPUT_DIR="../../output" # Директория, где искать файл с контрольной суммой
GOST_FILE="$OUTPUT_DIR/АБВГ.ХХХХХ-01 12 01.gost" # Файл с контрольной суммой
TEMP_DIR="tmp_dir"

# Шаг 0: Получаем контрольную сумму из файла *.gost
CHECKSUM_WORD=$(awk '{print $1}' "$GOST_FILE") # отсечка по первому пробелу
if [ -z "$CHECKSUM_WORD" ]; then
    echo "Не удалось получить checksum из файла \"$GOST_FILE\"."
    exit 1
fi

# Шаг 1: Разархивируем
unzip "$ODT_FILE" -d "$TEMP_DIR"

# Шаг 2: Заменяем слово
sed -i "s/$OLD_WORD/$CHECKSUM_WORD/g" "$TEMP_DIR/content.xml"

# Шаг 3: Сжимаем обратно
cd "$TEMP_DIR"
zip -r "../$NEW_ODT_FILE" *

# Шаг 4: конвертация в pdf c таким же именем
cd ..
soffice --headless --convert-to pdf "$NEW_ODT_FILE"

echo "Слово \"$OLD_WORD\" заменено на \"$CHECKSUM_WORD\" в файле \"$NEW_ODT_FILE\"."

# Шаг 5: Переложить полученный pdf в /output
mv "$NEW_PDF_FILE" "$OUTPUT_DIR/"
if [ $? -ne 0 ]; then
    echo "Ошибка при перемещении PDF-файла в директорию \"$OUTPUT_DIR\"."
    exit 1
fi

# Шаг 6: Очистка
rm -rf "$TEMP_DIR"
rm -rf "$NEW_ODT_FILE"

