ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:14.0

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = aquarius

aquarius_FILES = Tweak.xm NCUtils+UIColor.m 
aquarius_FRAMEWORKS = CoreGraphics QuartzCore UIKit Foundation Weather CoreLocation CoreImage
aquarius_PRIVATE_FRAMEWORKS = MediaRemote WeatherFoundation BulletinBoard
aquarius_LIBRARIES = gcuniversal NCUtils pddokdo
aquarius_CFLAGS = -fobjc-arc
aquarius_EXTRA_FRAMEWORKS += Cephei
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk