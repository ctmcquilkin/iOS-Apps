//
//  TWPhotoDetailViewController.m
//  ThousandWords
//
//  Created by Charles McQuilkin on 11/7/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "TWPhotoDetailViewController.h"
#import "Photo.h"
#import "TWFiltersCollectionViewController.h"

@interface TWPhotoDetailViewController ()

@end

@implementation TWPhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.imageView.image = self.photo.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Filter Segue"]) {
        if ([segue.destinationViewController isKindOfClass:[TWFiltersCollectionViewController class]]){
            /* Set the targetViewController's photo property. The FiltersCollectionViewController will now have access to the photo object. */
            TWFiltersCollectionViewController *targetViewController = segue.destinationViewController;
            targetViewController.photo = self.photo;
        }
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFilterButtonPressed:(UIButton *)sender
{
    
}

- (IBAction)deleteButtonPressed:(UIButton *)sender
{
    [[self.photo managedObjectContext] deleteObject:self.photo];
    
    //NSLog(@"%@ %@", self.photo, [self.photo managedObjectContext]);
    NSError *error = nil;
    
    [[self.photo managedObjectContext] save:&error];
    
    if (error) {
        NSLog(@"error");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
