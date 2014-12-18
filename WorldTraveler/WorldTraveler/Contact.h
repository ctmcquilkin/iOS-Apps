//
//  Contact.h
//  WorldTraveler
//
//  Created by Charles McQuilkin on 12/17/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * formattedPhone;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSManagedObject *venue;

@end
