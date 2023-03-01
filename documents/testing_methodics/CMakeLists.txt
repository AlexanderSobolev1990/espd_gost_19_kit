CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(testing_methodics)
FIND_PACKAGE(LATEX)
SET(PDFLATEX_COMPILER xelatex)
SET(LATEX_DEFAULT_BUILD pdf)
#SET(LATEX_OUTPUT_PATH build)
INCLUDE(../../UseLATEX.cmake)

# Основной документ:
SET(parts
    ../espd.cls
    ../preamble.tex
    src/аннотация.tex
    src/аббревиатуры.tex
    src/объект_испытаний.tex
    src/цель_испытаний.tex
    src/требования_к_программе.tex
    src/требования_к_программной_документации.tex
    src/состав_и_порядок_испытаний.tex
    src/методы_испытаний.tex
)
ADD_LATEX_DOCUMENT(
    testing_methodics.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}
)

add_custom_command(
        TARGET testing_methodics
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/testing_methodics/testing_methodics.pdf
                ${CMAKE_SOURCE_DIR}/output/программа_и_методика_испытаний.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    testing_methodics_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET testing_methodics
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/testing_methodics/testing_methodics_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/программа_и_методика_испытаний_лу.pdf)

