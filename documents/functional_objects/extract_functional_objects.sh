#!/bin/bash

OUTPUT="functional_objects.txt" # Имя файла с результатом выполнения скрипта - списком функциональных объектов
LINE="--------------------------------------------------------------------------------";
echo "Start!"
echo " " > "$OUTPUT" # Один символ ">" - файл будет перезаписан, два символа ">>" - режим добавления (append)

#
# 1 аргумент $1 - имя исходного файла с расширением *.cpp, *.hpp, *.h
# 2 аргумент $2 - имя выходного файла
# 3 аргумент $3 - разделитель
# 
function extractFile() {
  echo "proceed file: $1"
  #
  echo $3 >> "$2"; # Строка - разделитель
  echo " " >> "$2"; # Пустая строка
  echo "Файл: $1" >> "$2";
  echo " " >> "$2"; # Пустая строка
#   echo "$3" >> "$2"; # Строка - разделитель
  #
  # Команда получения функциональных объектов
  #
#  ctags-universal --kinds-c++=+cefghpstuv-dlmnxz --_xformat='строка:%4{line} %10{kind} %{typeref} %{name}%{signature} ' --output-format=xref "$1" >> "$2"
  ctags-universal --kinds-c++=+cefghpstuv-dlmnxz --_xformat='%4{line} %10{kind} %{typeref} %{name}%{signature} ' --output-format=xref "$1" >> "$2"
  echo " " >> "$2"; # Пустая строка
}
export -f extractFile
#
# Получить имена директорий (в которых искать исходники) сразу при вызове скрипта
#
if [ $# -eq 0 ] # Если нет входных аргументов
  then
    echo "No arguments supplied! Please print directory name after bash script name: './extract_functional_objects.sh sources headers' where 'sources' and 'headers' are example names of directories with source code files."
  else
    for dir in "$@"
    do
      find "$dir" -regex '.*\.\(h\|hpp\|cpp\)$' -exec bash -c 'extractFile "$0" '$OUTPUT' '$LINE' ' {} \;
    done
    echo "$LINE" >> "$OUTPUT"; # Строка - разделитель    
fi
echo "End!"
