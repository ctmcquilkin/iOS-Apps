//
//  Menu.h
//  WorldTraveler
//
//  Created by Charles McQuilkin on 12/17/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Menu : NSManagedObject

@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSManagedObject *venue;

@end
