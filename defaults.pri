QT += gui bluetooth widgets xml positioning quick networkauth websockets texttospeech location multimedia sql
QTPLUGIN += qavfmediaplayer
QT+= charts

unix:android: QT += androidextras gui-private

android: include(android_openssl/openssl.pri)

INCLUDEPATH += $$PWD/src/qmdnsengine/src/include

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/src/android

# Personal build: both ARM ABIs, dropping only x86/x86_64 (emulator-only).
# This assignment is what actually decides the ABI list - it overrides
# ANDROID_ABIS passed on the qmake command line, so the workflow's flag alone
# has no effect.
#
# Do NOT narrow this to a single ARM ABI. androiddeployqt still emits a stub
# lib/<abi>/libc++_shared.so for the excluded ABIs, and Android picks exactly
# one ABI directory based on the device's primary ABI. A device whose primary
# ABI is the excluded one therefore selects a directory containing only that
# stub - no Qt, no app - and dies at startup with "Your application encountered
# a fatal error and cannot continue". An arm64-v8a-only build did exactly that
# on the target 32-bit tablet. Keeping both ARM ABIs complete avoids the trap;
# x86/x86_64 stubs are harmless because no ARM device selects them.
ANDROID_ABIS = armeabi-v7a arm64-v8a

#QMAKE_CXXFLAGS += -Werror=suggest-override
