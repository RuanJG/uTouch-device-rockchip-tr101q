#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
include device/rockchip/rk3188/BoardConfig.mk
$(call inherit-product, device/rockchip/rksdk/device.mk)
PRODUCT_BRAND := rockchip
PRODUCT_DEVICE := rk3188
PRODUCT_NAME := tr101q
PRODUCT_MANUFACTURER := rockchip

PRODUCT_MODEL := NBX-T10A2
CUSTOM_PRODUCT_BRAND := Noblex
PRODUCT_LOCALES := es_US $(PRODUCT_LOCALES)

TARGET_SYSTEM_PROP := $(wildcard $(LOCAL_PATH)/system.prop) 
BOARD_HAS_FLIPPED_SCREEN := false

# Get the long list of APNs
PRODUCT_COPY_FILES += device/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += device/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

#overlay
PRODUCT_PACKAGE_OVERLAYS += device/rockchip/$(PRODUCT_NAME)/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version = 1.0.0

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers

# Inherit from the common Open Source product configuration

PRODUCT_RESTRICT_VENDOR_FILES := false
BUILD_WITH_GOOGLE_MARKET := false

TARGET_PREBUILT_KERNEL := kernel/rockchip/kernel/arch/arm/boot/Image

SYSTEM_WITH_MANIFEST := false

PRODUCT_COPY_FILES += device/rockchip/tr101q/recovery_init.rc:recovery/root/init.rc
PRODUCT_COPY_FILES += device/rockchip/tr101q/recovery.fstab:recovery/root/etc/recovery.fstab
