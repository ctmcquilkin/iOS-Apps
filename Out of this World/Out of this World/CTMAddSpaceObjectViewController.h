//
//  CTMAddSpaceObjectViewController.h
//  Out of this World
//
//  Created by Charles McQuilkin on 10/20/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTMSpaceObject.h"

@protocol CTMAddSpaceObjectViewControllerDelegate <NSObject>

@required

-(void)addSpaceObject: (CTMSpaceObject *)spaceObject;
-(void)didCancel;

@end

@interface CTMAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <CTMAddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;


- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;



@end
