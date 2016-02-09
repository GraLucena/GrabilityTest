//
//  CategoriesViewController.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/8/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray* apps;

- (IBAction)done:(id)sender;

@end
