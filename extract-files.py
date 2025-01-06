#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'hardware/qcom-caf/msm8998',
    'hardware/qcom-caf/wlan',
    'vendor/sony/nile-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/bin/hw/vendor.semc.hardware.secd@1.0-service': blob_fixup()
        .replace_needed('libprotobuf-c.so', 'libprotobuf-c-idd.so'),
    'vendor/bin/qns': blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'vendor/lib/libSonyIMX300PdafLibrary.so': blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'vendor/lib/libmmcamera_faceproc.so': blob_fixup()
        .clear_symbol_version('__aeabi_memcpy')
        .clear_symbol_version('__aeabi_memset')
        .clear_symbol_version('__gnu_Unwind_Find_exidx'),
    ('vendor/lib/vendor.somc.hardware.security.secd@1.0.so', 'vendor/lib64/vendor.somc.hardware.security.secd@1.0.so'): blob_fixup()
        .add_needed('libhidlbase_shim.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'pioneer',
    'sony',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'nile-common', module.vendor)
    utils.run()
