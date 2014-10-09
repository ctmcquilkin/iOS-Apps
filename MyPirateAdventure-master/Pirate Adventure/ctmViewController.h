//
//  ctmViewController.h
//  Pirate Adventure
//
//  Created by Chuck McQuilkin on 4/8/14.
//  Copyright (c) 2014 Chuck McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ctmCharacter.h"
#import "ctmBoss.h"

@interface ctmViewController : UIViewController

// iVars (instance variables)

@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) ctmCharacter *character;
@property (strong, nonatomic) ctmBoss *boss;

// IBOutlets

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyHeadline;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionutton; // must be miss-spelled to compile
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;

// IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;


@end
