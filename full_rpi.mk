
$(call inherit-product, build/target/product/full_base.mk)

$(call inherit-product, device/rpi/raspberrypi/device.mk)

VENDOR_PATH := vendor/rpi/raspberrypi

USERLAND_CFLAGS := \
        -D_REENTRANT \
        -DUSE_VCHIQ_ARM -DVCHI_BULK_ALIGN=1 -DVCHI_BULK_GRANULARITY=1 \
        -DOMX_SKIP64BIT \
        -DEGL_SERVER_DISPMANX \
        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
        -DEGL_EGLEXT_ANDROID_STRUCT_HEADER \
        -Wno-multichar \
        -Wall \
        -Wno-unused-but-set-variable \
        -Wno-unused-variable

USERLAND_INCLUDES := \
        $(VENDOR_PATH)/userland \
        $(VENDOR_PATH)/userland/include \
        $(VENDOR_PATH)/userland/host_applications/framework \
        $(VENDOR_PATH)/userland/host_applications/linux/libs/bcm_host/include \
        $(VENDOR_PATH)/userland/interface/vcos/pthreads \
        $(VENDOR_PATH)/userland/interface/vmcs_host/linux \
        $(VENDOR_PATH)/userland/interface/vmcs_host \
        $(VENDOR_PATH)/userland/interface/vmcs_host/khronos \
        $(VENDOR_PATH)/userland/interface/khronos/include \
        $(VENDOR_PATH)/userland/interface/vchiq_arm \
        $(VENDOR_PATH)/userland/host_support/include \
        $(VENDOR_PATH)/userland/host_applications/vmcs

LIB_GRALLOC_BRCM_INCLUDE := $(VENDOR_PATH)/libgralloc_brcm
LIB_GRALLOC_DISPMANX_INCLUDE := $(VENDOR_PATH)/libgralloc_dispmanx
GRALLOC_RPI_INCLUDE := $(VENDOR_PATH)/gralloc

#
# Overrides
#
PRODUCT_NAME := full_raspberrypi
PRODUCT_DEVICE := raspberrypi
