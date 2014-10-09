//
//  ctmCharacter.h
//  Pirate Adventure
//
//  Created by Chuck McQuilkin on 4/8/14.
//  Copyright (c) 2014 Chuck McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ctmArmor.h"
#import "ctmWeapon.h"


@interface ctmCharacter : NSObject

@property (strong, nonatomic) ctmArmor *armor;
@property (strong, nonatomic) ctmWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
