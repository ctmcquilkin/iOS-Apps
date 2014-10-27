//
//  CTMDetailTaskViewController.h
//  Overdue
//
//  Created by Charles McQuilkin on 10/22/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMTask.h"
#import "CTMEditTaskViewController.h"

@protocol CTMDetailTaskViewControllerDelegate <NSObject>

-(void)updateTask;

@end

@interface CTMDetailTaskViewController : UIViewController <CTMEditTaskViewControllerDelegate>

@property (strong, nonatomic) CTMTask *task;
@property (weak, nonatomic) id <CTMEditTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

- (IBAction)editBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
