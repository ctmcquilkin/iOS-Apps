//
//  ViewController.m
//  ParseTest
//
//  Created by Charles McQuilkin on 11/12/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    [testObject setObject:@"bar" forKey:@"foo"];
//    [testObject save];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveUserButonPressed:(UIButton *)sender
{
    PFObject *loginCredentials = [PFObject objectWithClassName:@"loginCredentials"];
    loginCredentials[@"name"] = self.usernameTextField.text;
    loginCredentials[@"password"] = self.passwordTextField.text;
    
    [loginCredentials saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save" message:@"Your object saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            NSLog(@"Save Successful!");
        }
        else if(error) {
            NSLog(@"%@", error);
        }
    }];
}

@end
