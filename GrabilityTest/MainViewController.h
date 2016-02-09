//
//  MainViewController.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/5/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIConnection.h"
#import "entryModel.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *categoryButton;
@property (strong, nonatomic) NSMutableArray *apps;
@property (strong, nonatomic) NSMutableArray *allCategories;
@property (weak, nonatomic) IBOutlet UITableView *appsTableView;
@property (strong, nonatomic) NSString *category;
@property (weak, nonatomic) IBOutlet UIView *iPhoneView;
@property (weak, nonatomic) IBOutlet UIView *iPadView;
@property (weak, nonatomic) IBOutlet UICollectionView *appsCollectionView;

- (IBAction)showCategories:(id)sender;


@end

