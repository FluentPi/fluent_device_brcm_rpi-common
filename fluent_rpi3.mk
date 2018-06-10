# Copyright 2018 (C) FluentOS ROM Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit some common FluentOS stuff.
$(call inherit-product, vendor/fluent/common.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_wifionly.mk)

# Inherit from those products. Mirror feature here.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_mirror.mk)

$(call inherit-product, device/brcm/rpi3-common/rpi3.mk)

# Enhanced NFC
#$(call inherit-product, vendor/fluent/config/nfc_enhanced.mk)

PRODUCT_NAME := fluent_rpi
PRODUCT_RELEASE_NAME := Raspberry Pi (2-3b-3b+)
PRODUCT_DEVICE := rpi3
PRODUCT_BRAND := Broadcom
PRODUCT_MANUFACTURER := Element14
PRODUCT_MODEL := Raspberry Pi
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0