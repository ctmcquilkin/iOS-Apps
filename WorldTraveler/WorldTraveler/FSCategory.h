//
//  FSCategory.h
//  WorldTraveler
//
//  Created by Charles McQuilkin on 12/18/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FSCategory : NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *venue;

@end
