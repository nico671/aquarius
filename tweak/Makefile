ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:14.0

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = aquarius

aquarius_FILES = Tweak.xm NCUtils+UIColor.m MarqueeLabel.m NCImageUtils.m GRPBackend.m GRPNotifDataGroups.m GRPView.m GRPCell.m
aquarius_FRAMEWORKS = CoreGraphics QuartzCore UIKit Foundation CoreLocation CoreImage EventKit 
aquarius_PRIVATE_FRAMEWORKS = MediaRemote BulletinBoard
aquarius_LIBRARIES = gcuniversal pddokdo
aquarius_CFLAGS = -fobjc-arc
aquarius_EXTRA_FRAMEWORKS += Cephei
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk