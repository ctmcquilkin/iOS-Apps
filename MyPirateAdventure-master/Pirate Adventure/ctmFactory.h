//
//  ctmFactory.h
//  Pirate Adventure
//
//  Created by Chuck McQuilkin on 4/8/14.
//  Copyright (c) 2014 Chuck McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ctmCharacter.h"
#import "ctmBoss.h"

@interface ctmFactory : NSObject

-(NSArray *)tiles;
-(ctmCharacter *)character;
-(ctmBoss *) boss;

@end
