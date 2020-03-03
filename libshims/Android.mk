LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := tf98xx.c
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_HEADER_LIBRARIES := libhardware_headers
LOCAL_C_INCLUDES := $(TOP)/vendor/qcom/opensource/audio-hal/primary-hal/hal
LOCAL_CFLAGS += -DASUS_TFA98XX_ENABLED
LOCAL_MODULE := libamp_shim
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)
