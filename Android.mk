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

KEYMASTER_IMPL_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/android.hardware.keymaster@3.0-impl-qti.so
$(KEYMASTER_IMPL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating keymaster impl symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf hw/$(notdir $@) $@

LIBPROTOBUF_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/libprotobuf-c.so
$(LIBPROTOBUF_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating libprotobuf symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(notdir $@) libprotobuf-c-idd.so

ALL_DEFAULT_INSTALLED_MODULES += $(KEYMASTER_IMPL_SYMLINK) $(LIBPROTOBUF_SYMLINK)
endif
