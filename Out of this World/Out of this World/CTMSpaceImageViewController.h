//
//  CTMSpaceImageViewController.h
//  Out of this World
//
//  Created by Charles McQuilkin on 10/15/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMSpaceObject.h"

/* The angle brakets mean that the class now conforms to the UIScrollView Protocol. In short we get access to the methods defined in the UIScrollViewDelegate like viewForZoomingInScrollView */
@interface CTMSpaceImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) CTMSpaceObject *spaceObject;

@end