#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Inherit from vendor if exists
$(call inherit-product-if-exists, vendor/xiaomi/juice/juice-vendor.mk)

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    kernel/xiaomi/juice

PRODUCT_BUILD_SUPER_PARTITION := false
BOARD_BUILD_PRODUCT_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.0-impl-mock

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant.antradio_library \
    com.dsi.ant@1.0

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    vendor.qti.hardware.audiohalext@1.0 \
    vendor.qti.hardware.audiohalext-utils

PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_PACKAGES += \
    tinymix \
    libaudio-resampler

# Bluetooth
 PRODUCT_PACKAGES += \
    BluetoothQti

# Google Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Codec2 files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_telephony.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/media_codecs_google_c2_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/media_codecs_google_c2_video.xml

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_COPY_OUT_RAMDISK)/fstab.default

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Init
PRODUCT_PACKAGES += \
    init.mi_thermald.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl \
    $(LOCAL_PATH)/keylayout/uinput-focal.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-focal.kl \
    $(LOCAL_PATH)/keylayout/uinput-cdfinger.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-cdfinger.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_juice

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3-service.juice-libperfmgr \
    android.hardware.power.stats@1.0-service.pixel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power-libperfmgr/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge \
    android.hardware.sensors@2.0-service.multihal

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Target VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Vendor Overlay
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor-overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)) \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/bluetooth_audio_policy_configuration.xml


PRODUCT_PACKAGES += \
    AospFrameworkResOverlay \
    AospWifiResOverlay \
    CarrierConfigResCommon \
    CellBroadcastReceiverResCommon \
    FrameworksResCommon \
    FrameworksResTarget \
    GmsTelecommOverlay \
    GmsTelephonyOverlay \
    SystemUIResCommon \
    TelecommResCommon \
    TelephonyResCommon \
    WifiResCommon
