//
//  CategoriesViewController.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/8/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoriesTableViewCell.h"
#import "entryModel.h"
#import "categoryModel.h"
#import "attributesModel.h"
#import "MainViewController.h"

@interface CategoriesViewController ()

@property (strong, nonatomic) NSArray* categoriesArray;

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _categoriesArray = [[NSArray alloc]init];
    [self getCategoriesName];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)getCategoriesName{
    NSMutableArray *allCategoriesArray = [[NSMutableArray alloc]initWithObjects:@"All", nil];

    for (entryModel *app in _apps) {
        [allCategoriesArray addObject:app.category.attributes.label];
    }
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:allCategoriesArray];
    _categoriesArray = [orderedSet array];
    
    return _categoriesArray;
}


#pragma mark - Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _categoriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"categoriesCell";

    CategoriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[CategoriesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.categoryName.text = [_categoriesArray objectAtIndex:indexPath.row];
    cell.categoryImage.image = [UIImage imageNamed:[_categoriesArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad.
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromBottom;
        UIView *containerView = self.view.window;
        [containerView.layer addAnimation:transition forKey:nil];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"CategoryChange"
     object:[_categoriesArray objectAtIndex:indexPath.row]];
    
}

#pragma mark - Navigation
/*
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)done:(id)sender {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad.
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromBottom;
        UIView *containerView = self.view.window;
        [containerView.layer addAnimation:transition forKey:nil];
        [self dismissViewControllerAnimated:NO completion:nil];

    }
}
@end
