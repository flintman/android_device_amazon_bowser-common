BOWSER_COMMON_FOLDER := device/amazon/bowser-common

$(call inherit-product, device/amazon/omap4-common/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(BOWSER_COMMON_FOLDER)/overlay/aosp

# Audio
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/prebuilt/vendor/etc/audio_effects.conf:/system/vendor/etc/audio_effects.conf \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/mixer_paths.xml:/system/etc/mixer_paths.xml

# Bluetooth
PRODUCT_PACKAGES += \
    uim-sysfs \
    libbt-vendor

PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

# Camera
# PRODUCT_PACKAGES += \
#     camera.omap4

# Device settings
ADDITIONAL_BUILD_PROPERTIES += \
    persist.demo.hdmirotationlock=true \
    persist.lab126.touchnoisereject=1 \
    ro.nf.profile=2 \
    ro.nf.level=512 \
    omap.audio.power=PingPong \
    dolby.audio.sink.info=speaker \
    ro.camera.sound.forced=0 \
    ro.camera.video_size=1280x720

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/smc_normal_world_android_cfg.ini:/system/etc/smc_normal_world_android_cfg.ini \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/idc/AtmelTouch.idc:system/usr/idc/AtmelTouch.idc \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/idc/cyttsp4-i2c.idc:system/usr/idc/cyttsp4-i2c.idc \
    $(BOWSER_COMMON_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \

# Sensors
PRODUCT_PACKAGES += \
    sensors.omap4 \
    libinvensense_hal \
    libmllite \
    libmplmpu

# Wifi
PRODUCT_COPY_FILES += \
    $(BOWSER_COMMON_FOLDER)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/amazon/bowser-common/bowser-common-vendor.mk)
