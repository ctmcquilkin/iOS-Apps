//
//  CTMEditTaskViewController.h
//  Overdue
//
//  Created by Charles McQuilkin on 10/22/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMTask.h"

@protocol CTMEditTaskViewControllerDelegate <NSObject>

-(void)didUpdateTask;

@end

/* Conform to the UITextViewDelegate and UITextFieldDelegate to allow the keyboard to be dismissed */
@interface CTMEditTaskViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic)CTMTask *task;
@property (weak, nonatomic) id <CTMEditTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
