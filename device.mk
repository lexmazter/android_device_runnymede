#
# Copyright (C) 2011 The CyanogenMod Project
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

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += device/htc/runnymede/prebuilt/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

# Init
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/root/init.runnymede.rc:root/init.runnymede.rc \
    device/htc/runnymede/prebuilt/root/ueventd.runnymede.rc:root/ueventd.runnymede.rc

# Permissions
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/runnymede/runnymede-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/htc/runnymede/overlay

# Gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/voicemail-conf.xml:system/etc/voicemail-conf.xml

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.runnymede \
    lights.msm7x30 \
    sensors.runnymede

# HWC Hal
PRODUCT_PACKAGES += \
    hwcomposer.msm7x30 \
    gralloc.msm7x30 \
    gralloc.runnymede \
    copybit.msm7x30

# Audio
PRODUCT_PACKAGES += \
  audio.a2dp.default \
  audio.primary.default \
  audio_policy.default \
  libaudioalsa

# Camera
PRODUCT_PACKAGES += \
  camera.default \
  liboemcamera \
  libcamera

# Video
PRODUCT_PACKAGES += \
  libI420colorconvert

# Additional packages
PRODUCT_PACKAGES += \
    GooManager \
    FileExplorer

# Idc files
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/runnymede/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/runnymede/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/runnymede/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/runnymede/prebuit/usr/idc/projector-input.idc:system/usr/idc/projector-input.idc

# Keychar files
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/usr/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    device/htc/runnymede/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/runnymede/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/runnymede/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/runnymede/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \

# Keylayout files
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad.kl:system/usr/keylayout/runnymede-keypad.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-ara.kl:system/usr/keylayout/runnymede-keypad-ara.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-ell.kl:system/usr/keylayout/runnymede-keypad-ell.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-fra.kl:system/usr/keylayout/runnymede-keypad-fra.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-ger.kl:system/usr/keylayout/runnymede-keypad-ger.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-ita.kl:system/usr/keylayout/runnymede-keypad-ita.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-tur.kl:system/usr/keylayout/runnymede-keypad-tur.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-wwe.kl:system/usr/keylayout/runnymede-keypad-wwe.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/runnymede-keypad-bopomo.kl:system/usr/keylayout/runnymede-keypad-bopomo.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/htc/runnymede/prebuilt/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl

# Vold file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Media config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/runnymede/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf 

# Apn config file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/runnymede/prebuilt/root/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Kernel modules
PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# HTC Audio
$(call inherit-product, device/htc/runnymede/media_a1026.mk)
$(call inherit-product, device/htc/runnymede/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

