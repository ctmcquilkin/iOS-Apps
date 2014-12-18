//
//  Venue.h
//  WorldTraveler
//
//  Created by Charles McQuilkin on 12/17/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contact, FSCategory, Location, Menu;

@interface Venue : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) FSCategory *categories;
@property (nonatomic, retain) Contact *contact;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) Menu *menu;

@end
