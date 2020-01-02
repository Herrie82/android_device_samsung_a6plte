#
# Copyright (C) 2017,2019 The LineageOS Project
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

BOARD_VNDK_RUNTIME_DISABLE := true
RECOVERY_VARIANT := twrp
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)/twrp vendor/samsung/a6plte/proprietary
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_DEVICE_VERSION := a6plte-junak-1
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone10/temp
TW_THEME := portrait_hdpi
TW_W_OFFSET := -40
TW_X_OFFSET := 20
TW_MAX_BRIGHTNESS := 255 # 365 actually
TW_DEFAULT_BRIGHTNESS := 50
TW_NO_REBOOT_BOOTLOADER := false
TW_HAS_DOWNLOAD_MODE := false
TW_USE_NEW_MINADBD := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_CRYPTO := true
TW_NEW_ION_HEAP := true
