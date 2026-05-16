#import "Ink.h"
#import <AppKit/NSPopUpButton.h>

@interface NSPopUpButton (InkTheme)
- (void) MILKmouseDown: (NSEvent*)theEvent;
@end

@implementation Ink (NSPopUpButton)
- (void) _overrideNSPopUpButtonMethod_mouseDown: (NSEvent*)theEvent {
  MILKLOG(@"_overrideNSPopUpButtonMethod_mouseDown:");
  NSPopUpButton *xself = (NSPopUpButton*)self;
  [xself MILKmouseDown:theEvent];
}
@end

@implementation NSPopUpButton (InkTheme)

- (void) MILKmouseDown: (NSEvent*)theEvent
{ 
  [_cell trackMouse: theEvent 
	     inRect: [self bounds] 
	     ofView: self 
       untilMouseUp: NO];
}

@end

