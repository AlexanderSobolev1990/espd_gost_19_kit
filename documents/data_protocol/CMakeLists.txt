CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(data_protocol)
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
    src/входные_и_выходные_данные.tex
	../common/входные_данные.tex
	../common/выходные_данные.tex
    ../abbreviations.tex
        ../common/аббревиатуры.tex
)
ADD_LATEX_DOCUMENT(
    data_protocol.tex
#    BIBFILES ../bibliography.bib ../bibliography_gost19.bib
#    IMAGE_DIRS ../images
    INPUTS ${parts}
)

#add_custom_command(
#        TARGET data_protocol
#        COMMAND ${CMAKE_COMMAND} -E copy
#                ${CMAKE_SOURCE_DIR}/build/documents/data_protocol/data_protocol.pdf
#                ${CMAKE_SOURCE_DIR}/output/протокол_обмена.pdf)

# Лист утверждения отдельно:
#SET(parts_lu
#    ../espd.cls
#    ../preamble.tex
#)

#ADD_LATEX_DOCUMENT(
#    data_protocol_lu.tex
#    INPUTS ${parts_lu}
#)

#add_custom_command(
#        TARGET program_rules
#        COMMAND ${CMAKE_COMMAND} -E copy
#                ${CMAKE_SOURCE_DIR}/build/documents/program_rules/program_rules_lu.pdf
#                ${CMAKE_SOURCE_DIR}/output/протокол_обмена_лу.pdf)

