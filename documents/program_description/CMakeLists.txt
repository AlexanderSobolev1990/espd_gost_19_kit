CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(program_description)
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
    src/общие_сведения.tex 
    src/функциональное_назначение.tex 
    src/описание_логической_структуры.tex 
    src/используемые_технические_средства.tex 
    src/вызов_и_загрузка.tex 
    src/входные_и_выходные_данные.tex 
)
ADD_LATEX_DOCUMENT(
    program_description.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}    
)

add_custom_command(
        TARGET program_description
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/program_description/program_description.pdf
                ${CMAKE_SOURCE_DIR}/output/описание_программы.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    program_description_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET program_description
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/program_description/program_description_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/описание_программы_лу.pdf)

