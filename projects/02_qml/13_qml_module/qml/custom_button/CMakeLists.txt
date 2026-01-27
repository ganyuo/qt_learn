set(MODULE_NAME great_buttons)
set(LIB_NAME ${MODULE_NAME}lib)

qt_add_library(${LIB_NAME} STATIC)
set_target_properties(${LIB_NAME} PROPERTIES AUTOMOC ON)

qt_add_qml_module(${LIB_NAME}
    URI ${MODULE_NAME}
    RESOURCE_PREFIX /
    QML_FILES
        Red_button.qml
        Green_button.qml
        Blue_button.qml
        Yellow_button.qml
)

# 链接Qt的库
target_link_libraries(${LIB_NAME} PRIVATE
    Qt6::Quick
)
