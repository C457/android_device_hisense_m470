LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),m470)

include $(CLEAR_VARS)
LOCAL_MODULE := dbus-daemon
LOCAL_SRC_FILES := dbus-daemon
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := broadcom
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libdbus
LOCAL_SRC_FILES := libdbus.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := hisense
include $(BUILD_PREBUILT)

endif