message( "***************************CMake Start**********************************" )
# CMake Settings12
cmake_minimum_required(VERSION 3.1.0)
# CMake Global Settings
message( "---------------------------Global Settings----------------------------------" )
set(CMAKE_BUILD_TYPE Debug)         # CMAKE_BUILD_TYPE
set(QT_STATIC 1)                    # QT_STATIC
message("CMAKE_BUILD_TYPE:" ${CMAKE_BUILD_TYPE})
message( "QT_STATIC is: " ${QT_STATIC} )
# CMake Include
include("recursive_search.cmake")
include("choose_qt_sdk.cmake")
include("force_mtd.cmake")
# CMake Find Package Path
if( NOT DEFINED CMAKE_PREFIX_PATH )
    CHOOSE_QT_SDK( QT_MSVC2013_32_STATIC )
else()
    message( "CMAKE_PREFIX_PATH from env: " ${CMAKE_PREFIX_PATH} )
endif( NOT DEFINED CMAKE_PREFIX_PATH )

# Python script
message( "---------------------------Python part----------------------------------" )
#[[
message(STATUS "This is src dir " ${Solution_SOURCE_DIR}/)
execute_process(COMMAND python3 qrc_build.py
                WORKING_DIRECTORY ${Solution_SOURCE_DIR}/ RESULT_VARIABLE rv)
message("qrc_build.py return value='${rv}'")
]]

message(STATUS "This is rcc dir " ${Solution_SOURCE_DIR}/../skins/)
execute_process(COMMAND python3 rcc_build.py
                WORKING_DIRECTORY ${Solution_SOURCE_DIR}/../skins/ RESULT_VARIABLE rv)
message("rcc_build.py return value='${rv}'")

# Solution Start
message( "---------------------------Solution part----------------------------------" )
project(Solution)

# set(<variable> <value>
#    [[CACHE <type> <docstring> [FORCE]] | PARENT_SCOPE])
set( project_name StaticQmlTester )
message( "Project name is: " ${project_name} )

message( "---------------------------runtime defines----------------------------------" )
# force to use mtd
configureMsvcRuntime()
IF(QT_STATIC)
	add_definitions(-DQT_STATICPLUGIN)
ENDIF(QT_STATIC)

# CMake Qt
message( "---------------------------Qt part----------------------------------" )
set(CMAKE_INCLUDE_CURRENT_DIR ON)   # Find includes in corresponding build directories
set(CMAKE_AUTOMOC ON)               # CMake moc automatically when needed
set(CMAKE_AUTOUIC ON)               # Create code from a list of Qt designer ui files
set(CMAKE_AUTORCC ON)               # CMake rcc automatically( handle qrc file )

# Find the QtWidgets library
find_package( Qt5 REQUIRED 
# QuickWidgets means CMake would search for ".\lib\cmake\Qt5QuickWidgetsConfig.cmake"
    COMPONENTS Core Gui Widgets Qml Quick QuickControls2 QuickWidgets
)

include_directories(
# Qt5::Core means there is ".\include\QtCore""
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets
    Qt5::Qml
    Qt5::Quick
    Qt5::QuickControls2
    Qt5::QuickWidgets
	Qt5::VirtualKeyboard
)

# set library directory
set(QSTATIC C:/Qt/Qt5.10.1_mt_static_vs2013/)
set(QLIBDIR ${QSTATIC}lib/)
set(QPLADIR ${QSTATIC}plugins/platforms/)
set(QPLGDIR ${QSTATIC}plugins/)
set(QQMLDIR ${QSTATIC}qml/)

# add library directory
message( "---------------------------qt static lib----------------------------------" )
RECURSIVE_SEARCH_DIR( ${QPLGDIR}*.lib QPLGDIR_list )
RECURSIVE_SEARCH_DIR( ${QQMLDIR}*.lib QQMLDIR_list )
RECURSIVE_SEARCH_NAME( ${QLIBDIR}*d.lib QLIBDIR_namelist )
RECURSIVE_SEARCH_NAME( ${QPLGDIR}*d.lib QPLGDIR_namelist )
RECURSIVE_SEARCH_NAME( ${QQMLDIR}*d.lib QQMLDIR_namelist )
link_directories(
    ${QLIBDIR}
    ${QPLGDIR_list}
    ${QQMLDIR_list}
)

# Platform libs
set(PLIBS
    Dwmapi.lib
    imm32.lib
    iphlpapi.lib
    Netapi32.lib
    opengl32.lib
    Winmm.lib
    ws2_32.lib
    version.lib#Mincore.lib
    userenv.lib
)

