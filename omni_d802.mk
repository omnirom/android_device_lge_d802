# Copyright (C) 2012 The CyanogenMod Project
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

# Inherit APNs list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

$(call inherit-product-if-exists, vendor/lge/galbi/galbi-gsm-vendor.mk)
$(call inherit-product, device/lge/g2-common/g2.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_d802
PRODUCT_DEVICE := d802
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := lge
PRODUCT_MODEL := LG-D802

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=lge/g2_open_com/g2:4.2.2/JDQ39B/D80210a.1378316352:user/release-keys \
    PRIVATE_BUILD_DESC="g2_open_com-user 4.2.2 JDQ39B D80210a.1378316352 release-keys"

## overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay


PRODUCT_PROPERTY_OVERRIDES += \
        telephony.lteOnGsmDevice=1 \
        ro.telephony.default_network=9

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.g2 \
    NfcNci
