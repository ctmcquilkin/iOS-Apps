//
//  TWCoreDataHelper.m
//  ThousandWords
//
//  Created by Charles McQuilkin on 11/6/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "TWCoreDataHelper.h"
#import <UIKit/UIKit.h>

@implementation TWCoreDataHelper

/* Class method which first gets a variable that points to an instance of our App Delegate. Using this instance we get the NSManagedObjectContext for our application. */
+(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

@end