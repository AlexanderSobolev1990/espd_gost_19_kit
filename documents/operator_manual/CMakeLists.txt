CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(operator_manual)
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
    src/назначение.tex
    src/условия_выполнения.tex
    src/выполнение_программы.tex
    src/сообщения_оператору.tex
    src/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    operator_manual.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}
)

add_custom_command(
        TARGET operator_manual
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/operator_manual/operator_manual.pdf
                ${CMAKE_SOURCE_DIR}/output/руководство_оператора.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    operator_manual_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET operator_manual
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/operator_manual/operator_manual_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/руководство_оператора_лу.pdf)

