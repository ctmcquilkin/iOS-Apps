//
//  CTMOuterSpaceTableViewController.h
//  Out of this World
//
//  Created by Charles McQuilkin on 10/15/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMAddSpaceObjectViewController.h"

@interface CTMOuterSpaceTableViewController : UITableViewController <CTMAddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;

@end
