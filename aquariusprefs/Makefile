ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:14.0


include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = aquariusprefs

aquariusprefs_FILES = $(wildcard *.m)
aquariusprefs_FRAMEWORKS = UIKit CoreGraphics QuartzCore CoreImage
aquariusprefs_PRIVATE_FRAMEWORKS = Preferences SpringBoardServices OnBoardingKit
aquariusprefs_INSTALL_PATH = /Library/PreferenceBundles
aquariusprefs_CFLAGS = -fobjc-arc
aquariusprefs_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
aquariusprefs_LIBRARIES = gcuniversal

include $(THEOS_MAKE_PATH)/bundle.mk