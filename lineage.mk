$(call inherit-product, device/sony/pioneer/full_pioneer.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_pioneer
PRODUCT_DEVICE := pioneer
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia XA2
PRODUCT_MANUFACTURER := Sony

PRODUCT_GMS_CLIENTID_BASE := android-sony
