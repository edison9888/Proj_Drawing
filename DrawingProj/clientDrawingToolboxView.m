//
//  clientDrawingToolboxView.m
//  DrawingProj
//
//  Created by BuG.BS on 12-8-28.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import "clientDrawingToolboxView.h"

@implementation clientDrawingToolboxView
@synthesize markerButton = _markerButton;
@synthesize brushButton = _brushButton;
@synthesize eraserButton = _eraserButton;
@synthesize undoButton = _undoButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
