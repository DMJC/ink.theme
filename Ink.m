#import "Ink.h"

#import <AppKit/AppKit.h>
#import <GNUstepGUI/GSWindowDecorationView.h>

// add this declaration to quiet the compiler
@interface Ink(InkButton)
- (NSColor*) buttonColorInCell:(NSCell*) cell forState: (GSThemeControlState) state;
@end
  
@implementation Ink

+ (NSColor *) controlStrokeColor
{

  return RETAIN([NSColor colorWithCalibratedRed: 0.6
                                          green: 0.6
                                           blue: 0.6
                                          alpha: 1]);
}
- (void) drawPathButton: (NSBezierPath*) path
                     in: (NSCell*)cell
			            state: (GSThemeControlState) state
{
  NSColor	*backgroundColor = [self buttonColorInCell: cell forState: state];
  NSColor* strokeColorButton = [Ink controlStrokeColor];
  NSGradient* buttonBackgroundGradient = [self _bezelGradientWithColor: backgroundColor];
  [buttonBackgroundGradient drawInBezierPath: path angle: -90];
  [strokeColorButton setStroke];
  [path setLineWidth: 1];
  [path stroke];
}
@end

