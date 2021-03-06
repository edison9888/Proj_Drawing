//
//  clientDrawingGestureView.m
//  DrawingProj
//
//  Created by BuG.BS on 12-8-28.
//  Copyright (c) 2012年 BuG.BS. All rights reserved.
//

#import "clientDrawingGestureView.h"

@implementation clientDrawingGestureView
@synthesize drawingPadView = _drawingPadView;
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

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    //NSLog(@"(%g,%g)", self.frame.origin.x, self.frame.origin.y);
    //NSLog(@"%g",self.alpha);
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self.drawingPadView undo];
    } else if (gesture.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [gesture translationInView:self];
        if ((self.frame.origin.y + translation.y) <= 0){
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + translation.y, self.frame.size.width, self.frame.size.height);
            //self.drawingPadView.alpha += translation.y * 0.002;
        }
        [gesture setTranslation:CGPointZero inView:self];
    } else if (gesture.state == UIGestureRecognizerStateEnded){
        CGPoint translation = [gesture translationInView:self];
        if ((self.frame.origin.y + translation.y) <= 0){
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + translation.y, self.frame.size.width, self.frame.size.height);
            //self.drawingPadView.alpha += translation.y * 0.002;
        }
        [gesture setTranslation:CGPointZero inView:self];
        
        if (self.frame.origin.y < -200) {
            NSLog(@"YES");
            dispatch_queue_t sendingQueue = dispatch_queue_create("sendingQueue", NULL);
            dispatch_async(sendingQueue, ^{
                [self.delegate sendImage];
            });
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
                self.frame = CGRectMake(self.frame.origin.x, -768, self.frame.size.width, self.frame.size.height);
                self.drawingPadView.alpha = 0.0;
            }completion:^(BOOL isFinished){
                self.frame = CGRectMake(self.frame.origin.x, 0, self.frame.size.width, self.frame.size.height);
                [UIView animateWithDuration:0.5 animations:^{
                    self.drawingPadView.alpha = 1.0;
                }];
            }];
            
        } else {
            NSLog(@"NO");
            [UIView animateWithDuration:0.5 animations:^{
                self.frame = CGRectMake(self.frame.origin.x, 0, self.frame.size.width, self.frame.size.height);
                self.drawingPadView.alpha = 1.0;
            }];
        }
    }
}

@end
