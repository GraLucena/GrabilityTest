//
//  AppDetailViewController.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/9/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "AppDetailViewController.h"
#import "attributesModel.h"
#import "nameModel.h"
#import "artistModel.h"
#import "priceModel.h"
#import "summaryModel.h"
#import "rightsModel.h"
#import "imageModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "linkModel.h"

@interface AppDetailViewController ()

@end

@implementation AppDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDetailView];
    // Do any additional setup after loading the view.
}

-(void)loadDetailView{
    
    //Set up the view
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Share"] style:UIBarButtonItemStyleDone target:self action:@selector(share)];
    self.navigationItem.rightBarButtonItem = shareButton;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [_appName setText:_selectedApp.imname.label];
    [_artistName setText:_selectedApp.imartist.label];
    _getButton.layer.cornerRadius = 10.0f;
    _getButton.clipsToBounds = YES;
    [_getButton setTitle:_selectedApp.imPrice.label forState:UIControlStateNormal];
    _appSummary.numberOfLines = 0;
    [_appSummary setText:_selectedApp.summary.label];
    [_appRights setText:_selectedApp.rights.label];
    _appImage.layer.cornerRadius = 10.0f;
    _appImage.clipsToBounds = YES;
    _appImage.layer.borderColor = [UIColor colorWithRed:0.804 green:0.816 blue:0.82 alpha:1].CGColor;
    _appImage.layer.borderWidth = 1.0f;
    NSDictionary *imageDict = (NSDictionary *)_selectedApp.imimage.lastObject;
    NSString *imageURL = [imageDict objectForKey:@"label"];
    [_appImage sd_setImageWithURL:[NSURL URLWithString:imageURL]
                     placeholderImage:nil];
}

-(void)share{
    
    //Share app URL
    NSString *text = @"Look at this awesome App!!!!";
    NSURL *url = [NSURL URLWithString:_selectedApp.link.attributes.href];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:@[text, url]applicationActivities:nil];
    
    controller.excludedActivityTypes = @[UIActivityTypePostToWeibo,
                                         UIActivityTypeMessage,
                                         UIActivityTypeMail,
                                         UIActivityTypePrint,
                                         UIActivityTypeCopyToPasteboard,
                                         UIActivityTypeAssignToContact,
                                         UIActivityTypeSaveToCameraRoll,
                                         UIActivityTypeAddToReadingList,
                                         UIActivityTypePostToFlickr,
                                         UIActivityTypePostToVimeo,
                                         UIActivityTypePostToTencentWeibo,
                                         UIActivityTypeAirDrop];
    
    [self presentViewController:controller animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
