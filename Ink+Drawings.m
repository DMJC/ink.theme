#import "Ink.h"

void
NSRoundRectDraw(NSRect r, float radius)
{
  NSBezierPath* roundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect: r
                                                                       xRadius: radius
                                                                       yRadius: radius];
  [roundedRectanglePath stroke];
}
void
NSRoundRectFill(NSRect r, float radius)
{
  NSBezierPath* roundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect: r
                                                                       xRadius: radius
                                                                       yRadius: radius];
  [roundedRectanglePath fill];
}

@implementation Ink(InkDrawiungs)

- (NSGradient *) _bezelGradientWithColor:(NSColor*) baseColor
{
  baseColor = [baseColor colorUsingColorSpaceName: NSCalibratedRGBColorSpace];

  NSColor* baseColorLight = [baseColor highlightWithLevel: 0.8];
  NSColor* baseColorLight2 = [baseColor highlightWithLevel: 0.5];
  // TS: unusued
  // NSColor* baseColorShadow = [baseColor shadowWithLevel: 0.1];

  NSGradient* gradient = [[NSGradient alloc] initWithColorsAndLocations:
      baseColorLight, 0.0,
      baseColor, 0.30,
      baseColor, 0.49,
      baseColorLight2, 0.50,
      nil];
  return gradient;
}
- (NSGradient *) _buttonGradientWithColor:(NSColor*) baseColor
{
  baseColor = [baseColor colorUsingColorSpaceName: NSCalibratedRGBColorSpace];

  NSColor* baseColorLight = [baseColor highlightWithLevel: 0.8];
  NSColor* baseColorLight2 = [baseColor highlightWithLevel: 0.5];
  // TS: unused
  // NSColor* baseColorShadow = [baseColor shadowWithLevel: 0.1];

  return [[NSGradient alloc] initWithColorsAndLocations:
                                            baseColorLight, 0.0,
                                            baseColor, 0.30,
                                            baseColor, 0.49,
                                            baseColorLight2, 0.50,
                                            nil];

}

- (NSGradient *) _windowTitlebarGradient
{
  NSColor* gradientColor1 = [NSColor colorWithCalibratedRed: 0.0
                                                      green: 0.0
                                                       blue: 0.0
                                                      alpha: 1];
  NSColor* gradientColor2 = [NSColor colorWithCalibratedRed: 0.137
                                                      green: 0.137
                                                       blue: 0.129
                                                      alpha: 1];

  return [[NSGradient alloc] initWithStartingColor: gradientColor1
                                       endingColor: gradientColor2];
}




- (NSRect) drawWhiteBezel: (NSRect)border withClip: (NSRect)clip
{
  NSColor* strokeColor = [NSColor colorWithCalibratedRed: 0.4 green: 0.4 blue: 0.4 alpha: 1];
  NSColor* strokeColorLight = [NSColor colorWithCalibratedRed: 0.2 green: 0.2 blue: 0.2 alpha: 1];//[strokeColor highlightWithLevel: 0.3];
  NSColor* strokeColorLight2 = [NSColor colorWithCalibratedRed: 0.2 green: 0.2 blue: 0.2 alpha: 1];//[strokeColor highlightWithLevel: 0.3];
  NSColor* strokeColorLight3 = [NSColor colorWithCalibratedRed: 0.2 green: 0.2 blue: 0.2 alpha: 0];//[strokeColor highlightWithLevel: 0.3];
  NSGradient* gradient = [[NSGradient alloc] initWithStartingColor: strokeColorLight endingColor: strokeColorLight2];
  // THIS SHOULD BE THE BACKGROUND COLOR
  NSColor * whiteColor = [NSColor blackColor];
  NSGradient* gradient2 = [[NSGradient alloc] initWithColorsAndLocations: strokeColorLight2, 0.0,
                                                                          strokeColorLight3, 0.30,
                                                                          nil];


  //// Rectangle 2 Drawing
  [gradient drawInRect: border angle: 90];
  //// Rectangle Drawing
  NSRect gradient_rect = NSMakeRect(border.origin.x, 
      border.origin.y+1,
      border.size.width,
      20);
  [whiteColor set];
  border = NSInsetRect(border, 1, 1);
  NSRectFill(border);
  [gradient2 drawInRect: gradient_rect angle: 90];
  [strokeColor set];
  NSFrameRect(border);
  return border;
}

