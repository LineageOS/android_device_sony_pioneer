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

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),pioneer)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

MODEM_SYMLINKS := $(TARGET_OUT)/etc/customization/modem
$(MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Create modem links: $@"
	@mkdir -p $@
	$(hide) ln -sf amss_fsg_pioneer_tar.mbn $@/default
	$(hide) ln -sf amss_fs_empty.mbn $@/reset_modemst1
	$(hide) ln -sf amss_fs_empty.mbn $@/reset_modemst2

ALL_DEFAULT_INSTALLED_MODULES += \
	$(MODEM_SYMLINKS)

endif
