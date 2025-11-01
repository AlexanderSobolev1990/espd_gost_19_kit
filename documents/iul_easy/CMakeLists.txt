CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(iul_easy)

add_custom_target(
    do_iul_easy
    COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/replace_checksum.sh"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)
add_custom_target(iul_easy ALL DEPENDS do_iul_easy)
