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


TARGET_BOARD_PLATFORM := tegra3
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := enterprise
TARGET_BOARD_PLATFORM := tegra3

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Optimization build flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Some proprietary libs need reservedVectorImpl variants
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_AUDIO := true

# Sense 4.5 / Sense 5 audio.primary blob support. See: include/hardware/audio.h
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
# COMMON_GLOBAL_CFLAGS += -DHTC_TEGRA_AUDIO

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_HAL_STATIC_LIBRARIES := \
    libdumpstate.m470 \
    libhealthd.m470

# Kernel
TARGET_PREBUILT_KERNEL := device/hisense/m470/prebuilt/kernel/kernel
BOARD_KERNEL_CMDLINE := androidboot.selinux=enforce
TARGET_KERNEL_SOURCE := kernel/hisense/m470
# TARGET_KERNEL_CONFIG := dave_cpu_overclock_m470_defconfig
# TARGET_KERNEL_CONFIG := dave_m470_defconfig
# TARGET_KERNEL_CONFIG := dave_no_oc_cq_m470_defconfig
TARGET_KERNEL_CONFIG := dave_no_overclock_m470_defconfig

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/hisense/m470


# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hisense/m470/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/hisense/m470/bluetooth/vnd_m470.txt

# Use the CM PowerHAL
TARGET_USES_CM_POWERHAL := true

# Wireless
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"

# Sensors invensense
BOARD_USES_GENERIC_INVENSENSE := false

# Video
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/hisense/m470/prebuilt/lib/egl/egl.cfg
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_m470
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/hisense/m470/prebuilt/ramdisk/fstab.m470
BOARD_RECOVERY_SWIPE := true

# Twrp
DEVICE_RESOLUTION := 800x1280
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Hardware overlay
BOARD_HARDWARE_CLASS := device/hisense/m470/cmhw/

# Selinux
BOARD_SEPOLICY_DIRS := \
        device/hisense/m470/sepolicy

BOARD_SEPOLICY_UNION := \
        file_contexts \
        genfs_contexts \
        app.te \
        btmacreader.te \
        device.te \
        drmserver.te \
        init_shell.te \
        file.te \
        rild.te \
        sensors_config.te \
        shell.te \
        surfaceflinger.te \
        system.te \
        zygote.te

BOARD_CHARGER_ENABLE_SUSPEND := true

