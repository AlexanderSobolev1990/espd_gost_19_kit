# Документация по ЕСПД ГОСТ 19 #

## 1. Обзор ##

Позволяет создавать программную документацию по ЕСПД ГОСТ 19:
* лист утверждения с различным составом подписей согласования/утверждения;
* титульный лист с различными вариантами штампа слева;
* можно включать аннотацию, содержание, приложения (как одно, так и несколько);
* шаблон будет автоматически нумеровать рисунки, таблицы, формулы, что значительно повышает удобство написания и правки документации;
* таблицы спецификации и ведомости эксплуатационных документов;
* библиография оформляется отдельным файлом, ссылки вставляются по имени и автоматически номер ссылки заключается в квадратные скобки: [1];
* отдельное формирование перечня терминов и сокращений;
* в конце документа - лист регистрации изменений.

## 2. Зависимости ##

Предполагается, что работа происходит под linux ubuntu/xubuntu.
Должны быть установлены пакеты:
* texlive (лучше весь дистрибутив теха);
* msttcorefonts (для шрифта times new roman);
* ttf-mscorefonts-installer (для шрифта times new roman);

Также наобходимо скопировать шрифты из директории `/fonts` проекта в директорию
```
/usr/local/share/fonts
``` 
для поддержки шрифта ГОСТ.

## 3. Сборка ##

Конечная (после окончания разработки) сборка осуществляется командой в терминале из корневой директории проекта:
```
 mkdir build && cd build && cmake .. && make 
```
после чего в директории /output появится собранный целевой *.pdf файл/файлы.
Опционально можно выполнить команду:
```
 mkdir build && cd build && cmake .. && make && make install
```
после которой в директории /output появятся не только конечные файлы, но и их архив, а также файл с контрольной суммой архива (sha256).
Проверка архива на соответствие контрольной сумме производится командой:
```
sha256sum -c программная_документация.tgz.sha256
```

При разработке документации удобнее пользоваться редактором, например TexStudio, для чего в его настройках следует указать:
```
Options -> Configure TexStudio... -> Commands -> XeLaTeX = xelatex -shell-escape -output-directory=./build/ -synctex=1 %.tex
Options -> Configure TexStudio... -> Commands -> BibTeX = bibtex ./build/%.aux
Options -> Configure TexStudio... -> Build -> Default Compiler = txs:///xelatex
Options -> Configure TexStudio... -> Build -> Default Bibliography Tool = txs:///bibtex
Options -> Configure TexStudio... -> Additional Search Paths:
	Log File ./build
	PDF File ./build
``` 
также, в корневой директории проекта есть файл настроек TexStudio

## 4. Структура проекта и разработка документации ##

Предполагается, что каждый программный документ находится в своей директории (например, /example или /technical_task), где лежат соответствующие 
корневые файлы данного документа *.tex и *_lu.tex - сам документ и лист утверждения отдельно.
Сами исходные тексты разделов документа собраны в директорию /src, иллюстрации собраны в директорию /images, библиография (при необходимости) - в файл 
bibliography.bib. Файл CMakeLists.txt в директории отдельного  документа управляет сборкой и переименовыванием конечного файла документа и его листа утверждения.
Корневой CMakeLists.txt позволяет собрать весь проект сразу (все документы), выполнить их архивацию с вычислением контрольной суммы.

## 5. Примеры

Результат сборки проекта лежит в директории /output
