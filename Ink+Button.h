#import "Ink.h"
#include <AppKit/NSAnimation.h>

@interface Ink(InkButton)
{
}
@end


@interface NSButtonCell(InkDefaultButtonAnimation)
  @property (nonatomic, copy) NSNumber* isDefaultButton;
  @property (nonatomic, copy) NSNumber* pulseProgress;
@end
