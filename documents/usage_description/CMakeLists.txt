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
    src/назначение_программы.tex
    	../common/назначение.tex
    	../common/решаемые_задачи.tex
    src/условия_применения.tex
    	../common/функциональные_ограничения.tex
    	../common/технические_и_программные_средства.tex
    	../common/состав_входной_информации.tex
    	../common/состав_выходной_информации.tex
    src/описание_задачи.tex
	    ../common/назначение.tex
	    ../common/алгоритм_методы_и_принципы.tex
	    ../common/алгоритм_этапы.tex
    src/входные_и_выходные_данные.tex
		../common/входные_данные.tex
		../common/выходные_данные.tex
	../abbreviations.tex
		../common/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    usage_description.tex
#    BIBFILES ../bibliography.bib ../bibliography_gost19.bib
    IMAGE_DIRS ../images
    INPUTS ${parts}
)

add_custom_command(
        TARGET usage_description
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/usage_description/usage_description.pdf
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 31 01.pdf") # кавычки из-за пробела

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
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 31 01-ЛУ.pdf") # кавычки из-за пробела

