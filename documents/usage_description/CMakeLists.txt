CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(usage_description)
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
    src/назначение_программы.tex
    src/условия_применения.tex
    src/описание_задачи.tex    
    src/входные_и_выходные_данные.tex    
)
ADD_LATEX_DOCUMENT(
    usage_description.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}
)

add_custom_command(
        TARGET usage_description
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/usage_description/usage_description.pdf
                ${CMAKE_SOURCE_DIR}/output/описание_применения.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    usage_description_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET usage_description
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/usage_description/usage_description_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/описание_применения_лу.pdf)

