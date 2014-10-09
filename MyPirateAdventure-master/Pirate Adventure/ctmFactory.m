//
//  ctmFactory.m
//  Pirate Adventure
//
//  Created by Chuck McQuilkin on 4/8/14.
//  Copyright (c) 2014 Chuck McQuilkin. All rights reserved.
//

#import "ctmFactory.h"
#import "ctmTile.h"

@implementation ctmFactory

-(NSArray *)tiles

{
    ctmTile *tile1 = [[ctmTile alloc] init];
    tile1.headline = @"Time to cast off!";
    tile1.story = @"Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"2075310775_7b63081fb9_o.jpg"];
    ctmWeapon *bluntedSword = [[ctmWeapon alloc] init];
    bluntedSword.name = @"Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take the sword";
    
    ctmTile *tile2 = [[ctmTile alloc] init];
    tile2.headline = @"One lucky (sea) dog!";
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"StoryImages_0007_Blacksmith.png"];
    ctmArmor *steelArmor = [[ctmArmor alloc] init];
    steelArmor.name = @"Steel";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take Armor";
    
    ctmTile *tile3 = [[ctmTile alloc] init];
    tile3.headline = @"Drop Anchor?";
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"StoryImages_0006_Layer-13.png"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop at Dock";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    ctmTile *tile4 = [[ctmTile alloc] init];
    tile4.headline = @"Polly want a cracker?";
    tile4.story = @"You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"StoryImages_0004_Parrot.png"];
    ctmArmor *parrotArmor = [[ctmArmor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    tile4.actionButtonName = @"Adopt Parrot";
    
    ctmTile *tile5 = [[ctmTile alloc] init];
    tile5.headline = @"Yo dog, you like a gun?";
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"StoryImages_0000_Pistol.png"];
    ctmWeapon *pistolWeapon = [[ctmWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.weapon = pistolWeapon;
    tile5.actionButtonName = @"Take pistol";
    
    ctmTile *tile6 = [[ctmTile alloc] init];
    tile6.headline = @"Moonwalk the plank";
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"StoryImages_0003_Plank.png"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Show no Fear!";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    ctmTile *tile7 = [[ctmTile alloc] init];
    tile7.headline = @"Fight!";
    tile7.story = @"You sight a pirate battle off the coast";
    tile7.backgroundImage = [UIImage imageNamed:@"battleships-remnants-battle-pirate-ships-war.jpg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight those Scum!";
    
    ctmTile *tile8 = [[ctmTile alloc] init];
    tile8.headline = @"Nom nom nom";
    tile8.story = @"The legend of the deep, the mighty kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"StoryImages_0005_Kracken.png"];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Abandon ship!";
    
    ctmTile *tile9 = [[ctmTile alloc] init];
    tile9.headline = @"Suprize Motherf*cker!";
    tile9.story = @"You stumble upon a hidden cave of pirate treasurer";
    tile9.backgroundImage = [UIImage imageNamed:@"StoryImages_0001_Treasure.png"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take the treasure.";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    ctmTile *tile10 = [[ctmTile alloc] init];
    tile10.headline = @"Crap";
    tile10.story = @"A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"original.jpg"];
    tile10.healthEffect = -10;
    tile10.actionButtonName = @"Repel the invaders.";
    
    ctmTile *tile11 = [[ctmTile alloc] init];
    tile11.headline = @"What next?";
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"StoryImages_0002_Loot.png"];
    tile11.healthEffect = +15;
    tile11.actionButtonName = @"Swim deeper.";
    
    ctmTile *tile12 = [[ctmTile alloc] init];
    tile12.headline = @"Good luck!";
    tile12.story = @"Your final faceoff with the fearsome pirate boss";
    tile12.backgroundImage = [UIImage imageNamed:@"StoryImages_0009_Boss.png"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight!";
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    
    [fourthColumn addObject:tile10];
    
    [fourthColumn addObject:tile11];
    
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
    
}
-(ctmCharacter *)character
{
    ctmCharacter *character = [[ctmCharacter alloc] init];
    character.health = 100;
    
    ctmArmor *armor = [[ctmArmor alloc] init];
    armor.name = @"Cloak";
    armor.health = 0;
    character.armor = armor;
    
    ctmWeapon *weapon = [[ctmWeapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

-(ctmBoss *) boss
{
    ctmBoss *boss = [[ctmBoss alloc] init];
    boss.health = 65;
    return boss;
}

@end
