#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Call the proprietary setup
$(call inherit-product, vendor/asus/X01BD/X01BD-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# HIDL HALs
$(call inherit-product, $(LOCAL_PATH)/hidl-hals.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

# Enforce RRO
PRODUCT_ENFORCE_RRO_TARGETS := *

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    antradio_app \
    libantradio

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libfmq \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    tinymix

# Audio Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# AV
include vendor/qcom/common/av/qti-av.mk

# Sound Trigger Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Bluetooth
PRODUCT_PACKAGES += \
    liba2dpoffload \
    libbthost_if

# BT-qti
include vendor/qcom/common/bt/qti-bt.mk

# Connectivity Engine support (CNE)
PRODUCT_PACKAGES += \
    cneapiclient \
    com.quicinc.cne

# Camera
PRODUCT_PACKAGES += \
    libxml2 \
    Snap

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Display
PRODUCT_PACKAGES += \
    copybit.sdm660 \
    gralloc.sdm660 \
    hwcomposer.sdm660 \
    memtrack.sdm660 \
    libdisplayconfig \
    liboverlay \
    libqdMetaData.system \
    libtinyxml \
    libgenlock

# Doze mode
PRODUCT_PACKAGES += \
    Doze

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Excluded Input devices
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# GPS / Location
PRODUCT_PACKAGES += \
    libcurl \
    libsensorndkbridge \
    libvehiclenetwork-native

PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    izat.conf \
    lowi.conf \
    sap.conf \
    gps.conf \
    xtwifi.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Lights
PRODUCT_PACKAGES += \
    lights.sdm660

# Manifest replacement for non NFC variant
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/device_check.sh:install/bin/device_check.sh

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_sdm660_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sdm660_v1.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_sdm660_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_sdm660_v1.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Media Extensions
PRODUCT_PACKAGES += \
    libavmediaserviceextensions \
    libmediametrics \
    libregistermsext \
    mediametrics

# Netutils
PRODUCT_PACKAGES += \
    libandroid_net \
    netutils-wrapper-1.0

# Nocutout
PRODUCT_PACKAGES += \
    NoCutoutOverlay

# NFC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libese-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libese-nxp.conf

PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag

# OMX
PRODUCT_PACKAGES += \
    libaacwrapper \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxSwVencHevc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_vendor \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0_vendor

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# QTI Performance
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/perf-profile0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perf-profile0.conf

# QTI whilelistapp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# Performance
include vendor/qcom/common/perf/qti-perf.mk

# Powerhint
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Radio
PRODUCT_PACKAGES += \
    rild \
    librmnetctl \
    libxml2 \
    libprotobuf-cpp-full \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.btmac.sh \
    init.class_main.sh \
    init.qcom.post_boot.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.wlan.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.msm.usb.configfs.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.safailnet.rc \
    init.target.rc \
    ueventd.qcom.rc

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_X01BD

# Sensor config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    telephony-ext

HIDL_WRAPPER := qti-telephony-hidl-wrapper
HIDL_WRAPPER += qti_telephony_hidl_wrapper.xml

QTI_TELEPHONY_UTILS := qti-telephony-utils
QTI_TELEPHONY_UTILS += qti_telephony_utils.xml

PRODUCT_PACKAGES += $(HIDL_WRAPPER)
PRODUCT_PACKAGES += $(QTI_TELEPHONY_UTILS)

PRODUCT_PACKAGES += libvndfwk_detect_jni.qti
PRODUCT_PACKAGES += libqti_vndfwk_detect
PRODUCT_PACKAGES += libvndfwk_detect_jni.qti.vendor
PRODUCT_PACKAGES += libqti_vndfwk_detect.vendor

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Thermal
PRODUCT_PACKAGES += \
    thermal.sdm660

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Touchscreen
PRODUCT_PACKAGES += \
    libtinyxml2

# QCOM
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-wfd.xml:system/etc/permissions/privapp-permissions-wfd.xml \
    $(LOCAL_PATH)/configs/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/telephony_product_privapp-permissions-qti.xml

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti.vendor

# QNS
PRODUCT_PACKAGES += \
    libstdc++.vendor

# USB
PRODUCT_PACKAGES += \
	android.hardware.usb@1.0-service.x01bd

# Vendor properties
-include $(LOCAL_PATH)/vendor_prop.mk

# VNDK-SP:
PRODUCT_PACKAGES += \
    vndk_package

# VR
PRODUCT_PACKAGES += \
    vr.sdm660

# Wallpapers
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt

# WFD
PRODUCT_PACKAGES += \
    libnl

PRODUCT_BOOT_JARS += \
    WfdCommon

# WiFi
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    libwifi-hal-qcom \
    wcnss_service \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
