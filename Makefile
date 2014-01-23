ARCHS = armv7 arm64

ADDITIONAL_OBJCFLAGS = -fobjc-arc

include theos/makefiles/common.mk

TWEAK_NAME = ThreeColumnSpringBoard
ThreeColumnSpringBoard_FRAMEWORKS = CoreGraphics
ThreeColumnSpringBoard_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
