//
//  CTMSpaceDataViewController.h
//  Out of this World
//
//  Created by Charles McQuilkin on 10/15/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMSpaceObject.h"

@interface CTMSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CTMSpaceObject *spaceObject;

@end