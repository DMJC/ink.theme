#include "Ink.h"
#include "InkScrollerKnobCell.h"
#include "InkScrollerKnobSlotCell.h"
#include "InkScrollerArrowCell.h"

@interface Ink(InkScroller)

@end

@implementation Ink(InkScroller)

/* NSScroller themeing. */

- (NSButtonCell*) cellForScrollerArrow: (NSScrollerArrow)arrow
			    horizontal: (BOOL)horizontal
{
  InkScrollerArrowCell	*cell;
  NSString	*name;

  cell = [InkScrollerArrowCell new];
  [cell setBezelStyle: NSRoundRectBezelStyle];
  if (horizontal)
    {
      if (arrow == NSScrollerDecrementArrow)
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
	  [cell setImage: [NSImage imageNamed: @"common_ArrowLeft"]];
	  [cell setImagePosition: NSImageOnly];
          name = GSScrollerLeftArrow;
    [cell setArrowType: InkScrollerArrowLeft];
	}
      else
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
      [cell setImage: [NSImage imageNamed: @"common_ArrowRight"]];
      [cell setImagePosition: NSImageOnly];
      name = GSScrollerRightArrow;
    [cell setArrowType: InkScrollerArrowRight];
	}
    }
  else
    {
      if (arrow == NSScrollerDecrementArrow)
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
      [cell setImage: [NSImage imageNamed: @"common_ArrowUp"]];
      [cell setImagePosition: NSImageOnly];
      name = GSScrollerUpArrow;
    [cell setArrowType: InkScrollerArrowUp];
	}
      else
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
	  [cell setImage: [NSImage imageNamed: @"common_ArrowDown"]];
	  [cell setImagePosition: NSImageOnly];
          name = GSScrollerDownArrow;
    [cell setArrowType: InkScrollerArrowDown];
	}
    }
  [self setName: name forElement: cell temporary: YES];
  RELEASE(cell);
  return cell;
}

- (NSCell*) cellForScrollerKnob: (BOOL)horizontal
{
  NSButtonCell	*cell;

  cell = [InkScrollerKnobCell new];
  [cell setButtonType: NSMomentaryChangeButton];
  [cell setBezelStyle: NSRoundedBezelStyle];
  [cell setImagePosition: NSImageOnly];
  [cell setHorizontal: horizontal];

  [cell setTitle: @""];
  if (horizontal)
    {
      [self setName: GSScrollerHorizontalKnob forElement: cell temporary: YES];
    }
  else
    {
      [self setName: GSScrollerVerticalKnob forElement: cell temporary: YES];
    }
  RELEASE(cell);
  return cell;
}

- (NSCell*) cellForScrollerKnobSlot: (BOOL)horizontal
{
  // TS: unused
  // GSDrawTiles   		*tiles;
  InkScrollerKnobSlotCell	*cell;
  NSColor			*color;
  NSString      		*name;

  if (horizontal)
    {
      name = GSScrollerHorizontalSlot;
    }
  else
    {
      name = GSScrollerVerticalSlot;
    }

  // TS: unused
  // tiles = [self tilesNamed: name state: GSThemeNormalState];
  color = [self colorNamed: name state: GSThemeNormalState];

  cell = [InkScrollerKnobSlotCell new];
  [cell setBordered: false];
  [cell setTitle: nil];
  [cell setHorizontal: horizontal];
  [self setName: name forElement: cell temporary: YES];

  if (color == nil)
    {
      color = [NSColor scrollBarColor];
    }
  [cell setBackgroundColor: color];
  RELEASE(cell);
  return cell;
}
// REMEMBER THIS SETTING
- (float) defaultScrollerWidth
{
  return 16.0;
}

- (BOOL) scrollViewUseBottomCorner
{
  return YES;
}

- (BOOL) scrollViewScrollersOverlapBorders
{
  return NO;
}

@end
