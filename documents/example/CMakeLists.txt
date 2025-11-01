CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(example)
FIND_PACKAGE(LATEX)
SET(PDFLATEX_COMPILER xelatex)
SET(LATEX_DEFAULT_BUILD pdf)
#SET(LATEX_OUTPUT_PATH build)
INCLUDE(../../UseLATEX.cmake)

# Основной документ:
SET(parts
    ../espd.cls # Класс настроек ЕСПД
    ../preamble.tex
    ../algo.tex
    src/аннотация.tex
    src/аббревиатуры.tex
    src/оформление_разделов.tex
    src/оформление_перечислений.tex
    src/оформление_иллюстраций.tex
    src/оформление_формул.tex
    src/оформление_таблиц.tex
    src/оформление_листингов.tex
    src/оформление_алгоритмов.tex
    src/приложение_1.tex
    src/приложение_2.tex
)
ADD_LATEX_DOCUMENT(
    example.tex
    BIBFILES ../bibliography.bib ../bibliography_gost19.bib
    IMAGE_DIRS images
    INPUTS ${parts}    
)

add_custom_command(
        TARGET example
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/example/example.pdf
                ${CMAKE_SOURCE_DIR}/output/пример.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    example_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET example
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/example/example_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/пример_лу.pdf)