# Qt libs( not originally imported )
if(CMAKE_BUILD_TYPE STREQUAL Debug AND ${QT_STATIC} )
    message("CMAKE_BUILD_TYPE: Debug")
        set(QLIBS
        #lib-platform-base
        qtpcre2d.lib
        qtlibpngd.lib
        qtfreetyped.lib
        Qt5PlatformCompositorSupportd.lib
        Qt5EventDispatcherSupportd.lib
        Qt5AccessibilitySupportd.lib
        Qt5ThemeSupportd.lib
        #lib-control-qml
        Qt5FontDatabaseSupportd.lib
        qtharfbuzzd.lib
        Qt5Cored.lib
#       Qt5QuickControls2d.lib
        Qt5QuickTemplates2d.lib
        #plugin-platform
        ${QPLADIR}qwindowsd.lib
        #plugin
        #qml
        ${QQMLDIR}QtQuick.2/qtquick2plugind.lib
        #
        ${QQMLDIR}QtQuick/Window.2/windowplugind.lib
        #
        ${QQMLDIR}QtQuick/Controls.2/qtquickcontrols2plugind.lib
        ${QQMLDIR}QtQuick/Templates.2/qtquicktemplates2plugind.lib
        #
        ${QQMLDIR}QtQuick/Layouts/qquicklayoutsplugind.lib
        #
        ${QQMLDIR}QtQuick/Controls.2/Fusion/qtquickcontrols2fusionstyleplugind.lib
        ${QQMLDIR}QtQuick/Controls.2/Imagine/qtquickcontrols2imaginestyleplugind.lib
        ${QQMLDIR}QtQuick/Controls.2/Material/qtquickcontrols2materialstyleplugind.lib
        ${QQMLDIR}QtQuick/Controls.2/Universal/qtquickcontrols2universalstyleplugind.lib
        #
        ${QQMLDIR}QtQuick/Dialogs/dialogplugind.lib
        ${QQMLDIR}QtQuick/Dialogs/Private/dialogsprivateplugind.lib
        #
        ${QQMLDIR}Qt/labs/folderlistmodel/qmlfolderlistmodelplugind.lib
        ${QQMLDIR}Qt/labs/settings/qmlsettingsplugind.lib
        ${QQMLDIR}QtGraphicalEffects/qtgraphicaleffectsplugind.lib
        ${QQMLDIR}QtGraphicalEffects/private/qtgraphicaleffectsprivated.lib
        ${QQMLDIR}QtQml/Models.2/modelsplugind.lib
        ${QQMLDIR}QtQuick/Extras/qtquickextrasplugind.lib
        ${QQMLDIR}QtQuick/PrivateWidgets/widgetsplugind.lib
        #
        qtquickcontrolsplugind.lib
        )
elseif(CMAKE_BUILD_TYPE STREQUAL Release AND ${QT_STATIC} )
    message("CMAKE_BUILD_TYPE: Release")
    set(QLIBS
        #lib-platform-base
        qtpcre2.lib
        qtlibpng.lib
        qtfreetype.lib
        Qt5PlatformCompositorSupport.lib
        Qt5EventDispatcherSupport.lib
        Qt5AccessibilitySupportd.lib
        Qt5ThemeSupport.lib
        #lib-control-qml
        Qt5FontDatabaseSupport.lib
        qtharfbuzz.lib
        Qt5Core.lib
#        Qt5QuickControls2.lib
        Qt5QuickTemplates2.lib
        #plugin-platform
        ${QPLADIR}qwindows.lib
        #plugin
        #qml
        ${QQMLDIR}QtQuick.2/qtquick2plugin.lib
        #
        ${QQMLDIR}QtQuick/Window.2/windowplugin.lib
        #
        ${QQMLDIR}QtQuick/Controls/qtquickcontrolsplugin.lib
        ${QQMLDIR}QtQuick/Templates.2/qtquicktemplates2plugin.lib
        #
        ${QQMLDIR}QtQuick/Layouts/qquicklayoutsplugin.lib
        #
        ${QQMLDIR}QtQuick/Controls.2/Fusion/qtquickcontrols2fusionstyleplugin.lib
        ${QQMLDIR}QtQuick/Controls.2/Imagine/qtquickcontrols2imaginestyleplugin.lib
        ${QQMLDIR}QtQuick/Controls.2/Material/qtquickcontrols2materialstyleplugin.lib
        ${QQMLDIR}QtQuick/Controls.2/Universal/qtquickcontrols2universalstyleplugin.lib
        #
        ${QQMLDIR}QtQuick/Dialogs/dialogplugin.lib
        ${QQMLDIR}QtQuick/Dialogs/Private/dialogsprivateplugin.lib
        #
        ${QQMLDIR}Qt/labs/folderlistmodel/qmlfolderlistmodelplugin.lib
        ${QQMLDIR}Qt/labs/settings/qmlsettingsplugin.lib
        ${QQMLDIR}QtGraphicalEffects/qtgraphicaleffectsplugin.lib
        ${QQMLDIR}QtGraphicalEffects/private/qtgraphicaleffectsprivate.lib
        ${QQMLDIR}QtQml/Models.2/modelsplugin.lib
        ${QQMLDIR}QtQuick/Extras/qtquickextrasplugin.lib
        ${QQMLDIR}QtQuick/PrivateWidgets/widgetsplugin.lib
        #
        qtquickcontrolsplugin.lib
        )
