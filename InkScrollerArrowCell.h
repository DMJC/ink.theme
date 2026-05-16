#import <AppKit/NSButtonCell.h>

typedef enum {
  InkScrollerArrowLeft,
  InkScrollerArrowRight,
  InkScrollerArrowUp,
  InkScrollerArrowDown
} InkScrollerArrowType;

@interface InkScrollerArrowCell : NSButtonCell
{
  InkScrollerArrowType scroller_arrow_type;
}
-(void) setArrowType: (InkScrollerArrowType) t;
@end

