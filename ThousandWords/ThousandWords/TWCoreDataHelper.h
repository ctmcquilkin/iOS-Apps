//
//  TWCoreDataHelper.h
//  ThousandWords
//
//  Created by Charles McQuilkin on 11/6/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface TWCoreDataHelper : NSObject

/* Helper method which returns an NSManagedObjectContext object from our App Delegate */
+(NSManagedObjectContext *)managedObjectContext;

@end