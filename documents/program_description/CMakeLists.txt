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
    src/общие_сведения.tex 
	    ../common/обозначение_и_наименование.tex
	    ../common/технические_и_программные_средства.tex
	    ../common/язык_исходников.tex	    
    src/функциональное_назначение.tex
	    ../common/назначение.tex
	    ../common/решаемые_задачи.tex     
    src/описание_логической_структуры.tex 
	    ../common/алгоритм_этапы.tex
	    ../common/алгоритм_методы_и_принципы.tex
	    ../common/алгоритм_структурная_схема.tex
	    ../common/связи_программы.tex
    src/используемые_технические_средства.tex     
	    ../common/функциональные_ограничения.tex
	    ../common/технические_и_программные_средства.tex
    src/вызов_и_загрузка.tex 
    	../common/вызов_и_загрузка.tex    	
    src/входные_и_выходные_данные.tex 
		../common/входные_данные.tex
		../common/выходные_данные.tex    	
	../abbreviations.tex
	    ../common/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    program_description.tex
#    BIBFILES ../bibliography.bib ../bibliography_gost19.bib
    IMAGE_DIRS ../images
    INPUTS ${parts}    
)

add_custom_command(
        TARGET program_description
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/program_description/program_description.pdf
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 13 01.pdf") # кавычки из-за пробела

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
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 13 01-ЛУ.pdf") # кавычки из-за пробела

