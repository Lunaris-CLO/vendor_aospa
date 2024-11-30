# Apps
PRODUCT_PACKAGES += \
    AvatarPicker \
    OmniStyle \
    OmniJaws \
    GameSpace  \
    LMOFreeform \
    LMOFreeformSidebar

# Aperture Camera
PRODUCT_PACKAGES += \
    Aperture

# blur
PRODUCT_PRODUCT_PROPERTIES += \
    ro.launcher.blur.appLaunch=0

# Quick Switch
TARGET_DEFAULT_PIXEL_LAUNCHER := true
ifeq ($(TARGET_DEFAULT_PIXEL_LAUNCHER), true)
# Pixel Launcher
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.default_launcher=1 \
    persist.sys.quickswitch_pixel_shipped=1
else
# Launcher3
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.default_launcher=0 \
    persist.sys.quickswitch_pixel_shipped=0
endif

# Mainline spoofing
    PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_mainline_BRAND?=google \
    persist.sys.pihooks_mainline_DEVICE?=caiman \
    persist.sys.pihooks_mainline_MANUFACTURER?=Google \
    persist.sys.pihooks_mainline_PRODUCT?=caiman \
    persist.sys.pihooks_BRAND?=google \
    persist.sys.pihooks_MANUFACTURER?=Google \
    persist.sys.pihooks_DEVICE?=cheetah \
    persist.sys.pihooks_PRODUCT?=cheetah_beta \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT?=25 \
    persist.sys.pihooks_SECURITY_PATCH?=2024-11-05 \
    persist.sys.pihooks_ID?=BP11.241025.006

PIHOOKS_BUILD_GMS_FINGERPRINT := google/cheetah_beta/cheetah:15/BP11.241025.006/12620009:user/release-keys
PIHOOKS_BUILD_FINGERPRINT := google/caiman/caiman:14/AD1A.240530.047.U1/12150698:user/release-keys
PIHOOKS_MODEL_SPOOF := Pixel 9 Pro

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