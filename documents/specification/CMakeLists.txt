CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(specification)
FIND_PACKAGE(LATEX)
SET(PDFLATEX_COMPILER xelatex)
SET(LATEX_DEFAULT_BUILD pdf)
#SET(LATEX_OUTPUT_PATH build)
INCLUDE(../../UseLATEX.cmake)

# Основной документ:
SET(parts
    ../espd.cls
    ../preamble.tex
)
ADD_LATEX_DOCUMENT(
	specification.tex    
    INPUTS ${parts}
)

add_custom_command(
        TARGET specification
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/specification/specification.pdf
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01.pdf") # кавычки из-за пробела

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    specification_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET specification
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/specification/specification_lu.pdf
                "${CMAKE_SOURCE_DIR}/output/АБВГ.ХХХХХ-01-ЛУ.pdf") # кавычки из-за пробела