elseif(CMAKE_BUILD_TYPE STREQUAL Debug)
    message("CMAKE_BUILD_TYPE: Debug  && not static ")
elseif(CMAKE_BUILD_TYPE STREQUAL Release)
    message("CMAKE_BUILD_TYPE: Release  && not static ")
else(CMAKE_BUILD_TYPE STREQUAL Debug)
	message("CMAKE_BUILD_TYPE is: " ${CMAKE_BUILD_TYPE} )
    #message(FATAL_ERROR "please set CMAKE_BUILD_TYPE = Debug | Release")
endif(CMAKE_BUILD_TYPE STREQUAL Debug AND ${QT_STATIC})

# Populate a CMake variable with the sources
FILE(GLOB project_sources
    main.cpp
    EngineReloader.cpp
    EngineReloaderWrapper.cpp
	QuickViewReloader.cpp
	QuickViewReloaderWrapper.cpp
    Widget.cpp
	QmlObjs.cpp
	Resource.cpp
)

FILE(GLOB project_headers
    *.h
)

FILE(GLOB project_resources 
	# cmake
    choose_qt_sdk.cmake
    recursive_search.cmake
	force_mtd.cmake
	# javascript
	utils.js
	# qrc
    main.qrc

	*.qml
#[[
	# qml
	default.qml
    main.qml
    method2.qml
	# Controls
	button_demo.qml
	TabBar.qml
	busyindicator_demo.qml
	keyboardLoader.qml
	Keyboard.qml
	#
	popup_demo2.qml
	Popup_demo2_keyboard.qml
	#
	Coordinate.qml
]]
)

#Same type together
SOURCE_GROUP("Source Files" FILES ${project_sources})
SOURCE_GROUP("Header Files" FILES ${project_headers})
SOURCE_GROUP("Resource Files" FILES ${project_resources})

# mark as startup project
IF(WIN32 AND MSVC)
	set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${project_name})
ENDIF()

# Tell CMake to create the project executable
add_executable( ${project_name} WIN32 ${project_sources} ${project_headers} ${project_resources})

# set_target_properties(target1 target2 ...PROPERTIES prop1 value1 prop2 value2 ...)
# PDB Path
#SET_TARGET_PROPERTIES( ${project_name} PROPERTIES PDB_OUTPUT_DIRECTORY_DEBUG	${CMAKE_BINARY_DIR}/../bin/ )
#SET_TARGET_PROPERTIES( ${project_name} PROPERTIES PDB_OUTPUT_DIRECTORY_RELEASE	${CMAKE_BINARY_DIR}/../bin )
# Output Path
set_target_properties( ${project_name} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG	${CMAKE_BINARY_DIR}/../bin )
set_target_properties( ${project_name} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELEASE	${CMAKE_BINARY_DIR}/../bin )
# Output Name
SET_TARGET_PROPERTIES( ${project_name} PROPERTIES OUTPUT_NAME_DEBUG   "qmltester_d")
SET_TARGET_PROPERTIES( ${project_name} PROPERTIES OUTPUT_NAME_RELEASE "qmltester")

# Must After add_executable
target_link_libraries( ${project_name}
    ${PLIBS}
    ${Qt5Core_LIBRARIES}
    ${Qt5Gui_LIBRARIES}
    ${Qt5Widgets_LIBRARIES}
    ${Qt5Qml_LIBRARIES}
    ${Qt5Quick_LIBRARIES}
    ${Qt5QuickControls2_LIBRARIES}
    ${Qt5QuickWidgets_LIBRARIES}
	${Qt5VirtualKeyboard_LIBRARIES}
#[[]]
        ${QLIBS}

#[[
    ${QLIBDIR_namelist}
    ${QPLGDIR_namelist}
    ${QQMLDIR_namelist}
]]

)

# Message Test
message(STATUS "This is test: " ${Qt5Gui_LIBRARIES})
message( "***************************CMake End**********************************" )