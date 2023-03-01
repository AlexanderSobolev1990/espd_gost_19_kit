CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(explanatory_note)
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
    src/введение.tex
    src/назначение.tex
    src/технические_характеристики.tex
    src/технико_экономические_показатели.tex
    src/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    explanatory_note.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}
)

add_custom_command(
        TARGET explanatory_note
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/explanatory_note/explanatory_note.pdf
                ${CMAKE_SOURCE_DIR}/output/пояснительная_записка.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    explanatory_note_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET explanatory_note
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/explanatory_note/explanatory_note_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/пояснительная_записка_лу.pdf)

