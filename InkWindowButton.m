#import "InkWindowButton.h"
#import "InkWindowButtonCell.h"

@implementation InkWindowButton

+ (Class) cellClass
{
  return [InkWindowButtonCell class];
}
- (void) setBaseColor: (NSColor*)c
{
  [_cell setBaseColor: c];
}
- (BOOL) isFlipped
{
  return NO;
}

@end
