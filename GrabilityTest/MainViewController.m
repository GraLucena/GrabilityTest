//
//  MainViewController.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/5/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "MainViewController.h"
#import "entryModel.h"
#import "manageData.h"
#import "categoriesViewController.h"
#import "Reachability.h"
#import "AppsTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "nameModel.h"
#import "imageModel.h"
#import "attributesModel.h"
#import "AppDetailViewController.h"
#import "categoryModel.h"
#import "AppsCollectionViewCell.h"

@interface MainViewController ()

@property (strong, nonatomic) entryModel *selectedApp;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _category = @"All";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad.
        [_iPhoneView setHidden:YES];
        [_iPadView setHidden:NO];
    }
    else
    {
        // The device is an iPhone.
        [_iPhoneView setHidden:NO];
        [_iPadView setHidden:YES];
    }
    
    
    //Notify when user change Category
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(categoryChange:)
                                                 name:@"CategoryChange" object:nil];
    
    [self prepareViewForCategory:_category];
    [self getApps];
}

-(NSString *)categoryChange:(NSNotification *)notification{
    //Get the category when user changes
    _category = [notification object];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad.
        [self getApps];
    }
    
    return _category;
}

#pragma mark - Prepare view

-(void)prepareViewForCategory:(NSString *)category{
    
    //Set the view
    [_navigationItem setTitle:category];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName: [UIFont fontWithName:@"Noteworthy-Bold" size:17.0]
                              }];
    
    [self.categoryButton
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName: [UIFont fontWithName:@"Noteworthy-Light" size:17.0]
                              } forState:UIControlStateNormal];
}

-(void) getApps{
    
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    //Check if user is offline
    if ((status == ReachableViaWWAN) || (status == ReachableViaWiFi)){
        //If user has internet access fetch apps from API
        [[APIConnection sharedInstance] fetchApps:^(NSMutableArray *apps, NSError *error){
            if (!error) {
                //Save Apps in disk
                [[manageData alloc] saveApps:apps];
                _allCategories = apps;
                if ([_category isEqualToString:@"All"]) {
                    _apps = apps;
                }else{
                    [_apps removeAllObjects];
                    for (entryModel *app in apps) {
                        if ([app.category.attributes.label isEqualToString:_category]) {
                            [_apps addObject:app];
                        }
                    }
                }
                [_appsTableView reloadData];
                [_appsCollectionView reloadData];
            }
        }];
    }else{
        //If user has not internet access fetch apps from disk
        NSMutableArray *allApps = [[NSMutableArray alloc]init];
        allApps = [[manageData alloc] appsSaved];
        _allCategories = allApps;
        if ([_category isEqualToString:@"All"]) {
            _apps = allApps;
        }else{
            [_apps removeAllObjects];
            for (entryModel *app in allApps) {
                if ([app.category.attributes.label isEqualToString:_category]) {
                    [_apps addObject:app];
                }
            }
        }
        [_appsTableView reloadData];
        [_appsCollectionView reloadData];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"appTableViewCell";
    
    AppsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[AppsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    entryModel *appCell = [_apps objectAtIndex:indexPath.row];
    
    cell.appName.text = appCell.imname.label;
    NSDictionary *imageDict = (NSDictionary *)appCell.imimage.firstObject;
    NSString *imageURL = [imageDict objectForKey:@"label"];
    [cell.appImage sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil];
    cell.appImage.layer.cornerRadius = 20.0f;
    cell.appImage.clipsToBounds = YES;
    cell.appImage.layer.borderColor = [UIColor colorWithRed:0.804 green:0.816 blue:0.82 alpha:1].CGColor;
    cell.appImage.layer.borderWidth = 1.0f;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _selectedApp = [_apps objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
}

#pragma mark - Collection View Delegates

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _apps.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"appCollectionViewCell";
    
    AppsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    entryModel *appCell = [_apps objectAtIndex:indexPath.row];
    
    cell.appName.numberOfLines = 0;
    cell.appName.text = appCell.imname.label;
    NSDictionary *imageDict = (NSDictionary *)appCell.imimage.lastObject;
    NSString *imageURL = [imageDict objectForKey:@"label"];
    [cell.appImage sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil];
    cell.appImage.layer.cornerRadius = 10.0f;
    cell.appImage.clipsToBounds = YES;
    cell.appImage.layer.borderColor = [UIColor colorWithRed:0.804 green:0.816 blue:0.82 alpha:1].CGColor;
    cell.appImage.layer.borderWidth = 1.0f;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _selectedApp = [_apps objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
}


#pragma mark - Navigation
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        AppDetailViewController *appDetailVC = [segue destinationViewController];
        [appDetailVC setSelectedApp:_selectedApp];
    }else if ([segue.identifier isEqualToString:@"showCategories"]) {
        CategoriesViewController *categoriesVC = [segue destinationViewController];
        [categoriesVC setApps:_allCategories];
    }
}

- (IBAction)showCategories:(id)sender {
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad.
        [self performSegueWithIdentifier:@"showCategories" sender:self];
    }
    else
    {
        // The device is an iPhone.
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CategoriesViewController *categoriesVC = [sb instantiateViewControllerWithIdentifier:@"categoryViewController"];
        categoriesVC.apps = _allCategories;
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromTop;
        [self.view.window.layer addAnimation:transition forKey:nil];
        [self presentViewController:categoriesVC animated:NO completion:nil];
    }
}

@end
