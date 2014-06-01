#
# Copyright (C) 2010 The Android Open Source Project
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

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi


PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    tf.enable=true \
    drm.service.enabled=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/ramdisk/fstab.m470:root/fstab.m470 \
    device/hisense/m470/prebuilt/ramdisk/init.m470.rc:root/init.m470.rc \
    device/hisense/m470/prebuilt/ramdisk/init.m470.usb.rc:root/init.m470.usb.rc \
    device/hisense/m470/prebuilt/ramdisk/init.tf.rc:root/init.tf.rc \
    device/hisense/m470/prebuilt/ramdisk/ueventd.m470.rc:root/ueventd.m470.rc \
    device/hisense/m470/prebuilt/ramdisk/twrp.fstab:recovery/root/etc/twrp.fstab \
    device/hisense/m470/prebuilt/ramdisk/twrp.fstab:recovery/root/etc/extra.fstab

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml 

PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    device/hisense/m470/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    brcm_patchram_plus \
    bttest \
    charger \
    charger_res_images \
    com.android.future.usb.accessory \
    dbus-daemon \
    keystore.m470 \
    l2ping \
    libaudioutils \
    libbt-vendor \
    libdbus \
    libdumpstate.m470 \
    libhealthd.m470 \
    librs_jni \
    libstagefrighthw \
    libtinyalsa \
    lights.m470 \
    setup_fs \
    wifimacwriter

# Include Proprietary files
include vendor/hisense/m470/device-vendor.mk

#$(call inherit-product-if-exists, vendor/hisense/m470/device-vendor.mk)

# NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.m470 \
    NfcNci \
    Tag \
    com.android.nfc_extras

PRODUCT_CHARACTERISTICS := tablet

# build wireless firmware instead of using prebuilts
WIFI_BAND := 802_11_ABGN
PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/fw_bcm4330_abg.bin:system/vendor/firmware/fw_bcmdhd.bin \
    hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/fw_bcm4330_apsta_bg.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin
#

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Bluetooth config file
PRODUCT_COPY_FILES += \
    device/hisense/m470/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# ALSA Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
    $(LOCAL_PATH)/prebuilt/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    $(LOCAL_PATH)/prebuilt/alsa/alsa.conf:system/usr/share/alsa/alsa.conf

# etc
PRODUCT_COPY_FILES += \
    device/hisense/m470/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/hisense/m470/prebuilt/etc/dbus.conf:system/etc/dbus.conf \
    device/hisense/m470/prebuilt/etc/enctune.conf:system/etc/enctune.conf \
    device/hisense/m470/prebuilt/etc/gps.conf:system/etc/gps.conf \
    device/hisense/m470/prebuilt/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/hisense/m470/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/hisense/m470/prebuilt/etc/model_frontal.xml:system/etc/model_frontal.xml \
    device/hisense/m470/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/hisense/m470/prebuilt/etc/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    device/hisense/m470/prebuilt/etc/nvcamera.conf:system/etc/nvcamera.conf \
    device/hisense/m470/prebuilt/etc/nvram_4330.txt:system/etc/nvram_4330.txt \
    device/hisense/m470/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/hisense/m470/prebuilt/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \


# Wifi
PRODUCT_PACKAGES += \
wpa_supplicant_overlay.conf \
p2p_supplicant_overlay.conf \
p2p_supplicant.conf

# NFC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# NFCEE access control
    NFCEE_ACCESS_PATH := device/hisense/m470/prebuilt/etc/nfcee_access.xml

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

DEVICE_PACKAGE_OVERLAYS := \
    device/hisense/m470/overlay

$(call inherit-product, frameworks/base/data/sounds/AudioPackage10.mk)
