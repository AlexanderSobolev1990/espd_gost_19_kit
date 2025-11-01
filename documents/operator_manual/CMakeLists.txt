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
    src/назначение_программы.tex
    	../common/назначение.tex
    	../common/решаемые_задачи.tex
    src/условия_выполнения.tex
		../common/функциональные_ограничения.tex
		../common/технические_и_программные_средства.tex
    src/выполнение_программы.tex
		../common/запуск_программы.tex
    src/сообщения_оператору.tex
    	../common/проверка_программы.tex
    	../common/записи_системного_лога.tex
   	../abbreviations.tex
    	../common/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    operator_manual.tex
#    BIBFILES ../bibliography.bib ../bibliography_gost19.bib
    IMAGE_DIRS ../images
    INPUTS ${parts}
)

add_custom_command(
        TARGET operator_manual
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/operator_manual/operator_manual.pdf
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 34 01.pdf") # кавычки из-за пробела

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
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 34 01-ЛУ.pdf") # кавычки из-за пробела

