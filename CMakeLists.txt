CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(program_documentation)

# Поддиректории с соответствующими документами:

add_subdirectory(documents/example)

add_subdirectory(documents/technical_task) # Не для сдачи в нормоконтроль

add_subdirectory(documents/specification)
add_subdirectory(documents/program_description)
add_subdirectory(documents/usage_description)
add_subdirectory(documents/sysadmin_manual)
add_subdirectory(documents/operator_manual)
add_subdirectory(documents/testing_methodics)
add_subdirectory(documents/explanatory_note)
add_subdirectory(documents/iul)

# Архивирование документации
add_custom_target(
    custom_target
    COMMAND ${CMAKE_COMMAND} -E tar cfvz "программная_документация.tgz"
    "${CMAKE_CURRENT_SOURCE_DIR}/output/ЛУ/*.pdf"
    "${CMAKE_CURRENT_SOURCE_DIR}/output/*.pdf"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/output"
)
install(CODE "execute_process(COMMAND make custom_target)")
install(SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/script.cmake")
