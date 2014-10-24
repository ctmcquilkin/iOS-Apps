//
//  CTMSpaceObject.m
//  Out of this World
//
//  Created by Charles McQuilkin on 10/15/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMSpaceObject.h"
#import "AstronomicalData.h"

@implementation CTMSpaceObject

/* We override the default initializer and call our new designated initializer initWithData. Notice that our initializer returns self. */
-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

/*Custom initializer. This method first calls the super init method which is required of all designated initializers. This ensures our object will be properly setup. We then assign values to the properties of the OWSpaceObject instance. Finally, we return the instance. */
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;
}

@end
