# Apps
PRODUCT_PACKAGES += \
    AvatarPicker \
    OmniStyle \
    OmniJaws \
    GameSpace  \
    LMOFreeform \
    LMOFreeformSidebar \
    CustomDoze

# Aperture Camera
PRODUCT_PACKAGES += \
    Aperture

# blur
PRODUCT_PRODUCT_PROPERTIES += \
    ro.launcher.blur.appLaunch=0

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images \
    product_charger_res_images_vendor

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
    persist.sys.pihooks_mainline_ID?=AP4A.250105.002 \
    persist.sys.pihooks_mainline_MANUFACTURER?=Google \
    persist.sys.pihooks_mainline_PRODUCT?=komodo \
    persist.sys.pihooks_BRAND?=google \
    persist.sys.pihooks_MANUFACTURER?=Google \
    persist.sys.pihooks_DEVICE?=komodo \
    persist.sys.pihooks_PRODUCT?=komodo_beta \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT?=35 \
    persist.sys.pihooks_SECURITY_PATCH?=2024-12-05 \
    persist.sys.pihooks_ID?=BP11.241121.010

PIHOOKS_BUILD_GMS_FINGERPRINT := google/komodo_beta/komodo:15/BP11.241121.010/12780007:user/release-keys
PIHOOKS_BUILD_FINGERPRINT := google/komodo/komodo:15/AP4A.250105.002/12701944:user/release-keys
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

# Quick Tap
PRODUCT_PACKAGES += \
    ColumbusService

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif
