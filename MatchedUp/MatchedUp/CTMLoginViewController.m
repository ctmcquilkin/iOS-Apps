//
//  CTMLoginViewController.m
//  MatchedUp
//
//  Created by Charles McQuilkin on 11/14/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMLoginViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface CTMLoginViewController ()

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) NSMutableData *imageData;

@end

@implementation CTMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /* start by hiding our activity indicator until we press the login button */
    self.activityIndicator.hidden = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self updateUserInformation];
        [self performSegueWithIdentifier:@"loginToHomeSegue" sender:self];
    }
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

- (IBAction)loginButtonPressed:(UIButton *)sender
{
    /* Unhide the activity indicator and start animating it */
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    /* Create an array with the information we will request access to from our user. */
    NSArray *permissionsArray = @[@"user_about_me", @"user_interests", @"user_relationships", @"user_birthday", @"user_location", @"user_relationship_details"];
    
    /* Use PFFacebookUtilis to request permission to login with facebook. */
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden = YES;
        if (!user){
            if (!error){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:@"The Facebook Login was Canceled" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
            else {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
        }
        else{
            /* If the sign in is successful we update the users information and perform the segue to the TabBar Controller in the completion block. */
            [self updateUserInformation];
            [self performSegueWithIdentifier:@"loginToHomeSegue" sender:self];
        }
    }];
}

#pragma mark - Helper Method

- (void)updateUserInformation
{
    /* Issue a request to Facebook for the information we asked for access to in the permissions array */
    FBRequest *request = [FBRequest requestForMe];
    
    /* Start the request to Facebook */
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        if (!error){
            /* If we do not get an error in our Facebook request we use its' information to create an NSMutableDictionary named userProfile */
            
            NSDictionary *userDictionary = (NSDictionary *)result;
            
            //create URL
            NSString *facebookID = userDictionary[@"id"];
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1",facebookID]];
            
            NSMutableDictionary *userProfile = [[NSMutableDictionary alloc] initWithCapacity:8];
            if (userDictionary[@"name"]){
                userProfile[kCTMUserProfileNameKey] = userDictionary[@"name"];
            }
            if (userDictionary[@"first_name"]){
                userProfile[kCTMUserProfileFirstNameKey] = userDictionary[@"first_name"];
            }
            if (userDictionary[@"location"][@"name"]){
                userProfile[kCTMUserProfileLocationKey] = userDictionary[@"location"][@"name"];
            }
            if (userDictionary[@"gender"]){
                userProfile[kCTMUserProfileGenderKey] = userDictionary[@"gender"];
            }
            if (userDictionary[@"birthday"]){
                userProfile[kCTMUserProfileBirthdayKey] = userDictionary[@"birthday"];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateStyle:NSDateFormatterShortStyle];
                NSDate *date = [formatter dateFromString:userDictionary[@"birthday"]];
                NSDate *now = [NSDate date];
                NSTimeInterval seconds = [now timeIntervalSinceDate:date];
                int age = seconds / 31536000;
                userProfile[kCTMUserProfileAgeKey] = @(age);
            }
            if (userDictionary[@"interested_in"]){
                userProfile[kCTMUserProfileInterestedInKey] = userDictionary[@"interested_in"];
            }
            if (userDictionary[@"relationship_status"]){
                userProfile[kCTMUserProfileRelationshipStatusKey] = userDictionary[@"relationship_status"];
            }
            if ([pictureURL absoluteString]){
                userProfile[kCTMUserProfilePictureURL] = [pictureURL absoluteString];
            }
            
            /* Save the userProfile dictionary as the value for the key kCTMUserProfileKey */
            [[PFUser currentUser] setObject:userProfile forKey:kCTMUserProfileKey];
            [[PFUser currentUser] saveInBackground];
            
            [self requestImage];
        }
        else {
            NSLog(@"Error in FB request %@", error);
        }
    }];
}

- (void)uploadPFFileToParse:(UIImage *)image
{
    /* Create an NSData object of the image parameter */
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    
    if (!imageData){
        NSLog(@"imageData was not found.");
        return;
    }
    
    /* Create a PFFile with the NSData object and save it*/
    PFFile *photoFile = [PFFile fileWithData:imageData];
    
    [photoFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded){
            /* Create a PFObject of class Photo. Set the current user for its' user key and set the PFFile for its image key. */
            PFObject *photo = [PFObject objectWithClassName:kCTMPhotoClassKey];
            [photo setObject:[PFUser currentUser] forKey:kCTMPhotoUserKey];
            [photo setObject:photoFile forKey:kCTMPhotoPictureKey];
            [photo saveInBackground];
            //            [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            //                NSLog(@"Photo saved successfully");
            //            }];
        }
        else {
            NSLog(@"Save error");
        }
    }];
}

- (void)requestImage
{
    /* Create a query for the Photo class. Then constrain the query to search for only Photos for the current user. Finally, ask for the count of the number of Photos for the current user */
    PFQuery *query = [PFQuery queryWithClassName:kCTMPhotoClassKey];
    [query whereKey:kCTMPhotoUserKey equalTo:[PFUser currentUser]];
    [query countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        if (number == 0)
        {
            /* Access the current user and then allocate and initialize the NSMutableData property named imageData. */
            PFUser *user = [PFUser currentUser];
            self.imageData = [[NSMutableData alloc] init];
            
            /* Create an NSURL object with the facebook picture URL we saved in the updateUserInformation method */
            NSURL *profilePictureURL = [NSURL URLWithString:user[kCTMUserProfileKey][kCTMUserProfilePictureURL]];
            /* Create a URL request using the default cache policy and a timeout of 4.0. */
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:profilePictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:4.0f];
            /* Make our request with NSURLConnection */
            NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
            if (!urlConnection){
                NSLog(@"Failed to Download Picture");
            }
        }
    }];
}

#pragma mark - NSURLConnection Delegate

/* Method will recieve the data from facebook's API and we will build our property imageData with the data. */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.imageData appendData:data];
}

/* When the download finishes finishes upload the photo to Parse with the helper method uploadPFFileToParse. */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //NSLog(@"connectionDidFinishLoading");
    UIImage *profileImage = [UIImage imageWithData:self.imageData];
    [self uploadPFFileToParse:profileImage];
}


@end