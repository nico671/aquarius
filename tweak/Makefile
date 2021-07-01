 ARCHS = arm64 arm64e
 TARGET := iphone:clang:latest:14.0

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = aquarius

aquarius_FILES = Tweak.xm MarqueeLabel.m #AQRGRPView.m AQRGRPCell.m AQRManager.m
aquarius_FRAMEWORKS = CoreGraphics QuartzCore UIKit Foundation 
aquarius_PRIVATE_FRAMEWORKS = MediaRemote MaterialKit
aquarius_LIBRARIES = gcuniversal bulletin  
aquarius_CFLAGS = -fobjc-arc
aquarius_EXTRA_FRAMEWORKS += Cephei 
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

