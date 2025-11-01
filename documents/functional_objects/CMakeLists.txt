CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(functional_objects)

SET(SRC_NAME "АБВГ.ХХХХХ-01\ 12\ 01")

add_custom_target(
    extract_objects
#    COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/extract_functional_objects.sh"
    COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/extract_functional_objects_brief.sh"
        "galaxy_tranclucator"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../text_program/${SRC_NAME}/program"
)
add_custom_target(    
    move_objects
    COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/move_functional_objects.sh" "${CMAKE_SOURCE_DIR}/documents/explanatory_note/code/"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../text_program/${SRC_NAME}/program"
    DEPENDS extract_objects
)
add_custom_target(generate_functional_objects ALL DEPENDS move_objects)
