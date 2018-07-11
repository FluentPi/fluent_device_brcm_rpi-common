#
# Copyright (C) 2018 The FluentOS ROM Project
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
#

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_WIDTH := 1280
TARGET_SCREEN_HEIGHT := 720

# Inherit some common FluentOS stuff.
$(call inherit-product, vendor/fluent/config/common_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/brcm/rpi/rpi.mk)

# Su
WITH_SU := true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rpi
PRODUCT_NAME := fluent_rpi
PRODUCT_BRAND := Raspberry
PRODUCT_MODEL := Raspberry Pi
PRODUCT_MANUFACTURER := Raspberry
PRODUCT_RELEASE_NAME := Raspberry Pi 3


TARGET_VENDOR_PRODUCT_NAME := rpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carbon.maintainer="ROM-PacMe"