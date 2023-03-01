CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(sysadmin_manual)
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
    src/общие_сведения.tex
    src/структура_программы.tex
    src/настройка_программы.tex
    src/проверка_программы.tex
    src/дополнительные_возможности.tex
    src/сообщения_системному_программисту.tex
    src/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    sysadmin_manual.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}
)

add_custom_command(
        TARGET sysadmin_manual
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/sysadmin_manual/sysadmin_manual.pdf
                ${CMAKE_SOURCE_DIR}/output/руководство_системного_администратора.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    sysadmin_manual_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET sysadmin_manual
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/sysadmin_manual/sysadmin_manual_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/руководство_системного_администратора_лу.pdf)

