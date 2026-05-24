include $(GNUSTEP_MAKEFILES)/common.make

PACKAGE_NAME = Ink
BUNDLE_NAME = Ink
BUNDLE_EXTENSION = .theme
VERSION = 1

Ink_INSTALL_DIR=$(GNUSTEP_LIBRARY)/Themes
Ink_PRINCIPAL_CLASS = Ink

Ink_OBJC_FILES = \
		Ink.m\
		Ink+Drawings.m\
		Ink+Button.m\
		Ink+FocusFrame.m\
		Ink+WindowDecoration.m\
		Ink+Menu.m\
		Ink+Slider.m\
		Ink+ProgressIndicator.m\
		Ink+Scroller.m\
		Ink+ColorWell.m\
		Ink+Stepper.m\
		Ink+Segmented.m\
		Ink+Browser.m\
		Ink+Table.m\
		GSStandardDecorationView+Ink.m\
		NSWindow+Ink.m\
		NSSegmentedCell+Ink.m\
		InkWindowButton.m\
		InkWindowButtonCell.m\
		InkScrollerKnobCell.m\
		InkScrollerKnobSlotCell.m\
		InkScrollerArrowCell.m\
		NSBrowserCell+Ink.m\
		NSSearchFieldCell+Ink.m\
		NSCell+Ink.m\
		NSTextFieldCell+Ink.m\
		NSBox+Ink.m\
		NSPopUpButton+Ink.m
ADDITIONAL_OBJC_LIBS = -lobjc
ADDITIONAL_TOOL_LIBS =
$(BUNDLE_NAME)_RESOURCE_FILES = \
        ./Resources/ThemePreview.png \
	./Resources/ThemeImages\
	./Resources/ThemeTiles\
	./Resources/*.clr
include $(GNUSTEP_MAKEFILES)/bundle.make

-include GNUmakefile.postamble

