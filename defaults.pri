QT += gui bluetooth widgets xml positioning quick networkauth websockets texttospeech location multimedia sql
QTPLUGIN += qavfmediaplayer
QT+= charts

unix:android: QT += androidextras gui-private

android: include(android_openssl/openssl.pri)

INCLUDEPATH += $$PWD/src/qmdnsengine/src/include

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/src/android

# Personal build: arm64-v8a only. This assignment is what actually decides the
# ABI list - it overrides ANDROID_ABIS passed on the qmake command line, so the
# workflow's flag alone has no effect. Dropping the other three ABIs takes the
# APK from ~491 MB to ~126 MB and compiles the native code once instead of four
# times. Note this makes the APK uninstallable on the x86 CI emulator.
ANDROID_ABIS = arm64-v8a

#QMAKE_CXXFLAGS += -Werror=suggest-override
