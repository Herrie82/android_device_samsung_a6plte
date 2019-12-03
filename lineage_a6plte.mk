#
# Copyright (C) 2017 The LineageOS Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 2220
TARGET_SCREEN_WIDTH := 1080

ifeq ($(BUILD_64BIT),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
endif

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a6plte/device.mk)

# Overlay
PRODUCT_PACKAGE_OVERLAYS += \
	$(LOCAL_PATH)/overlay-lineage

# Trust HAL
PRODUCT_PACKAGES += \
	vendor.lineage.trust@1.0-service

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.samsung

# LiveDisplay
PRODUCT_PACKAGES += \
	vendor.lineage.livedisplay@2.0-service.samsung-qcom

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_a6plte
PRODUCT_DEVICE := a6plte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A605
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_FINGERPRINT=samsung/a6pltexx/a6plte:9/PPR1.180610.011/A605FNXXU4BSH3:user/release-keys \
	PRIVATE_BUILD_DESC="a6plte-user 9 PPR1.180610.011 A605FNXXU4BSH3 release-keys"

BUILD_FINGERPRINT := samsung/a6pltexx/a6plte:9/PPR1.180610.011/A605FNXXU4BSH3:user/release-keys
