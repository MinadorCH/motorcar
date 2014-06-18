QT += gui widgets gui-private core-private compositor compositor-private

#QTWAYLANDPATH=$$PWD/../thirdPartySource/qt5_GLES/qtwayland/src/compositor


LIBOVRPATH=$$PWD/../thirdPartySource/Oculus/OculusSDK/LibOVR
SIXENSEPATH=$$PWD/../thirdPartySource/sixenseSDK_linux_OSX
RELEASETYPE=Release
SYSARCH=x86_64
INCLUDEPATH += "$$LIBOVRPATH/Include" "$$LIBOVRPATH/Src" "$$SIXENSEPATH/include" /opt/softkinetic/DepthSenseSDK/include


LIBS +=  -lwayland-server -lwayland-client

LIBS += -L/home/dave/thesis/thirdPartySource/sixenseSDK_linux_OSX/lib/linux_x64/release -lsixense_utils_x64 -lsixense_x64

LIBS += -L/opt/softkinetic/DepthSenseSDK/lib/ -lDepthSense

LIBS += -L$$LIBOVRPATH/Lib/Linux/$$RELEASETYPE/$$SYSARCH -lovr

LIBS +=  -ludev -lpthread -lGL -lX11 -lXinerama


MOTORCAR_PROTOCOL_PATH=$$PWD/motorcar/protocol/
system(cd $$MOTORCAR_PROTOCOL_PATH; make)

INCLUDEPATH += $$MOTORCAR_PROTOCOL_PATH
#LIBS +=  -L $$MOTORCAR_PROTOCOL_PATH -lmotorcar-server
HEADERS += $$MOTORCAR_PROTOCOL_PATH/motorcar-server-protocol.h
SOURCES += $$MOTORCAR_PROTOCOL_PATH/motorcar-wayland-extensions.c

DESTDIR = bin
OBJECTS_DIR = bin/.obj
MOC_DIR = bin/.moc
RCC_DIR = bin/.rcc
UI_DIR = bin/.ui

QMAKE_CXXFLAGS += -std=c++11 -DGL_GLEXT_PROTOTYPES 


LIBS += -L $$QTWAYLANDSOURCEPATH/lib -lGL 
INCLUDEPATH += $$QTWAYLANDSOURCEPATH/include
INCLUDEPATH += $$QTWAYLANDSOURCEPATH/include/QtCompositor/5.3.0/

#  if you want to compile QtCompositor as part of the application
#  instead of linking to it, remove the QT += compositor and uncomment
#  the following line
#include($$PWD/../thirdPartySource/qt5_GLES/qtwayland/src/compositor/compositor.pri)

RESOURCES += motorcar-compositor.qrc

target.path = $$[QT_INSTALL_EXAMPLES]/qtwayland/motorcar-compositor
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS motorcar-compositor.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtwayland/motorcar-compositor
INSTALLS += target sources

HEADERS += \
    qt/src/textureblitter.h \
    qt/src/qtwaylandmotorcarcompositor.h \
    qt/src/qopenglwindow.h \
    qt/src/opengldata.h \
    motorcar/src/geometry.h \
    motorcar/src/scenegraph/scenegraphnode.h \
    motorcar/src/scenegraph/scenegraph.h \
    motorcar/src/scenegraph/physicalnode.h \
    motorcar/src/scenegraph/virtualnode.h \
    motorcar/src/scenegraph/scene.h \
    motorcar/src/scenegraph/output/drawable.h \
    motorcar/src/scenegraph/output/wayland/waylandsurfacenode.h \
    motorcar/src/scenegraph/output/output.h \
    motorcar/src/motorcar.h \
    qt/src/qtwaylandmotorcarsurface.h \
    motorcar/src/gl/openglshader.h \
    motorcar/src/gl/GLSLHelper.h \
    motorcar/src/gl/openglcontext.h \
    qt/src/qtwaylandmotorcaropenglcontext.h \
    motorcar/src/scenegraph/output/display/display.h \
    motorcar/src/scenegraph/output/display/rendertotexturedisplay.h \
    motorcar/src/device/device.h \
    motorcar/src/device/oculushmd.h \
    motorcar/src/device/sixensemotionsensingsystem.h \
    motorcar/src/device/sixensecontrollernode.h \
    motorcar/src/device/sixensebasenode.h \
    motorcar/src/scenegraph/output/wireframenode.h \
    motorcar/src/compositor.h \
    motorcar/src/scenegraph/input/bone.h \
    motorcar/src/scenegraph/input/bonesensor.h \
    motorcar/src/scenegraph/input/skeleton.h \
    motorcar/src/scenegraph/input/singlebonetracker.h \
    motorcar/src/displayserver.h \
    motorcar/src/windowmanager.h \
    motorcar/src/events/event.h \
    motorcar/src/events/mouseevent.h \
    motorcar/src/events/events.h \
    motorcar/src/events/keyboardevent.h \
    motorcar/src/wayland/input/seat.h \
    motorcar/src/wayland/input/pointer.h \
    motorcar/src/wayland/input/keyboard.h \
    motorcar/src/wayland/input/waylandinput.h \
    motorcar/src/wayland/output/waylandsurface.h \
    qt/src/qtwaylandmotorcarseat.h \
    motorcar/src/scenegraph/input/input.h \
    motorcar/src/shell.h \
    motorcar/src/scenegraph/output/viewpoint.h \
    motorcar/src/gl/viewport.h \
    motorcar/src/device/softkineticdepthcamera.h \
    motorcar/src/events/sixdofevent.h \
    motorcar/src/scenegraph/input/sixdofpointingdevice.h \
    motorcar/src/scenegraph/output/wayland/motorcarsurfacenode.h


