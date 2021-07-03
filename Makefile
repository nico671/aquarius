THEOS_DEVICE_IP=192.168.0.11
export DEBUG = 0
include $(THEOS)/makefiles/common.mk
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk/
SUBPROJECTS += tweak aquariusprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
