//
//  TWPhotoCollectionViewCell.m
//  ThousandWords
//
//  Created by Charles McQuilkin on 11/7/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "TWPhotoCollectionViewCell.h"
#define IMAGEVIEW_BORDER_LENGTH 5

@implementation TWPhotoCollectionViewCell

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    //NSLog(@"%f,%f",self.bounds.size.height, self.bounds.size.width);
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+IMAGEVIEW_BORDER_LENGTH, 0+IMAGEVIEW_BORDER_LENGTH, 155-(2 *IMAGEVIEW_BORDER_LENGTH), 155-(2*IMAGEVIEW_BORDER_LENGTH))];
    [self.contentView addSubview:self.imageView];
}

@end
