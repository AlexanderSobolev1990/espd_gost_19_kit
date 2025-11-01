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
	    ../common/назначение.tex
	    ../common/решаемые_задачи.tex
	    ../common/технические_и_программные_средства.tex
    src/структура_программы.tex
	    ../common/обозначение_и_наименование.tex
	    ../common/связи_программы.tex
	    ../common/функциональные_ограничения.tex	    
    src/компиляция_и_установка.tex    
    src/настройка_программы.tex
		../common/настройка_программы.tex
    src/проверка_программы.tex
	    ../common/проверка_программы.tex
    src/сообщения_системному_программисту.tex
		../common/записи_системного_лога.tex
	../abbreviations.tex
		../common/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    sysadmin_manual.tex
#    BIBFILES ../bibliography.bib ../bibliography_gost19.bib
    IMAGE_DIRS ../images
    INPUTS ${parts}
)

add_custom_command(
        TARGET sysadmin_manual
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/sysadmin_manual/sysadmin_manual.pdf
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 32 01.pdf") # кавычки из-за пробела

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
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01 32 01-ЛУ.pdf") # кавычки из-за пробела

