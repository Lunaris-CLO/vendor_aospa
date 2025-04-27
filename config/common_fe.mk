# Art
PRODUCT_SYSTEM_PROPERTIES += \
    pm.dexopt.post-boot=speed \
    pm.dexopt.first-boot=speed \
    pm.dexopt.boot-after-ota=speed-profile \
    pm.dexopt.boot-after-mainline-update=speed \
    pm.dexopt.install=speed-profile \
    pm.dexopt.install-fast=speed \
    pm.dexopt.install-bulk=speed-profile \
    pm.dexopt.install-bulk-secondary=speed \
    pm.dexopt.install-bulk-downgraded=speed \
    pm.dexopt.install-bulk-secondary-downgraded=speed \
    pm.dexopt.bg-dexopt=speed \
    pm.dexopt.ab-ota=speed \
    pm.dexopt.inactive=speed \
    pm.dexopt.cmdline=speed \
    pm.dexopt.first-use=speed \
    pm.dexopt.secondary=speed \
    pm.dexopt.shared=speed \
    pm.dexopt.downgrade_after_inactive_days=20

# Always preopt extracted APKs to prevent extracting out of the APK for gms
# modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed
OVERRIDE_DISABLE_DEXOPT_ALL := false

# Apps
PRODUCT_PACKAGES += \
    OmniStyle \
    OmniJaws \
    GameSpace  \
    LMOFreeform \
    LMOFreeformSidebar \
    CustomDoze

# Aperture Camera
PRODUCT_PACKAGES += \
    Aperture

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images \
    product_charger_res_images_vendor

# Cloned app exemption
 PRODUCT_COPY_FILES += \
     vendor/aospa/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-lunaris-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-lunaris-product.xml

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Quick Switch
TARGET_DEFAULT_PIXEL_LAUNCHER := true
ifeq ($(TARGET_DEFAULT_PIXEL_LAUNCHER), true)
# Pixel Launcher
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.default_launcher=0 \
    persist.sys.quickswitch_pixel_shipped=1
else
# Launcher3
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.default_launcher=0 \
    persist.sys.quickswitch_pixel_shipped=0
endif

# DesktopMode
PRODUCT_PACKAGES += \
    DesktopMode

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.freeform_window_management.xml

$(call inherit-product-if-exists, packages/services/VncFlinger/product.mk)

# Mainline spoofing
    PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_mainline_BRAND?=google \
    persist.sys.pihooks_mainline_DEVICE?=komodo \
    persist.sys.pihooks_mainline_HARDWARE?=komodo \
    persist.sys.pihooks_mainline_ID?=BP1A.250405.007 \
    persist.sys.pihooks_mainline_MANUFACTURER?=Google \
    persist.sys.pihooks_mainline_PRODUCT?=komodo \
    persist.sys.pihooks_BRAND?=google \
    persist.sys.pihooks_MANUFACTURER?=Google \
    persist.sys.pihooks_DEVICE?=tokay \
    persist.sys.pihooks_PRODUCT?=tokay_beta \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT?=21 \
    persist.sys.pihooks_SECURITY_PATCH?=2025-03-05 \
    persist.sys.pihooks_ID?=BP22.250221.015

PIHOOKS_BUILD_GMS_FINGERPRINT := google/tokay_beta/tokay:16/BP22.250221.015/13278879:user/release-keys
PIHOOKS_BUILD_GMS_MODEL := Pixel 9
PIHOOKS_BUILD_FINGERPRINT := google/komodo/komodo:15/BP1A.250405.007/13240079:user/release-keys
PIHOOKS_MODEL_SPOOF := Pixel 9 Pro XL

# TextClassifier
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/textclassifier/actions_suggestions.universal.model \
    system/etc/textclassifier/lang_id.model \
    system/etc/textclassifier/textclassifier.en.model \
    system/etc/textclassifier/textclassifier.universal.model

# Face unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true

ifneq ($(TARGET_FACE_UNLOCK_SUPPORTED),false)
PRODUCT_PACKAGES += \
    FaceUnlock

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Logging
SPAMMY_LOG_TAGS := \
    SDM \
    DisplayModeController \
    ForegroundUtils \
    BaseDepthController \
    Diag_Lib \
    InetDiagMessage \
    AHAL \
    IPACM \
    statsd \
    minksocket \
    Smart5gService \
    FileUtils

ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_VENDOR_PROPERTIES += \
    $(foreach tag,$(SPAMMY_LOG_TAGS),log.tag.$(tag)=S)
endif

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Disable async MTE on a few processes
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.arm64.memtag.app.com.android.se=off \
    persist.arm64.memtag.app.com.google.android.bluetooth=off \
    persist.arm64.memtag.app.com.android.nfc=off \
    persist.arm64.memtag.process.system_server=off \
    arm64.memtag.process.system_server=off

# Quick Tap
PRODUCT_PACKAGES += \
    ColumbusService

AXION_CPU_SMALL_CORES ?= 0,1,2,3
AXION_CPU_BIG_CORES ?= 4,5,6,7

# AxionOS properties
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.axion_cpu_big=$(AXION_CPU_BIG_CORES) \
    persist.sys.axion_cpu_small=$(AXION_CPU_SMALL_CORES)

# TFLite service.
PRODUCT_PACKAGES += libtensorflowlite_jni

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/lib/libtensorflowlite_jni.so \
    system/lib64/libtensorflowlite_jni.so

TARGET_PRODUCT_PROP += vendor/aospa/config/gameprops.prop
