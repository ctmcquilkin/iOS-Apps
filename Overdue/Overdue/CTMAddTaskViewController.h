//
//  CTMAddTaskViewController.h
//  Overdue
//
//  Created by Charles McQuilkin on 10/22/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMTask.h"

@protocol CTMAddTaskViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didAddTask:(CTMTask *)task;

@end

@interface CTMAddTaskViewController : UIViewController

@property (weak, nonatomic) id <CTMAddTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)addTaskButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
