LOCAL_PATH:= $(call my-dir)

#
# libcameraservice
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    CameraService.cpp

LOCAL_SHARED_LIBRARIES:= \
    libui \
    libutils \
    libbinder \
    libcutils \
    libmedia \
    libcamera_client \
    libgui \
    libhardware

LOCAL_MODULE:= libcameraservice

ifeq ($(BOARD_CAMERA_USE_GETBUFFERINFO),true)
LOCAL_CFLAGS += -DUSE_GETBUFFERINFO
endif

ifeq ($(BOARD_USE_FROYO_LIBCAMERA), true)
LOCAL_CFLAGS += -DBOARD_USE_FROYO_LIBCAMERA
endif

ifeq ($(BOARD_HAVE_HTC_FFC), true)
LOCAL_CFLAGS += -DBOARD_HAVE_HTC_FFC
endif

ifeq ($(BOARD_USE_REVERSE_FFC), true)
LOCAL_CFLAGS += -DBOARD_USE_REVERSE_FFC
endif

ifeq ($(BOARD_FLIPS_FFC_VERTICAL),true)
LOCAL_CFLAGS += -DBOARD_FLIPS_FFC_VERTICAL
endif

ifeq ($(BOARD_FIRST_CAMERA_FRONT_FACING),true)
    LOCAL_CFLAGS += -DFIRST_CAMERA_FACING=CAMERA_FACING_FRONT -DFIRST_CAMERA_ORIENTATION=0
endif

ifeq ($(BOARD_OVERLAY_FORMAT_YCbCr_420_SP),true)
LOCAL_CFLAGS += -DUSE_OVERLAY_FORMAT_YCbCr_420_SP
LOCAL_C_INCLUDES += hardware/msm7k/libgralloc-qsd8k
endif

ifeq ($(BOARD_OVERLAY_FORMAT_YCrCb_420_SP),true)
LOCAL_CFLAGS += -DUSE_OVERLAY_FORMAT_YCrCb_420_SP
LOCAL_C_INCLUDES += hardware/msm7k/libgralloc-qsd8k
endif

ifeq ($(TARGET_USE_MOTO_CUSTOM_CAMERA_PARAMETERS),true)
    LOCAL_CFLAGS += -DMOTO_CUSTOM_PARAMETERS
endif

include $(BUILD_SHARED_LIBRARY)
