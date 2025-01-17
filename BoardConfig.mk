# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.  # You may obtain a copy of the License at #
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/a6plte

# Platform
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506

BUILD_BROKEN_DUP_RULES := true
#BOARD_VNDK_VERSION := current

# Bootloader
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)
TARGET_NO_BOOTLOADER := true

# Architecture
ifeq ($(BUILD_64BIT),true)
$(warning Building 64-bit OS)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
else
$(warning Building 32-bit OS)
TARGET_USES_64_BIT_BINDER := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH :=
TARGET_2ND_ARCH_VARIANT :=
TARGET_2ND_CPU_ABI :=
TARGET_2ND_CPU_ABI2 :=
TARGET_2ND_CPU_VARIANT :=
endif

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD  := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_DEV_ARBI := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_USES_ALSA_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1
USE_CUSTOM_AUDIO_POLICY := 1
DOLBY_ENABLE := false
#USE_DEVICE_SPECIFIC_AUDIO := true
#USE_DEVICE_SPECIFIC_AUDIO_PATH := hardware/qcom/audio-sec-msim

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
#CAMERA_DAEMON_NOT_PRESENT := true
#TARGET_SUPPORT_HAL1 := true
BOARD_QTI_CAMERA_32BIT_ONLY := true
#TARGET_USES_QTI_CAMERA_DEVICE := true
#TARGET_TS_MAKEUP := true
#USE_DEVICE_SPECIFIC_CAMERA := true
#BOARD_USE_SAMSUNG_CAMERAFORMAT_NV21 := true

#Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Encryption
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TARGET_SWV8_DISK_ENCRYPTION := true

# FM
BOARD_HAVE_QCOM_FM := true

# GPU
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_NEW_ION_API := true
BOARD_USES_ADRENO := true

# Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

#Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_OFFSET = 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := a6plte-debug_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a6plte

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Partitions/FS
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_ROOT_EXTRA_FOLDERS   := efs
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_PARTITION_SIZE   := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3000000000
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 400000000
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20000000000
TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_HAS_NO_WLAN_STATS := true
#TARGET_USES_INTERACTION_BOOST := true
#TARGET_POWER_SET_FEATURE_LIB := true
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power-ext.c

# GNSS
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# Vendor support
BOARD_VENDOR := samsung
BOARD_USES_QCOM_HARDWARE := true
TARGET_PROVIDES_LIBLIGHT := true
BOARD_HARDWARE_CLASS += hardware/samsung/lineagehw
TARGET_SEC_FP_HAL_VARIANT := bauth

# RIL
#TARGET_RIL_VARIANT :=
#SIM_COUNT=2
#BOARD_PROVIDES_LIBRIL := true
# TARGET_PROVIDES_QTI_TELEPHONY_JAR := true
ENABLE_VENDOR_RIL_SERVICE := true
#TARGET_USES_OLD_MNC_FORMAT := true

# Security patch level
VENDOR_SECURITY_PATCH := 2019-06-05

# SELinux
include device/qcom/sepolicy/sepolicy.mk
# BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# WiFi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 30
TARGET_RECOVERY_UI_MARGIN_WIDTH := 20
TARGET_RECOVERY_UI_MARGIN_STATUSBAR = 20

ifeq ($(BUILD_TWRP),true)
TARGET_KERNEL_CONFIG := a6plte-recovery_defconfig
include $(DEVICE_PATH)/twrp.mk
endif
