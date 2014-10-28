//
//  ViewController.m
//  ViewObjectsInCode
//
//  Created by Charles McQuilkin on 10/28/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *myLabel;
@property (strong, nonatomic) UITextField *myTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect myLabelFrame = CGRectMake(20, 60, 280, 22);
    self.myLabel = [[UILabel alloc] initWithFrame:myLabelFrame];
    self.myLabel.backgroundColor = [UIColor redColor];
    self.myLabel.textColor = [UIColor blueColor];
    self.myLabel.text = @"placeholder";
    //myLabel.attributedText = self.attributedText;
    [self.view addSubview:self.myLabel];
    
    CGRect myUIFieldFrame = CGRectMake(20, 110, 280, 30);
    self.myTextField = [[UITextField alloc] initWithFrame:myUIFieldFrame];
    self.myTextField.placeholder = @"Test";
    self.myTextField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.myTextField];
    
    //CGRect myButtonFrame = CGRectMake(20, 160, 280, 30);
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton addTarget:self action:@selector(didPressButton:) forControlEvents:UIControlEventTouchUpInside];
    myButton.frame = CGRectMake(20, 160, 280, 30);
    myButton.backgroundColor = [UIColor greenColor];
    [myButton setTitle:@"Press me!" forState:UIControlStateNormal];
    [self.view addSubview:myButton];
}
-(void)didPressButton:(UIButton *)button {
    //NSLog(@"Pressed!");
    self.myLabel.text = self.myTextField.text;
    [self.myTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//-(void)drawTextInRect:(CGRect)
//{
//    CGRect myLabel = CGRectMake(20, 250, 200, 60);
//}

@end
