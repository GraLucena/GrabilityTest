//
//  AppDetailViewController.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/9/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "entryModel.h"

@interface AppDetailViewController : UIViewController

@property (strong, nonatomic) entryModel* selectedApp;

@property (weak, nonatomic) IBOutlet UIImageView *appImage;
@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UIButton *getButton;
@property (weak, nonatomic) IBOutlet UILabel *appSummary;
@property (weak, nonatomic) IBOutlet UILabel *appRights;

@end
