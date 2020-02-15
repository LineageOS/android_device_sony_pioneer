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

# inherit from common nile-common
-include device/sony/nile-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/pioneer

# Kernel
TARGET_KERNEL_CONFIG := pioneer_defconfig

# MAC address setup
BOARD_HAS_MIRROR_MACADDRESS := true

# inherit from the proprietary version
-include vendor/sony/pioneer/BoardConfigVendor.mk
