CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(technical_task)
FIND_PACKAGE(LATEX)
SET(PDFLATEX_COMPILER xelatex)
SET(LATEX_DEFAULT_BUILD pdf)
INCLUDE(../../UseLATEX.cmake)
SET(parts
    ../espd.cls # Класс настроек ЕСПД
    ../preamble.tex 
    src/аннотация.tex
    src/аббревиатуры.tex
    src/введение.tex
    src/основание_и_назначение.tex
    src/требования_к_комплексу.tex
    src/требования_к_программной_документации.tex 
    src/порядок_контроля_и_приемки.tex
    src/технико_экономические_показатели.tex
    src/стадии_и_этапы_разработки.tex
)
ADD_LATEX_DOCUMENT(
    technical_task.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}    
)

add_custom_command(
        TARGET technical_task
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/technical_task/technical_task.pdf
                ${CMAKE_SOURCE_DIR}/output/техническое_задание.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    technical_task_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET technical_task
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/technical_task/technical_task_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/техническое_задание_лу.pdf)
