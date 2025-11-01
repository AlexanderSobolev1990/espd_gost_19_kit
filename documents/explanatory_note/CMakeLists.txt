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
    	../common/основание.tex
    src/назначение.tex
    	../common/назначение.tex
   		../common/функциональные_ограничения.tex
    src/технические_характеристики.tex
    	../common/алгоритм_методы_и_принципы.tex
    	../common/алгоритм_этапы.tex
    	../common/решаемые_задачи.tex
    	../common/алгоритм_структурная_схема.tex
    	../common/связи_программы.tex
    	../common/входные_данные.tex
    	../common/выходные_данные.tex
    	../common/функциональные_ограничения.tex
		../common/технические_и_программные_средства.tex
    src/технико_экономические_показатели.tex
	src/перечень_функциональных_объектов.tex
        code/functional_objects.txt # Перечень функциональных объектов! См. KNOWN_ISSUES.txt                
 	../abbreviations.tex
 		../common/аббревиатуры.tex    
)
ADD_LATEX_DOCUMENT(
    explanatory_note.tex
    BIBFILES ../bibliography.bib ../bibliography_gost19.bib
    IMAGE_DIRS ../images
    DEPENDS code/functional_objects.txt
    INPUTS ${parts}
)

add_custom_command(
        TARGET explanatory_note
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/explanatory_note/explanatory_note.pdf
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 81 01.pdf" # кавычки из-за пробела
)

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
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 81 01-ЛУ.pdf") # кавычки из-за пробела

