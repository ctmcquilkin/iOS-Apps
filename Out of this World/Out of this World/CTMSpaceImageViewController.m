//
//  CTMSpaceImageViewController.m
//  Out of this World
//
//  Created by Charles McQuilkin on 10/15/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMSpaceImageViewController.h"

@interface CTMSpaceImageViewController ()

@end

@implementation CTMSpaceImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* Create a UIImageView object in code. Initialize it with the property we passed from the OWOuterSpaceTableViewController */
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.spaceImage];
    
    /* Set the contentsize of the scrollview equal to the size of the image. */
    self.scrollView.contentSize = self.imageView.frame.size;
    
    /* Add the imageView onto the scrollview. */
    [self.scrollView addSubview:self.imageView];
    
    /* Set the scrollview's delegate property to self. This will allow the OWSpaceImageViewController to recieve messages from the UIScrollViewDelegate */
    self.scrollView.delegate = self;
    
    /* Set the maximum and minimum zoom scales to be different so that the user will be able to zoom in and out of the imageView. These repersent the maximum minimum scale factors when we zoom. */
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* We implement the UIScrollView delegate method so that the UIScrollView delegate will know which view on its' scrollview to zoom into and out of. */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end