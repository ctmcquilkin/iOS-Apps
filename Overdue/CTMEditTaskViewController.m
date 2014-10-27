//
//  CTMEditTaskViewController.m
//  Overdue
//
//  Created by Charles McQuilkin on 10/22/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMEditTaskViewController.h"

@interface CTMEditTaskViewController ()

@end

@implementation CTMEditTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textField.text = self.task.title;
    self.textView.text = self.task.descriptionText;
    self.datePicker.date = self.task.date;
    
    /* Set the delegate properties for the UITextView and UITextField so that the CCEditTaskViewController instance can recieve messages from the UITextFieldDelegate and UITextViewDelegate. */
    self.textView.delegate = self;
    self.textField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self updateTask];
    [self.delegate didUpdateTask];
}

/* Helper method which updates the task object to reflect the changes in the EditTaskViewController. */
-(void)updateTask
{
    self.task.title = self.textField.text;
    self.task.descriptionText = self.textView.text;
    self.task.date = self.datePicker.date;
}

#pragma UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]){
        [self.textView resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
