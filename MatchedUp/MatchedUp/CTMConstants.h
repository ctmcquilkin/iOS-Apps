//
//  CTMConstants.h
//  MatchedUp
//
//  Created by Charles McQuilkin on 11/13/14.
//
//

#import <Foundation/Foundation.h>

@interface CTMConstants : NSObject

/* Global constants so that we will always use the properly formed string for our keys */

#pragma mark - User Class

extern NSString *const kCTMUserProfileKey;
extern NSString *const kCTMUserProfileNameKey;
extern NSString *const kCTMUserProfileFirstNameKey;
extern NSString *const kCTMUserProfileLocationKey;
extern NSString *const kCTMUserProfileGenderKey;
extern NSString *const kCTMUserProfileBirthdayKey;
extern NSString *const kCTMUserProfileRelationshipStatusKey;
extern NSString *const kCTMUserProfileInterestedInKey;
extern NSString *const kCTMUserProfilePictureURL;
extern NSString *const kCTMUserProfileAgeKey;

#pragma mark - Photo Class

extern NSString *const kCTMPhotoClassKey;
extern NSString *const kCTMPhotoUserKey;
extern NSString *const kCTMPhotoPictureKey;

@end
