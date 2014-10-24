//
//  TableViewController.m
//  Out of this World
//
//  Created by Charles McQuilkin on 10/9/14.
//  Copyright (c) 2014 Charles McQuilkin. All rights reserved.
//

#import "CTMOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "CTMSpaceObject.h"
#import "CTMSpaceImageViewController.h"
#import "CTMSpaceDataViewController.h"

@interface CTMOuterSpaceTableViewController ()

@end

@implementation CTMOuterSpaceTableViewController
#define ADD_SPACE_OBJECTS_KEY @"Added Space Objects Array"


#pragma mark - Lazy Instantiation of Properties

-(NSMutableArray *)planets
{
    if (!_planets) {
        _planets = [[NSMutableArray alloc] init];
    }
    return _planets;
}

-(NSMutableArray *)addedSpaceObjects
{
    if (!_addedSpaceObjects) {
        _addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    return _addedSpaceObjects;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /* Allocate and initialize our planets array */
    //self.planets = [[NSMutableArray alloc] init];
    
    /* Use fast enumeration to iterate through all NSMutableDictionaries in the array returned from the class method allKnownPlanets. First create an NSString with the planet's file name. Use a format string to add the .jpg extension to each planet name. Create a OWSpace object and use the custom initializer initWithData. Pass in both the dictionary and a UIImage object. Add the planet object to the planets array. */
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        CTMSpaceObject *planet = [[CTMSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
    NSArray *myPlanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ADD_SPACE_OBJECTS_KEY];
    for (NSDictionary *dictionary in myPlanetsAsPropertyLists) {
        CTMSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        [self.addedSpaceObjects addObject:spaceObject];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /* The prepareForSegue method is called right before the viewController transition occurs. Notice that we do introspection to ensure that the Segue is being triggered by the UITableViewCell. We then confirm that the destination ViewController is the OWSpaceImageViewController. Finally, we create a variable named nextViewController that points to our destination ViewController. Determine the indexPath of the selected cell and use that indexPath to access a OWSpaceObject in our planet array. Finally set the property spaceobject of the variable nextViewController equal to the selected object. */
    
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[CTMSpaceImageViewController class]])
        {
            CTMSpaceImageViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            CTMSpaceObject *selectedObject;
            
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
            }
            else if (path.section == 1) {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            
            nextViewController.spaceObject = selectedObject;
        }
    }
    
    /* The prepareForSegue method is called right before the viewController transition occurs. Notice that we do introspection to ensure that the Segue is being triggered by the proper sender. In this case we pass in the NSIndexPath of the accessory button pressed. We then confirm that the destination ViewController is the OWSpaceDataViewController. Finally, we create a variable named targetViewController that points to our destination ViewController. Determine the indexPath of the selected cell and use that indexPath to access a OWSpaceObject in our planet array. Finally set the property spaceobject of the variable targetViewController equal to the selected object. */
    
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[CTMSpaceDataViewController class]])
        {
            CTMSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            CTMSpaceObject *selectedObject = self.planets[path.row];
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
            }
            else if (path.section == 1) {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    /* If the destination ViewController is the addSpaceObjectVC we create a variable that points to the OWAddSpaceObjectViewController instance. With this instance we can set the delegate property so that the OWAddSpaceObjectViewController can call the methods defined in its' protocol. */
    if ([segue.destinationViewController isKindOfClass:[CTMAddSpaceObjectViewController class]]){
        CTMAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CTMAddSpaceObjectViewController Delegate

/* Delegate method defined in the OWAddSpaceObjectViewController Protocol. This method dismisses the instance of the OWAddSpaceObjectViewController and presents the OWOuterSpaceTableViewController*/
-(void)didCancel
{
    NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

/* Delegate method defined in the OWAddSpaceObjectViewController Protocol. First we determine if the property of addedSpaceObjects has a value. If it does not we assign memory and initialize the object. Next we add the spaceObject passed into this method as a parameter. Then we dismiss the instance of the OWAddSpaceObjectViewController and presents the OWOuterSpaceTableViewController. Finally, with our updated array we update the TableView. */
-(void)addSpaceObject:(CTMSpaceObject *)spaceObject
{
    if (!self.addedSpaceObjects){
        //self.addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    [self.addedSpaceObjects addObject:spaceObject];
    
    //NSLog(@"addSpaceObject");
    /* Will save to NSUserDefaults here */
    NSMutableArray *spaceObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADD_SPACE_OBJECTS_KEY] mutableCopy];
    
    if(!spaceObjectsAsPropertyLists) spaceObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    
    [spaceObjectsAsPropertyLists addObject:[self spaceObjectAsAPropertyList:spaceObject]];
    
    [[NSUserDefaults standardUserDefaults] setObject:spaceObjectsAsPropertyLists forKey:ADD_SPACE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
    
}

#pragma mark - Helper Methods

-(NSDictionary *)spaceObjectAsAPropertyList:(CTMSpaceObject *)spaceObject
{
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage);
    NSDictionary *dictionary = @{PLANET_NAME : spaceObject.name, PLANET_GRAVITY : @(spaceObject.gravitationalForce), PLANET_DIAMETER : @(spaceObject.diameter), PLANET_YEAR_LENGTH : @(spaceObject.yearLength), PLANET_DAY_LENGTH : @(spaceObject.dayLength), PLANET_TEMPERATURE : @(spaceObject.temperature), PLANET_NUMBER_OF_MOONS : @(spaceObject.numberOfMoons), PLANET_NICKNAME : spaceObject.nickname, PLANET_INTERESTING_FACT : spaceObject.interestFact, PLANET_IMAGE : imageData };
    
    return dictionary;
}

-(CTMSpaceObject *)spaceObjectForDictionary:(NSDictionary *)dictionary
{
    NSData *dataForImage = dictionary[PLANET_IMAGE];
    UIImage *spaceObjectImage = [UIImage imageWithData:dataForImage];
    CTMSpaceObject *spaceObject = [[CTMSpaceObject alloc] initWithData:dictionary andImage:spaceObjectImage];
    return spaceObject;
}

#pragma mark - Table view data source

/* If the addedSpaceObjects array contains any objects create 2 sections. If the addedSpaceObjects array is empty only create 1 section. */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if ([self.addedSpaceObjects count]){
        return 2;
    }
    else {
        return 1;
    }
}

/* If the section is the second section the number of rows should be equal to the count of the addedSpaceObjects Array. Otherwise the section is the first section and the number of rows should be equal the number of objects in the planets array */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 1){
        return [self.addedSpaceObjects count];
    }
    else {
        return [self.planets count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 1){
        //Use new Space object to customize our cell
        CTMSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    else {
        /* Access the OWSpaceObject from our planets array. Use the OWSpaceObject's properties to update the cell's properties.*/
        CTMSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    /* Customize the appearence of the TableViewCells. */
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

#pragma mark UITableView Delegate

/* This method will be called when the user presses the accessory info button the TableViewCells. When the user presses the application should transition using the push segue named "push to space data". */
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
     if(indexPath.section == 1) return YES;
     // Return NO if you do not want the specified item to be editable.
     else return NO;
 }



 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {

     if (editingStyle == UITableViewCellEditingStyleDelete) {
         // Delete the row from the data source
         [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
         NSMutableArray *newSavedSpaceObjectData = [[NSMutableArray alloc] init];
         for (CTMSpaceObject *spaceObject in self.addedSpaceObjects) {
             [newSavedSpaceObjectData addObject:[self spaceObjectAsAPropertyList:spaceObject]];
         }
         [[NSUserDefaults standardUserDefaults] setObject:newSavedSpaceObjectData forKey:ADD_SPACE_OBJECTS_KEY];
         [[NSUserDefaults standardUserDefaults] synchronize];
         
         //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
         [tableView beginUpdates];
         
         [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
         
         if (self.addedSpaceObjects.count == 0) {
             // [NSIndexSet indexSetWithIndex:section]
             [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
         }
         [tableView endUpdates];
         

     }

     else if (editingStyle == UITableViewCellEditingStyleInsert) {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         

     }
 }


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
