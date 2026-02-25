cmake_minimum_required(VERSION 3.16)

project(qt_learn VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17) # 指定C++语言标准
set(CMAKE_CXX_STANDARD_REQUIRED ON) # 强制要求指定的标准必须被满足
set(CMAKE_CXX_EXTENSIONS OFF) # 禁止编译器使用扩展，保证代码跨平台可移植

set(CMAKE_AUTOMOC ON) # 自动处理信号和槽
set(CMAKE_AUTOUIC ON) # 自动处理界面文件
set(CMAKE_AUTORCC ON) # 自动处理资源文件

# 找到Qt6的组件
set(REQUIRED_QT_COMPONENTS Core Gui Widgets Quick QuickControls2)
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS ${REQUIRED_QT_COMPONENTS})
# message(Qt${QT_VERSION_MAJOR})
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS ${REQUIRED_QT_COMPONENTS})

# 设置头文件路径
include_directories(${CMAKE_SOURCE_DIR}/src)

# 设置源文件列表
file(GLOB SOURCES_FILE
    ${CMAKE_SOURCE_DIR}/src/*.cpp
)

set(TARGET_NAME "${PROJECT_NAME}")

# # 添加可执行文件
# add_executable(${TARGET_NAME} ${HEADERS} ${SOURCES})

# 为典型的 Qt 应用程序设置整个项目的默认值
qt_standard_project_setup(REQUIRES 6.8)
# Qt提供的add_executable封装
qt_add_executable(${TARGET_NAME} ${SOURCES_FILE})
qt_add_qml_module(${TARGET_NAME}
    URI "qt_quick"
    VERSION 1.0
    QML_FILES qml/Main.qml
    QML_FILES qml/Page1.qml
    QML_FILES qml/Page2.qml
    QML_FILES qml/Page3.qml
    RESOURCES qml/resource.qrc
)

# 链接Qt的库
target_link_libraries(${TARGET_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Widgets
    Qt${QT_VERSION_MAJOR}::Quick
    Qt${QT_VERSION_MAJOR}::QuickControls2
)

# 设置macOS和Windows相关属性
set_target_properties(${TARGET_NAME} PROPERTIES
    ${BUILD_ID_OPTION}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
