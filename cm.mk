# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit from device
$(call inherit-product, device/htc/runnymede/device.mk)

# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release Name
PRODUCT_RELEASE_NAME := Sensation XL

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/cm/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/cm/overlay/hot_reboot

PRODUCT_NAME := cm_runnymede
PRODUCT_DEVICE := runnymede
PRODUCT_BRAND := htc_wwe
PRODUCT_MODEL := Sensation XL
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_runnymede BUILD_FINGERPRINT=google/occam/mako:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="occam-user 4.2.2 JDQ39 573038 release-keys"