SOURCES += \
    src/main.cpp \
    qt/src/textureblitter.cpp \
    qt/src/qtwaylandmotorcarcompositor.cpp \
    qt/src/qopenglwindow.cpp \
    qt/src/opengldata.cpp \
    motorcar/src/geometry.cpp \
    motorcar/src/scenegraph/scenegraphnode.cpp \
    motorcar/src/scenegraph/physicalnode.cpp \
    motorcar/src/scenegraph/virtualnode.cpp \
    motorcar/src/scenegraph/scene.cpp \
    motorcar/src/scenegraph/output/drawable.cpp \
    motorcar/src/scenegraph/output/wayland/waylandsurfacenode.cpp \
    qt/src/qtwaylandmotorcarsurface.cpp \
    motorcar/src/gl/openglshader.cpp \
    motorcar/src/gl/GLSLHelper.cpp \
    motorcar/src/gl/openglcontext.cpp \
    qt/src/qtwaylandmotorcaropenglcontext.cpp \
    motorcar/src/scenegraph/output/display/display.cpp \
    motorcar/src/scenegraph/output/display/rendertotexturedisplay.cpp \
    motorcar/src/device/oculushmd.cpp \
    motorcar/src/device/sixensemotionsensingsystem.cpp \
    motorcar/src/device/sixensecontrollernode.cpp \
    motorcar/src/device/sixensebasenode.cpp \
    motorcar/src/scenegraph/output/wireframenode.cpp \
    motorcar/src/compositor.cpp \
    motorcar/src/scenegraph/input/bone.cpp \
    motorcar/src/scenegraph/input/bonesensor.cpp \
    motorcar/src/scenegraph/input/skeleton.cpp \
    motorcar/src/scenegraph/input/singlebonetracker.cpp \
    motorcar/src/displayserver.cpp \
    motorcar/src/windowmanager.cpp \
    motorcar/src/events/event.cpp \
    motorcar/src/events/mouseevent.cpp \
    motorcar/src/events/keyboardevent.cpp \
    motorcar/src/wayland/input/seat.cpp \
    motorcar/src/wayland/input/pointer.cpp \
    motorcar/src/wayland/input/keyboard.cpp \
    motorcar/src/wayland/output/waylandsurface.cpp \
    qt/src/qtwaylandmotorcarseat.cpp \
    motorcar/src/shell.cpp \
    motorcar/src/scenegraph/output/viewpoint.cpp \
    motorcar/src/gl/viewport.cpp \
    motorcar/src/device/softkineticdepthcamera.cpp \
    motorcar/src/events/sixdofevent.cpp \
    motorcar/src/scenegraph/input/sixdofpointingdevice.cpp \
    motorcar/src/scenegraph/output/wayland/motorcarsurfacenode.cpp



OTHER_FILES += \
    src/motorcarsurface.vert \
    src/motorcarsurface.frag \
    src/motorcar/shaders/motorcarsurface.vert \
    src/motorcar/shaders/motorcarsurface.frag \
    motorcar/src/shaders/motorcarsurface.vert \
    motorcar/src/shaders/motorcarsurface.frag \
    motorcar/src/shaders/motorcarbarreldistortion.frag \
    motorcar/src/shaders/motorcarbarreldistortion.vert \
    motorcar/src/shaders/motorcarline.vert \
    motorcar/src/shaders/motorcarline.frag \
    motorcar/src/shaders/depthcompositedsurface.vert \
    motorcar/src/shaders/depthcompositedsurface.frag \
    motorcar/src/shaders/depthcompositedsurfaceblitter.frag \
    motorcar/src/shaders/depthcompositedsurfaceblitter.vert \
    motorcar/src/shaders/softkineticdepthcam.vert \
    motorcar/src/shaders/softkineticdepthcam.frag



