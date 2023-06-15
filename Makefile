THEOS_DEVICE_IP = 192.168.1.246
THEOS_DEVICE_PORT = 22
export DEBUG = 0
include $(THEOS)/makefiles/common.mk
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk/
SUBPROJECTS += tweak aquariusprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