- (NSRect) drawGrayBezel: (NSRect)border withClip: (NSRect)clip
{
  //// Color Declarations
  NSColor* background = [NSColor colorWithCalibratedRed: 0.102 green: 0.102 blue: 0.102 alpha: 1];
  NSColor* strokeDark = [NSColor colorWithCalibratedRed: 0.341 green: 0.341 blue: 0.341 alpha: 1];
  NSColor* strokeLight = [NSColor colorWithCalibratedRed: 0.137 green: 0.137 blue: 0.137 alpha: 1];

  //// Gradient Declarations
  NSGradient* strokeGradient = [[NSGradient alloc] initWithColorsAndLocations:
      strokeDark, 0.0,
      [NSColor colorWithCalibratedRed: 0.239 green: 0.239 blue: 0.239 alpha: 1], 0.82,
      strokeLight, 1.0, nil];

  //// Frames
  NSRect strokeRect = NSMakeRect(NSMinX(border), NSMinY(border), NSWidth(border), NSHeight(border));
  NSRect fillRect = NSInsetRect(strokeRect, 1, 1);


  //// stroke Drawing
  NSBezierPath* strokePath = [NSBezierPath bezierPathWithRect:strokeRect];
  [strokeGradient drawInBezierPath: strokePath angle: 90];


  //// fill Drawing
  NSBezierPath* fillPath = [NSBezierPath bezierPathWithRect:fillRect];
  [background setFill];
  [fillPath fill];

  return NSInsetRect(border, 1, 1);
}
- (NSRect) drawInnerGrayBezel: (NSRect)border withClip: (NSRect)clip
{
  //TODO use these colors...
#if 0 // TS: all unused
  NSColor *black = [NSColor controlDarkShadowColor];
  NSColor *dark = [NSColor controlShadowColor];
  NSColor *light = [NSColor controlColor];
  NSColor *white = [NSColor controlLightHighlightColor];
  NSColor *colors[] = {white, white, dark, dark,
  		       light, light, black, black};

  NSRect rect;
#endif

  //// instead of these Color Declarations
  NSColor* emptyColor = [NSColor colorWithCalibratedRed: 0.2
                                                  green: 0.2
                                                   blue: 0.2
                                                  alpha: 1];

  NSColor* emptyLight = [emptyColor highlightWithLevel: 0.6];
  NSColor* emptyLight2 = [emptyColor highlightWithLevel: 0.8];

  //// Gradient Declarations
  NSGradient* emptyGradient = [[NSGradient alloc] initWithColorsAndLocations:
      emptyColor, 0.0,
      emptyLight, 0.25,
      emptyLight2, 0.54,
      emptyLight, 0.81,
      emptyColor, 1.0, nil];


  NSRect borderRect = NSMakeRect(
      NSMinX(border) + 0.5,
      NSMinY(border) + 0.5,
      floor(NSWidth(border)-1),
      NSHeight(border)-1
  );
  NSBezierPath* emptyRectanglePath = [NSBezierPath bezierPathWithRoundedRect:borderRect
                                                                     xRadius: 3
                                                                     yRadius: 3];
  int angle = 0;
  //maybe there is a better method to determine the orientation
  if(NSWidth(border) > NSHeight(border))
    angle = -90;
  [emptyGradient drawInBezierPath: emptyRectanglePath angle: angle];

  return borderRect;
}
- (NSRect) drawDarkBezel: (NSRect)border withClip: (NSRect)clip
{
  //// Color Declarations
  NSColor* background = [NSColor colorWithCalibratedRed: 0.102 green: 0.102 blue: 0.102 alpha: 1];
  NSColor* strokeDark = [NSColor colorWithCalibratedRed: 0.341 green: 0.341 blue: 0.341 alpha: 1];
  NSColor* strokeLight = [NSColor colorWithCalibratedRed: 0.137 green: 0.137 blue: 0.137 alpha: 1];

  //// Gradient Declarations
  NSGradient* strokeGradient = [[NSGradient alloc] initWithColorsAndLocations:
      strokeDark, 0.0,
      [NSColor colorWithCalibratedRed: 0.239 green: 0.239 blue: 0.239 alpha: 1], 0.82,
      strokeLight, 1.0, nil];

  //// Frames
  NSRect strokeRect = NSMakeRect(NSMinX(border), NSMinY(border), NSWidth(border), NSHeight(border));
  NSRect fillRect = NSInsetRect(strokeRect, 1, 1);


  //// stroke Drawing
  NSBezierPath* strokePath = [NSBezierPath bezierPathWithRoundedRect:strokeRect  xRadius: 4 yRadius: 4];
  [strokeGradient drawInBezierPath: strokePath angle: -90];


  //// fill Drawing
  NSBezierPath* fillPath = [NSBezierPath bezierPathWithRoundedRect:fillRect  xRadius: 4 yRadius: 4];
  [background setFill];
  [fillPath fill];

  return border;
}
@end
