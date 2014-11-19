//
//  CTMConstants.m
//  MatchedUp
//
//  Created by Charles McQuilkin on 11/13/14.
//
//

#import "CTMConstants.h"

@implementation CTMConstants

#pragma mark - User Class

NSString *const kCTMUserTagLineKey                   = @"tagLine";

NSString *const kCTMUserProfileKey                   = @"profile";
NSString *const kCTMUserProfileNameKey               = @"name";
NSString *const kCTMUserProfileFirstNameKey          = @"firstName";
NSString *const kCTMUserProfileLocationKey           = @"location";
NSString *const kCTMUserProfileGenderKey             = @"gender";
NSString *const kCTMUserProfileBirthdayKey           = @"birthday";
NSString *const kCTMUserProfileRelationshipStatusKey = @"relationship_status";
NSString *const kCTMUserProfileInterestedInKey       = @"interestedIn";
NSString *const kCTMUserProfilePictureURL            = @"pictureURL";
NSString *const kCTMUserProfileAgeKey                = @"age";

#pragma mark - Photo Class

NSString *const kCTMPhotoClassKey = @"Photo";
NSString *const kCTMPhotoUserKey = @"user";
NSString *const kCTMPhotoPictureKey = @"image";

#pragma mark - Activity Class

NSString *const kCTMActivityClassKey                 = @"Activity";
NSString *const kCTMActivityTypeKey                  = @"Type";
NSString *const kCTMActivityFromUserKey              = @"fromUser";;
NSString *const kCTMActivityToUserKey                = @"toUser";
NSString *const kCTMActivityPhotoKey                 = @"photo";
NSString *const kCTMActivityTypeLikeKey              = @"like";
NSString *const kCTMActivityTypeDislikeKey           = @"dislike";

@end