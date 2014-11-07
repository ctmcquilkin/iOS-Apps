//
//  Photo.h
//  ThousandWords
//
//  Created by Charles McQuilkin on 11/7/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Photo : NSManagedObject

@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) Album *albumBook;

@end
