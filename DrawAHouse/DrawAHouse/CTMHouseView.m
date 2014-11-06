//
//  CTMHouseView.m
//  DrawAHouse
//
//  Created by Charles McQuilkin on 10/31/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMHouseView.h"

@implementation CTMHouseView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.0;
    [bezierPath moveToPoint:CGPointMake(1/4.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(1/4.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(3/4.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(3/4.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint:CGPointMake(1/2.0 * self.bounds.size.width, 1/4.0 * self.bounds.size.height)];
    [bezierPath closePath];
    [bezierPath stroke];
}


@end
