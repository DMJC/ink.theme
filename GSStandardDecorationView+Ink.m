#import <GNUstepGUI/GSWindowDecorationView.h>
#import <GNUstepGUI/GSTheme.h>
#import "Ink.h"

#define TITLEBAR_BUTTON_SIZE 15
#define TITLEBAR_PADDING_LEFT 10.5
#define TITLEBAR_PADDING_RIGHT 10.5
#define TITLEBAR_PADDING_TOP 5.5
@interface GSStandardWindowDecorationView(InkTheme)
- (void) MILKupdateRects;
@end

@implementation Ink(GSStandardWindowDecorationView)
- (void) _overrideGSStandardWindowDecorationViewMethod_updateRects {
  GSStandardWindowDecorationView* xself = (GSStandardWindowDecorationView*)self;
  MILKLOG(@"GSStandardDecorationView+Ink updateRects");
  [xself MILKupdateRects];
}
@end

@implementation GSStandardWindowDecorationView(InkTheme)
- (void) MILKupdateRects
{
  GSTheme *theme = [GSTheme theme];
  if (hasTitleBar)
    {
      CGFloat titleHeight = [theme titlebarHeight];
      titleBarRect = NSMakeRect(0.0, [self bounds].size.height - titleHeight,
                            [self bounds].size.width, titleHeight);
    }
  if (hasResizeBar)
    {
      resizeBarRect = NSMakeRect(0.0, 0.0, [self bounds].size.width, [theme resizebarHeight]);
    }
  if (hasCloseButton)
    {
      closeButtonRect = NSMakeRect(
      [self bounds].size.width - TITLEBAR_BUTTON_SIZE - TITLEBAR_PADDING_RIGHT, [self bounds].size.height -  TITLEBAR_BUTTON_SIZE - TITLEBAR_PADDING_TOP, TITLEBAR_BUTTON_SIZE, TITLEBAR_BUTTON_SIZE);
      [closeButton setFrame: closeButtonRect];
    }
  if (hasMiniaturizeButton)
    {
      miniaturizeButtonRect = NSMakeRect(
      TITLEBAR_PADDING_LEFT, [self bounds].size.height - TITLEBAR_BUTTON_SIZE - TITLEBAR_PADDING_TOP, TITLEBAR_BUTTON_SIZE, TITLEBAR_BUTTON_SIZE);
      [miniaturizeButton setFrame: miniaturizeButtonRect];
    }
/*  if (hasZoomButton)
    {
      zoomButtonRect = NSMakeRect(
      TITLEBAR_PADDING_LEFT * 2, [self bounds].size.height - TITLEBAR_BUTTON_SIZE - TITLEBAR_PADDING_TOP, TITLEBAR_BUTTON_SIZE, TITLEBAR_BUTTON_SIZE);
      [zoomButton setFrame: zoomButtonRect];
    }*/
}

@end
