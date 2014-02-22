LOCAL_PATH:= $(call my-dir)

ifeq ($(TARGET_DEVICE),m470)

include $(CLEAR_VARS)
LOCAL_MODULE := libtinyalsa
LOCAL_SRC_FILES := libtinyalsa.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := hisense
include $(BUILD_PREBUILT)

endif