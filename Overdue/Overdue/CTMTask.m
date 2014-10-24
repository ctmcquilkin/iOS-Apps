//
//  CTMTask.m
//  Overdue
//
//  Created by Charles McQuilkin on 10/23/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMTask.h"

@implementation CTMTask

-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self) {
        self.title = data[TASK_TITLE];
        self.descriptionText = data[TASK_DESCRIPTION];
        self.date = data[TASK_DATE];
        self.isCompleted = [data[TASK_COMPLETION] boolValue];
    }
    return self;
}

-(id)init
{
    self = [self initWithData:nil];
    
    return self;
}

@end
