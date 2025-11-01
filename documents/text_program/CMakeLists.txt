CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(text_program)

add_custom_target(
    do_zip_text_program
    COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/do_zip_text_program.sh"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)
add_custom_target(
    move_zip_text_program
    COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/move_zip_text_program.sh" "${CMAKE_SOURCE_DIR}/output/"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    DEPENDS do_zip_text_program
)
add_custom_target(generate_zip_text_program ALL DEPENDS move_zip_text_program)