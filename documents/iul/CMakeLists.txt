CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(iul)
FIND_PACKAGE(LATEX)
SET(PDFLATEX_COMPILER xelatex)
SET(LATEX_DEFAULT_BUILD pdf)
#SET(LATEX_OUTPUT_PATH build)
INCLUDE(../../UseLATEX.cmake)

ADD_LATEX_DOCUMENT(
    iul.tex
)

add_custom_command(
        TARGET iul
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/iul/iul.pdf
                ${CMAKE_SOURCE_DIR}/output/иул.pdf)

