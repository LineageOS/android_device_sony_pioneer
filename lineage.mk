#
# Copyright (C) 2018 The LineageOS Project
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

$(call inherit-product, device/sony/pioneer/full_pioneer.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_pioneer
PRODUCT_DEVICE := pioneer
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia XA2
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="nile" \
    PRODUCT_NAME="nile" \
    PRIVATE_BUILD_DESC="nile-user 8.0.0 OPR1.170623.027 14 dev-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "Android/nile/nile:8.0.0/OPR1.170623.027/14:user/dev-keys"

PRODUCT_GMS_CLIENTID_BASE := android-sony
