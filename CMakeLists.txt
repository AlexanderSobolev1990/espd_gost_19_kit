CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(program_documentation)
#
# Не для сдачи в нормоконтроль:
#
#add_subdirectory(documents/technical_task)
add_subdirectory(documents/data_protocol)
#
# Документация по ГОСТ-19
#
add_subdirectory(documents/specification)
add_subdirectory(documents/program_description)
add_subdirectory(documents/usage_description)
add_subdirectory(documents/sysadmin_manual)
add_subdirectory(documents/operator_manual)
add_subdirectory(documents/testing_methodics)
add_subdirectory(documents/functional_objects)
add_subdirectory(documents/explanatory_note)
add_subdirectory(documents/text_program)
add_subdirectory(documents/iul_easy)

# В пояснительной записке есть раздел "перечень функциональных объектов", поэтому сначала этот перечень надо создать:
add_dependencies(explanatory_note generate_functional_objects)

# Информационно-удостоверяющий лист делается по готовому целевому архиву, так что сначала надо его собрать в text_program
add_dependencies(iul_easy generate_zip_text_program)

