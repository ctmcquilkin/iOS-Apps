//
//  TWPhotoDetailViewController.h
//  ThousandWords
//
//  Created by Charles McQuilkin on 11/7/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface TWPhotoDetailViewController : UIViewController

@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)addFilterButtonPressed:(UIButton *)sender;
- (IBAction)deleteButtonPressed:(UIButton *)sender;

@end
