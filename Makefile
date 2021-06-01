THEOS_DEVICE_IP= 192.168.50.75
DEBUG = 0
include $(THEOS)/makefiles/common.mk

SUBPROJECTS += tweak aquariusprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
