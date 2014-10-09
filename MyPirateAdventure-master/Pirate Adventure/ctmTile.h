//
//  ctmTile.h
//  Pirate Adventure
//
//  Created by Chuck McQuilkin on 4/8/14.
//  Copyright (c) 2014 Chuck McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ctmWeapon.h"
#import "ctmArmor.h"

@interface ctmTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *headline;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) ctmWeapon *weapon;
@property (strong, nonatomic) ctmArmor *armor;
@property (nonatomic) int healthEffect;
@property (nonatomic) int boss;


@end
