//
//  CTMHomeViewController.m
//  MatchedUp
//
//  Created by Charles McQuilkin on 11/18/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMHomeViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface CTMHomeViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *chatBarButtonItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *settingsBarButtonItem;

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *tagLineLabel;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) IBOutlet UIButton *dislikeButton;

@property (strong, nonatomic) NSArray *photos;
@property (strong, nonatomic) PFObject *photo;
@property (strong, nonatomic) NSMutableArray *activities;

@property (nonatomic) int currentPhotoIndex;
@property (nonatomic) BOOL isLikedByCurrentUser;
@property (nonatomic) BOOL isDislikedByCurrentUser;


@end

@implementation CTMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.likeButton.enabled = NO;
    self.dislikeButton.enabled = NO;
    self.infoButton.enabled = NO;
    
    self.currentPhotoIndex = 0;
    
    PFQuery *query = [PFQuery queryWithClassName: kCTMPhotoClassKey];
    [query includeKey:kCTMPhotoUserKey];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.photos = objects;
            [self queryForCurrentPhotoIndex];
        }
        else {
            NSLog(@"%@", error);
        }
        
    }];
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

#pragma mark - IBActions

- (IBAction)likeButtonPressed:(UIBarButtonItem *)sender
{
    [self checkLike];
}
- (IBAction)infoButtonPressed:(UIBarButtonItem *)sender
{
    //
}
- (IBAction)dislikeButtonPressed:(UIBarButtonItem *)sender
{
    [self checkDislike];
}

- (IBAction)chatBarButtonItemPressed:(UIBarButtonItem *)sender {
}
- (IBAction)settingsBarButtonItemPressed:(UIBarButtonItem *)sender {
}

#pragma mark - Helper Methods

-(void)queryForCurrentPhotoIndex
{
    if ([self.photos count] > 0) {
        self.photo = self.photos[self.currentPhotoIndex];
        PFFile *file = self.photo[kCTMPhotoPictureKey];
        [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:data];
                self.photoImageView.image = image;
                self.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
                self.updateView;
            }
            else  NSLog(@"%@", error);
        }];
        
        PFQuery *queryForLike = [PFQuery queryWithClassName:kCTMActivityClassKey];
        [queryForLike whereKey:kCTMActivityTypeKey equalTo:kCTMActivityTypeLikeKey];
        [queryForLike whereKey:kCTMActivityPhotoKey equalTo:self.photo];
        [queryForLike whereKey:kCTMActivityFromUserKey equalTo:[PFUser currentUser]];
        
        PFQuery *queryForDislike = [PFQuery queryWithClassName:kCTMActivityClassKey];
        [queryForDislike whereKey:kCTMActivityTypeKey equalTo:kCTMActivityTypeDislikeKey];
        [queryForDislike whereKey:kCTMActivityPhotoKey equalTo:self.photo];
        [queryForDislike whereKey:kCTMActivityFromUserKey equalTo:[PFUser currentUser]];
        
        PFQuery *likeAndDislikeQuery = [PFQuery orQueryWithSubqueries:@[queryForLike, queryForDislike]];
        [likeAndDislikeQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                self.activities = [objects mutableCopy];
                
                if ([self.activities count] == 0) {
                    self.isLikedByCurrentUser = NO;
                    self.isDislikedByCurrentUser = NO;
                } else {
                    PFObject *activity = self.activities[0];
                    
                    if ([activity[kCTMActivityTypeKey] isEqualToString:kCTMActivityTypeLikeKey]) {
                        self.isLikedByCurrentUser = YES;
                        self.isDislikedByCurrentUser = NO;
                    }
                    else if ([activity[kCTMActivityTypeKey] isEqualToString:kCTMActivityTypeDislikeKey]) {
                        self.isLikedByCurrentUser = NO;
                        self.isDislikedByCurrentUser = YES;
                    }
                    else {
                        // Some other activity
                    }
                }
                self.likeButton.enabled = YES;
                self.dislikeButton.enabled = YES;
            }
            
        }];
    }
}

-(void)updateView
{
    self.firstNameLabel.text = self.photo[kCTMPhotoUserKey][kCTMUserProfileKey][kCTMUserProfileFirstNameKey];
    self.ageLabel.text = [NSString stringWithFormat:@"%@", self.photo[kCTMPhotoUserKey][kCTMUserProfileKey][kCTMUserProfileAgeKey]];
    self.tagLineLabel.text = self.photo[kCTMPhotoUserKey][kCTMUserTagLineKey];
    
}

-(void)setupNextPhoto
{
    if (self.currentPhotoIndex + 1 < self.photos.count) {
        self.currentPhotoIndex ++;
        [self queryForCurrentPhotoIndex];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No More Users to View" message:@"Check back later for more people" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

-(void)saveLike
{
    PFObject *likeActivity = [PFObject objectWithClassName:kCTMActivityClassKey];
    [likeActivity setObject:kCTMActivityTypeLikeKey forKey:kCTMActivityTypeKey];
    [likeActivity setObject:[PFUser currentUser] forKey:kCTMActivityFromUserKey];
    [likeActivity setObject:[self.photo objectForKey:kCTMPhotoUserKey] forKey:kCTMActivityToUserKey];
    [likeActivity setObject:self.photo forKey:kCTMActivityPhotoKey];
    [likeActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        self.isLikedByCurrentUser = YES;
        self.isDislikedByCurrentUser = NO;
        [self.activities addObject:likeActivity];
        [self setupNextPhoto];
    }];
}

-(void)saveDisLike
{
    PFObject *disLikeActivity = [PFObject objectWithClassName:kCTMActivityClassKey];
    [disLikeActivity setObject:kCTMActivityTypeDislikeKey forKey:kCTMActivityTypeKey];
    [disLikeActivity setObject:[PFUser currentUser] forKey:kCTMActivityFromUserKey];
    [disLikeActivity setObject:[self.photo objectForKey:kCTMPhotoUserKey] forKey:kCTMActivityToUserKey];
    [disLikeActivity setObject:self.photo forKey:kCTMActivityPhotoKey];
    [disLikeActivity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        self.isDislikedByCurrentUser = YES;
        self.isLikedByCurrentUser = NO;
        [self.activities addObject:disLikeActivity];
        [self setupNextPhoto];
    }];
}

-(void)checkLike
{
    if (self.isLikedByCurrentUser) {
        [self setupNextPhoto];
        return;
    }
    else if (self.isDislikedByCurrentUser) {
        for (PFObject *activity in self.activities) {
            [activity deleteInBackground];
        }
        [self.activities removeLastObject];
        [self saveLike];
    }
    else {
        [self saveLike];
    }
}

-(void)checkDislike
{
    if (self.isDislikedByCurrentUser) {
        [self setupNextPhoto];
        return;
    }
    else if (self.isLikedByCurrentUser) {
        for (PFObject *activity in self.activities) {
            [activity deleteInBackground];
        }
        [self.activities removeLastObject];
        [self saveLike];
    }
    else {
        [self saveLike];
    }
}

@end
