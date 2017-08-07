ARCHS = armv7 armv7s arm64
GO_EASY_ON_ME=1
TARGET = iphone:clang:10.1:latest
THEOS_DEVICE_IP = 192.168.86.199
THEOS_DEVICE_PORT=22

FINALPACKAGE = 0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = prefsTest
prefsTest_FILES = CSPRootListController.m
prefsTest_INSTALL_PATH = /Library/PreferenceBundles
prefsTest_FRAMEWORKS = UIKit
prefsTest_PRIVATE_FRAMEWORKS = Preferences
prefsTest_CFLAGS += -fobjc-arc
prefsTest_LDFLAGS +=  -lCSPreferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/prefsTest.plist$(ECHO_END)
