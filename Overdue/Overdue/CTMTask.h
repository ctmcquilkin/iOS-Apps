//
//  CTMTask.h
//  Overdue
//
//  Created by Charles McQuilkin on 10/23/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TASK_TITLE @"tasktitle"
#define TASK_DESCRIPTION @"taskdescription"
#define TASK_DATE @"taskdate"
#define TASK_COMPLETION @"taskcompletion"
#define TASK_OBJECTS_KEY @"taskobjectskey"

@interface CTMTask : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *descriptionText;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) BOOL isCompleted;

-(id)initWithData:(NSDictionary *)data;

@end
