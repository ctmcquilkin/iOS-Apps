//
//  ctmViewController.m
//  Pirate Adventure
//
//  Created by Chuck McQuilkin on 4/8/14.
//  Copyright (c) 2014 Chuck McQuilkin. All rights reserved.
//

#import "ctmViewController.h"
#import "ctmFactory.h"
#import "ctmTile.h"

@interface ctmViewController ()

@end

@implementation ctmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ctmFactory *factory = [[ctmFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    self.currentPoint = CGPointMake(0,0);
    //NSLog(@"%f %f", self.currentPoint.x, self.currentPoint.y);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This method makes the status bar text white
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    ctmTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tile.healthEffect == -15){
        self.boss.health = self.boss.health - self.character.damage;
    }
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    if(self.character.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died, please try again!" delegate:nil cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alertView show];
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
    else if(self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory" message:@"You have defeated the boss" delegate:nil cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alertView show];
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reset Game?" message:@"Would you like to reset the game? All progress will be lost." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset", nil];
    
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1){
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
}

#pragma mark - Method Helpers

-(void)updateTile
{
    ctmTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyHeadline.text = tileModel.headline;
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionutton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    }
    else {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(ctmArmor *)armor withWeapons:(ctmWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

@end
